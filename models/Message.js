// Message related APIs
var db = require('../dbconnection');
var Constants = require('../constants');
var User = require('../models/User');
var DEFAULT_PAGESIZE = 10;
var ADMIN_GROUP = 1;
var USER_GROUP = 0;
var Message = {
    // Get all messages
    getAll: function(req, callback) {
        if (req.offset == undefined || req.offset < 0) req.offset = 0;
        if (req.count == undefined || req.count < 5 || req.count > 40) req.count = DEFAULT_PAGESIZE;
        User.checkUser(req.token, function(res) {
            if (res.ret < 0) {
                callback({ret: -1, err: res.err});                                                  // fail
            } else {
                db.query("SELECT COUNT(*) AS cnt FROM messages, advertisements WHERE messages.post_id = advertisements.post_id AND advertisements.user_id=" + res.user_id,function(err1, res1) {
                    db.query("SELECT messages.*,users.user_name AS sender_name,advertisements.user_id,advertisements.post_name FROM messages,advertisements,users WHERE users.user_id=messages.sender_id AND advertisements.post_id=messages.post_id AND advertisements.user_id=? ORDER BY messages.message_time DESC LIMIT ? OFFSET ?", [parseInt(res.user_id), parseInt(req.count), parseInt(req.offset)], function (err2, res2) {
                        callback({ret: 0, total: res1[0].cnt, messages: res2});    
                    });
                });
            }
        }, function(e){console.log(e)});
    },
    // Get Submessages
    getSubMessage: function(req, callback) {
        if (req.offset == undefined || req.offset < 0) req.offset = 0;
        if (req.count == undefined || req.count < 5 || req.count > 40) req.count = 1000;
        console.log("Post Id", req.post_id);
        if (req.post_id == undefined) {
            callback({ret: -1, err: "Unknown error"});
            return;
        }
        User.checkUser(req.token, function(res) {
            if (res.ret < 0) {
                callback({ret: -1, err: res.err});                                                  // fail
            } else {
                db.query("SELECT COUNT(*) AS cnt FROM messages WHERE post_id=" + req.post_id, function(err1, res1) {
                    console.log(err1, res1);
                    db.query("SELECT * FROM messages WHERE post_id=? ORDER BY messages.message_time DESC LIMIT ? OFFSET ?", [parseInt(req.post_id), parseInt(req.count), parseInt(req.offset)], function (err2, res2) {
                        callback({ret: 0, total: res1[0].cnt, messages: res2});
                    });
                });
            }
        }, function(e){console.log(e)});
    },
    // Get unread messages
    getUnread: function(req, callback) {
        if (req.offset == undefined || req.offset < 0) req.offset = 0;
        if (req.count == undefined || req.count < 5 || req.count > 40) req.count = DEFAULT_PAGESIZE;
        User.checkUser(req.token, function(res) {
            if (res.ret < 0) {
                callback({ret: -1, err: res.err});                                                  // fail
            } else {
                if (res.group_id == ADMIN_GROUP) {
                    db.query("SELECT COUNT(*) AS cnt FROM messages WHERE read_already=0", function(err1, res1) {
                        db.query("SELECT messages.*, u1.user_name AS sender_name, advertisements.user_id, advertisements.post_name, u2.user_name AS poster_name FROM messages LEFT JOIN users u1 ON u1.user_id=messages.sender_id LEFT JOIN advertisements ON advertisements.post_id=messages.post_id LEFT JOIN users u2 ON u2.user_id=advertisements.user_id WHERE read_already=0 ORDER BY message_time DESC LIMIT ? OFFSET ?", [parseInt(req.count), parseInt(req.offset)], function (err2, res2) {
                            callback({ret: 0, total: res1[0].cnt, messages: res2});
                        });
                    });
                } else
                    callback({ret: -1, err: "Access denied"});                                                  // fail
            }
        }, function(e){console.log(e)});
    },
    // Delete one message
    delete: function(req, callback) {
        User.checkUser(req.token, function (res) {
            if (res.ret != 0) {
                callback({ret: -1, err: "Invalid token."});                 // err (Invalid token)
            } else {
                if (req.message_id == undefined)
                    callback({ret: -1, err: "Incomplete data."});           // err (Invalid token)
                else if (res.group_id == ADMIN_GROUP) {
                    db.query("DELETE FROM messages WHERE message_id=?", [req.message_id], function (err, res1) {
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
    open: function(req, callback) {
        User.checkUser(req.token, function (res) {
            if (res.ret != 0) {
                callback({ret: -1, err: "Invalid token."});             // err (Invalid token)
            } else {
                if (req.val == undefined || req.message_id == undefined)
                    callback({ret: -1, err: "Incomplete data."});             // err (Invalid token)
                else {
                    db.query("UPDATE messages SET read_already=? WHERE message_id=?", [parseInt(req.val), parseInt(req.message_id)], function (err, res1) {
                        console.log(err, res1);
                        if (res1 != undefined && res1.affectedRows == 1)
                            callback({ret: 0});
                        else
                            callback({ret: -1, err: "You have no permission."});
                    }, function(v) {
                        console.log("err", v);
                    });
                }
            }
        });
    },
};
module.exports = Message;