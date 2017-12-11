// Category related APIs
var db = require('../dbconnection');
var User = require('../models/User');
var DEFAULT_PAGESIZE = 10;
var Category = {
    // Get all categories
    getAll: function (req, callback) {
        if (req.offset == undefined || req.offset < 0) req.offset = 0;
        if (req.count == undefined)
            req.count = 100;
        else if (req.count <= 0 || req.count > 40)
            req.count = DEFAULT_PAGESIZE;
        db.query("SELECT COUNT(*) AS cnt FROM lookup_category", [], function(err, res, fields) {
            var count = res[0].cnt;
            db.query("SELECT category_id, category_name, created_timestamp, category_credit FROM lookup_category ORDER BY category_id ASC LIMIT ? OFFSET ?", [parseInt(req.count), parseInt(req.offset)], function (err1, res1) {
                callback({ret: 0, total: count, categories: res1});
            });
        });
    },
    // Delete one category
    delete: function(req, callback) {
        User.checkUser(req.token, function (res) {
            if (res.ret != 0) {
                callback({ret: -1, err: "Invalid token."});                 // err (Invalid token)
            } else if (res.group_id != 1) {
                callback({ret: -1, err: "Access Denied."});                 // err (Invalid token)
            } else {
                if (req.category_id == undefined)
                    callback({ret: -1, err: "Incomplete data."});           // err (Invalid token)
                else {
                    db.query("DELETE FROM lookup_category WHERE category_id=?", [req.category_id], function (err, res1) {
                        if (res1 != undefined && res1.affectedRows == 1)
                            callback({ret: 0});
                        else
                            callback({ret: -1, err: "Delete fail"});
                    });
                }
            }
        });
    },
    // Create one category
    create: function(req, callback) {
        User.checkUser(req.token, function (res) {
            if (res.ret != 0) {
                callback({ret: -1, err: "Invalid token."});             // err (Invalid token)
            } else if (res.group_id != 1) {
                callback({ret: -1, err: "Access Denied."});             // err (Invalid token)
            } else {
                if (req.category_name == undefined)
                    callback({ret: -1, err: "Incomplete data."});       // err (Invalid token)
                else {
                    db.query("INSERT INTO lookup_category(category_name) VALUES(?)", [req.category_name], function (err, res1) {
                        if (res1 != undefined && res1.affectedRows == 1)
                            callback({ret: 0});
                        else
                            callback({ret: -1, err: "Created fail"});
                    });
                }
            }
        });
    },
    // Set credit for one city
    credit: function(req, callback) {
        console.log("----------");
        User.checkUser(req.token, function (res) {
            
            if (res.ret != 0) {
                callback({ret: -1, err: "Invalid token."});             // err (Invalid token)
            } else {
                db.query("UPDATE lookup_category SET category_credit=? WHERE category_id=?", [req.val, req.category_id], function(err, res) {
                    if (err == null)
                        callback({ret: 0});                                     // created successfully
                    else
                        callback({ret: -1, err: "Error occured"});              // create failed
                });
            }
        });
    },
    // Rename one category
    rename: function(req, callback) {
        User.checkUser(req.token, function (res) {
            if (res.ret != 0) {
                callback({ret: -1, err: "Invalid token."});             // err (Invalid token)
            } else if (res.group_id != 1) {
                callback({ret: -1, err: "Access Denied."});             // err (Invalid token)
            } else {
                if (req.category_name == undefined)
                    callback({ret: -1, err: "Incomplete data."});             // err (Invalid token)
                else {
                    db.query("UPDATE lookup_category SET category_name=? WHERE category_id=?", [req.category_name, req.category_id], function (err, res1) {
                        if (res1 != undefined && res1.affectedRows == 1)
                            callback({ret: 0});
                        else
                            callback({ret: -1, err: "Rename fail"});
                    });
                }
            }
        });
    },
};
module.exports = Category;