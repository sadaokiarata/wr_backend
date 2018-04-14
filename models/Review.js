// Review related APIs
var db = require('../dbconnection');
var Constants = require('../constants');
var User = require('../models/User');
var DEFAULT_PAGESIZE = 10;
var ADMIN_GROUP = 1;
var USER_GROUP = 0;
var Review = {
    // Get all reviews
    getAll: function(req, callback) {
        if (req.offset == undefined || req.offset < 0) req.offset = 0;
        if (req.count == undefined || req.count < 5 || req.count > 40) req.count = DEFAULT_PAGESIZE;
        if (req.city == undefined) {
            callback({ret: -1, err: "City was missing."});
            return;
        }
        User.checkUser(req.token, function(res) {
            if (res.ret < 0) {
                callback({ret: -1, err: res.err});                                                  // fail
            } else {
                if (req.search == undefined || req.search == '')  {
                    db.query("SELECT COUNT(*) AS cnt FROM reviews WHERE origin_id=-1 AND (city_id=? OR TRUE)", [req.city], function(err1, res1) {
                        var cnt = 0;
                        db.query("SELECT reviews.*,users.user_name AS sender_name FROM reviews,users WHERE users.user_id=reviews.writer_id AND reviews.origin_id=-1 AND (city_id=? OR TRUE) ORDER BY reviews.review_time DESC LIMIT ? OFFSET ?", [parseInt(req.city), parseInt(req.count), parseInt(req.offset)], function(err2, res2) {
                            if (res2.length == 0) {
                                callback({ret: 0, total: 0, reviews: []});
                                return;
                            }
                            for (var i = 0; i < res2.length; i++) {
                                var splits = res2[i].review_like.split(',');
                                res2[i].dislike = res2[i].like = 0;
                                res2[i].you_like = res2[i].you_dislike = false;
                                for (var j = 0; j < splits.length; j++) {
                                    if (splits[j].startsWith('-'))res2[i].dislike++;
                                    if (splits[j].startsWith('+'))res2[i].like++;
                                    if (splits[j] == '+' + res.user_id) res2[i].you_like = true;
                                    if (splits[j] == '-' + res.user_id) res2[i].you_dislike = true;
                                }
                                db.query("SELECT ? AS id,reviews.*,users.user_name AS sender_name FROM reviews,users WHERE users.user_id=reviews.writer_id AND reviews.origin_id=? ORDER BY reviews.review_time", [i, res2[i].review_id], function(err3, res3) {
                                    if (res3.length != 0)
                                        res2[res3[0].id].children = res3;
                                    cnt++;
                                    if (cnt == res2.length) {
                                        callback({ret: 0, total: res1[0].cnt, reviews: res2});
                                        return;
                                    }
                                });
                            }
                        });
                    });
                } else {
                    req.search = '%' + req.search + '%';
                    req.offset = parseInt(req.offset);
                    db.query("SELECT DISTINCT idx FROM (SELECT DISTINCT origin_id AS idx,review_time FROM reviews WHERE origin_id!=-1 AND (city_id=? OR TRUE) AND (review_title LIKE ? OR review_content LIKE ?) UNION SELECT review_id,review_time FROM reviews WHERE origin_id=-1 AND (city_id=? OR TRUE) AND (review_title LIKE ? OR review_content LIKE ?)) AS T1 ORDER BY review_time DESC", 
                            [req.city, req.search, req.search, req.city, req.search, req.search], function(err1, res1) {
                        console.log("dddd", err1);
                        var res2 = [];
                        var cnt = 0;
                        var result_count = Math.min(res1.length, req.offset + req.count) - req.offset;
                        if (req.offset + result_count <= req.offset)
                            callback({ret: 0, total: res1.length, reviews: res2});
                        for (var i = req.offset; i < req.offset + result_count; i++) {
                            cnt = 0;
                            db.query("SELECT reviews.*,users.user_name AS sender_name, ? AS IDX FROM reviews,users WHERE users.user_id=reviews.writer_id AND review_id=? ORDER BY reviews.review_time", [i - req.offset, res1[i].idx], function(err5, res5) {
                                var i1 = res5[0].IDX;
                                res2[i1] = res5[0];
                                var splits = res2[res5[0].IDX].review_like.split(',');
                                res2[i1].dislike = res2[i1].like = 0;
                                res2[i1].you_like = res2[i1].you_dislike = false;
                                for (var j = 0; j < splits.length; j++) {
                                    if (splits[j].startsWith('-'))res2[i1].dislike++;
                                    if (splits[j].startsWith('+'))res2[i1].like++;
                                    if (splits[j] == '+' + res.user_id) res2[i1].you_like = true;
                                    if (splits[j] == '-' + res.user_id) res2[i1].you_dislike = true;
                                }
                                db.query("SELECT ? AS id,reviews.*,users.user_name AS sender_name FROM reviews,users WHERE users.user_id=reviews.writer_id AND reviews.origin_id=? ORDER BY reviews.review_time", [i1, res2[i1].review_id], function(err3, res3) {
                                    if (res3.length != 0)
                                        res2[res3[0].id].children = res3;
                                    cnt++;
                                    if (cnt == result_count) {
                                        callback({ret: 0, total: res1.length, reviews: res2});
                                        return;
                                    }
                                });
                            });
                        }
                    });
                }
            }
        }, function(e){console.log(e)});
    },
    // Make new review
    write: function(req, callback) {
        User.checkUser(req.token, function (res) {
            if (res.ret < 0) {
                callback({ret: -1, err: res.err});                                                  // fail
            } else {
                console.log("add review");
                db.query("INSERT INTO reviews(writer_id, review_title, review_content, origin_id, city_id) VALUES(?, ?, ?, ?, ?)", [res.user_id, req.review_title, req.review_content, req.origin_id, req.city_id], function(err, res1) {
                    if (res1 != undefined && res1.affectedRows == 1)
                        callback({ret: 0});
                    else
                        callback({ret: -1, err: "Unknown err"});
                });
            }
        });
    },
    // Delete review
    delete: function(req, callback) {
        User.checkUser(req.token, function (res, err) {
            if (res.ret != 0 || res.group_id != 1) {
                callback({ret: -1, err: "Unknown err"});
                return;
            }
            db.query("DELETE FROM reviews WHERE review_id=?", [req.id], function(err1, res1) {
                if (res1 != undefined)
                    callback({ret: 0});
                else
                    callback({ret: -1, err: "Unknown err"});
            });
        });
    },
    // flag as like/dislike
    like: function(req, callback) {
        var result = {};
        User.checkUser(req.token, function (res) {
            if (res.ret < 0) {
                callback({ret: -1, err: res.err});                                                  // fail
            } else {
                db.query("SELECT * FROM reviews WHERE review_id=?", [parseInt(req.review_id)], function(err, res1) {
                    if (res1 != undefined) {
                        var splits = res1[0].review_like.split(',');
                        var review_like = splits.filter(item => (item != ('+' + res.user_id) && item != ('-' + res.user_id))).join();
                        if (req.is_like == 1)
                            review_like += ',+' + res.user_id;
                        else if (req.is_like == -1)
                            review_like += ',-' + res.user_id;
                        db.query("UPDATE reviews SET review_like=? WHERE review_id=?", [review_like, parseInt(req.review_id)], function (ree2, res2) {
                            callback({ret: 0, res: result});
                        })
                    } else
                        callback({ret: -1, err: "Unknown err"});
                });
            }
        });
    },
};
module.exports = Review;