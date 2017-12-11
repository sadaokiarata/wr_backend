// Report related APIs
var db = require('../dbconnection');
var Constants = require('../constants');
var User = require('../models/User');
var DEFAULT_PAGESIZE = 10;
var ADMIN_GROUP = 1;
var USER_GROUP = 0;
var Report = {
    // Get all reports
    getAll: function(req, callback) {
        if (req.offset == undefined || req.offset < 0) req.offset = 0;
        if (req.count == undefined || req.count < 5 || req.count > 40) req.count = DEFAULT_PAGESIZE;
        User.checkUser(req.token, function(res) {
            if (res.ret < 0) {
                callback({ret: -1, err: res.err});                                                  // fail
            } else {
                if (res.group_id == ADMIN_GROUP) {
                    db.query("SELECT COUNT(*) AS cnt FROM reports", function(err1, res1) {
                        db.query("SELECT reports.*, u1.user_name as reporter_name, advertisements.user_id, advertisements.post_name, u2.user_name as poster_name FROM reports LEFT JOIN users u1 ON u1.user_id=reports.reporter_id LEFT JOIN advertisements ON advertisements.post_id=reports.post_id LEFT JOIN users u2 ON u2.user_id=advertisements.user_id ORDER BY report_time DESC LIMIT ? OFFSET ?", [parseInt(req.count), parseInt(req.offset)], function (err2, res2) {
                            callback({ret: 0, total: res1[0].cnt, reports: res2});    
                        });
                    });
                } else
                    callback({ret: -1, err: "Access denied"});                                                  // fail
            }
        }, function(e){console.log(e)});
    },
    // Get unread reports
    getUnread: function(req, callback) {
        if (req.offset == undefined || req.offset < 0) req.offset = 0;
        if (req.count == undefined || req.count < 5 || req.count > 40) req.count = DEFAULT_PAGESIZE;
        User.checkUser(req.token, function(res) {
            if (res.ret < 0) {
                callback({ret: -1, err: res.err});                                                  // fail
            } else {
                if (res.group_id == ADMIN_GROUP) {
                    db.query("SELECT COUNT(*) AS cnt FROM reports WHERE read_already=0", function(err1, res1) {
                        db.query("SELECT reports.*, u1.user_name as reporter_name, advertisements.user_id, advertisements.post_name, u2.user_name as poster_name FROM reports LEFT JOIN users u1 ON u1.user_id=reports.reporter_id LEFT JOIN advertisements ON advertisements.post_id=reports.post_id LEFT JOIN users u2 ON u2.user_id=advertisements.user_id WHERE read_already=0 ORDER BY report_time DESC LIMIT ? OFFSET ?", [parseInt(req.count), parseInt(req.offset)], function (err2, res2) {
                            callback({ret: 0, total: res1[0].cnt, reports: res2});
                        });
                    });
                } else
                    callback({ret: -1, err: "Access denied"});                                                  // fail
            }
        }, function(e){console.log(e)});
    },
    // remove one report
    delete: function(req, callback) {
        User.checkUser(req.token, function (res) {
            if (res.ret != 0) {
                callback({ret: -1, err: "Invalid token."});                 // err (Invalid token)
            } else {
                if (req.report_id == undefined)
                    callback({ret: -1, err: "Incomplete data."});           // err (Invalid token)
                else if (res.group_id == ADMIN_GROUP) {
                    db.query("DELETE FROM reports WHERE report_id=?", [req.report_id], function (err, res1) {
                        if (res1.affectedRows == 0) {
                            callback({ret: -1, err: "You have no permission."});
                        } else {
                            callback({ret: 0});
                        }
                    });
                } else {
                    callback({ret: -1, err: "You have no permission."});
                }
            }
        });
    },
    // Open one report
    open: function(req, callback) {
        User.checkUser(req.token, function (res) {
            if (res.ret != 0) {
                callback({ret: -1, err: "Invalid token."});             // err (Invalid token)
            } else {
                if (req.val == undefined || req.report_id == undefined)
                    callback({ret: -1, err: "Incomplete data."});             // err (Invalid token)
                else if (res.group_id == ADMIN_GROUP) {
                    db.query("UPDATE reports SET read_already=? WHERE report_id=?", [parseInt(req.val), parseInt(req.report_id)], function (err, res1) {
                        if (res1 != undefined && res1.affectedRows == 1)
                            callback({ret: 0});
                        else
                            callback({ret: -1, err: "You have no permission."});
                    }, function(v) {
                        console.log("err", v);
                    });
                } else {
                    callback({ret: -1, err: "You have no permission."});
                }
            }
        });
    },
};
module.exports = Report;