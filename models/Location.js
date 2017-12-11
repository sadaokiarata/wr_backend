// Location related APIs
var db = require('../dbconnection');
var User = require('../models/User');
var Location = {
    // Get all states and cities in them
    getAllLocations: function(callback) {
        var index = 0;
        db.query("SELECT state_id, state_name, state_code, state_slug, state_popul FROM lookup_state WHERE state_online=1", [], function (err, res) {
            var count = res.length;
            res.state_count = res.length;
            res.city_count = 0;
            for (var i = 0; i < count; i++) {
                res[i].cities = [];
                db.query("SELECT ? as id, city_id, city_name, city_slug, latitude, longitude, credit FROM lookup_city WHERE state_id=? AND opened=1 ORDER BY city_name", [i, res[i].state_id], function (err, res2) {
                    if (res2.length != 0)
                        res[res2[0].id].cities = res2;
                    res.city_count += res2.length;
                    index++;
                    if (index == count)
                        callback(res);
                });
            }
        });
    },
    // Get all states
    getAllStates: function(callback) {
        db.query("SELECT state_id, state_name FROM lookup_state WHERE state_online=1", [], function (err, res) {
            callback(res);
        });
    },
    near: function(req, callback) {
        db.query("SELECT latitude, longitude FROM lookup_city WHERE city_id=?", [req.city_id], function (err, res) {
            console.log(req, res, err);
            if (err == null) {
                db.query("SELECT lookup_city.*,lookup_state.state_name FROM lookup_city,lookup_state WHERE city_id!=? AND ABS(latitude-?) < 1 AND ABS(longitude-?)<1 AND lookup_city.state_id=lookup_state.state_id", [req.city_id, res[0].latitude, res[0].longitude], function (err2, res2) {
                    callback(res2);
                });
            } else {
                callback({ret: -1, err: "No data"});
            }
        });
    },
    // Delete one state from the list
    deleteState: function(req, callback) {
        User.checkUser(req.token, function (res) {
            if (res.ret != 0) {
                callback({ret: -1, err: "Invalid token."});             // err (Invalid token)
            } else {
                db.query("DELETE FROM lookup_state WHERE state_id=?", [req.state_id], function (err, res) {
                    if (err == null)
                        callback({ret: 0});
                    else
                        callback({ret: -1, err: "Can't be deleted"});              // creat failed
                });
            }
        });
    },
    // Delete one city from the city list
    deleteCity: function(req, callback) {
        User.checkUser(req.token, function (res) {
            if (res.ret != 0) {
                callback({ret: -1, err: "Invalid token."});             // err (Invalid token)
            } else {
                db.query("DELETE FROM lookup_city WHERE city_id=?", [req.city_id], function (err, res) {
                    if (err == null)
                        callback({ret: 0});
                    else
                        callback({ret: -1, err: "Can't be deleted"});              // creat failed
                });
            }
        });
    },
    // Add new city
    addCity: function(req, callback) {
        User.checkUser(req.token, function (res) {
            if (res.ret != 0) {
                callback({ret: -1, err: "Invalid token."});             // err (Invalid token)
            } else {
                db.query("INSERT INTO lookup_city(city_name, city_slug, state_id) VALUES(?, ?, ?)", [req.city_name, req.city_slug, req.state_id], function(err, res) {
                    if (err == null)
                        callback({ret: 0});                                     // created successfully
                    else
                        callback({ret: -1, err: "Already Exist"});              // creat failed
                });
            }
        });
    },
    // Add new state
    addState: function(req, callback) {
        User.checkUser(req.token, function (res) {
            if (res.ret != 0) {
                callback({ret: -1, err: "Invalid token."});             // err (Invalid token)
            } else {
                db.query("INSERT INTO lookup_state(state_name, state_slug, state_online) VALUES(?, ?, 1)", [req.state_name, req.state_slug], function(err, res) {
                    if (err == null)
                        callback({ret: 0});                                     // created successfully
                    else
                        callback({ret: -1, err: "Already Exist"});              // creat failed
                });
            }
        });
    },
    // Set credit for one city
    setCredit: function(req, callback) {
        User.checkUser(req.token, function (res) {
            if (res.ret != 0) {
                callback({ret: -1, err: "Invalid token."});             // err (Invalid token)
            } else {
                db.query("UPDATE lookup_city SET credit=? WHERE city_id=?", [req.val, req.city_id], function(err, res) {
                    if (err == null)
                        callback({ret: 0});                                     // created successfully
                    else
                        callback({ret: -1, err: "Error occured"});              // create failed
                });
            }
        });
    },
    // Change position for one Location
    setPosition: function(req, callback) {
        User.checkUser(req.token, function (res) {
            if (res.ret != 0) {
                callback({ret: -1, err: "Invalid token."});             // err (Invalid token)
            } else {
                if (req.lat == undefined && req.lng == undefined)
                    callback({ret: -1, err: 'Invalid value'});
                var v = "";
                if (req.lat != undefined)
                    v = "latitude=" + parseFloat(req.lat);
                if (req.lng != undefined) {
                    v += (((v == "")? "": ",") + "longitude=" + parseFloat(req.lng));
                }
                db.query("UPDATE lookup_city SET " + v + " WHERE city_id=?", [req.city_id], function(err, res) {
                    if (err == null)
                        callback({ret: 0});                                     // created successfully
                    else
                        callback({ret: -1, err: "Error occured"});              // create failed
                });
            }
        });
    }
};
module.exports = Location;