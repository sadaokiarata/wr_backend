// Advertisement related APIs
var DEFAULT_PAGESIZE = 10;
var DEFAULT_PREMIUM_PAGESIZE = 12;
var db = require('../dbconnection');
var Constants = require('../constants');
var User = require('../models/User');
var schedule = require('node-schedule');
var googleMap = require('@google/maps');
var stripe = require('stripe')(Constants.stripe_token);
const sendmail = require('sendmail')();
var googleMapsClient = googleMap.createClient({key: 'AIzaSyCVJcNmGMvum9Hlv5Xl86Pwh1S5nkkdnho'});

var addr = googleMapsClient.geocode({address: "Tokyo Japan"}, function (err, response) {
    if (response.json.results.length > 0) {
        var location = response.json.results[0].geometry.location;
        console.log("postADD,", err, location.lat, location.lng);
    }
});

var Advertisement = {
    // Make stripe payment for one advertisement
    pay: function (req, callback) {
        var chargeData = {
            amount: req.amount,
            source: req.st_token.id,
            currency: 'usd',
            description: 'Whorub',
            statement_descriptor: 'WHORUB',
        };
        stripe.charges.create(chargeData, function(err, charge) {
            if (err != null) {
                console.log("stripe", err);
                callback({ret: -1, err: "payment"});
            } else {
                callback({ret: 0});
            }
        });
    },
    // Get all advertisements
    getAllAds: function (req, callback) {
        if (req.offset == undefined || req.offset < 0) req.offset = 0;
        if (req.count == undefined || req.count < 5 || req.count > 40) req.count = DEFAULT_PAGESIZE;
        var additionalQuery = "";
        if (req.city != undefined)
            additionalQuery = ' AND advertisements.post_city=' + req.city;
        if (req.cate != undefined)
            additionalQuery += " AND advertisements.category=" + req.cate;
        if (req.search != undefined && req.search != '') {
            var seSQL = " LIKE '%" + req.search + "%' ";
            additionalQuery += " AND (advertisements.post_name" + seSQL + "OR advertisements.post_title" + seSQL + "OR advertisements.post_desc" + seSQL + 
                "OR advertisements.url" + seSQL + "OR advertisements.phone" + seSQL + "OR advertisements.addr" + seSQL + ")";
        }
        db.query("SELECT COUNT(*) AS cnt FROM advertisements, lookup_city, lookup_category, users WHERE paid=1 AND lookup_city.city_id = advertisements.post_city AND lookup_category.category_id = advertisements.category AND advertisements.opened=1 AND users.user_id = advertisements.user_id " + additionalQuery, function(err, res) {
            if (res == undefined) {
                callback({ret: -1, err: "Unknown Error"});
                return;
            }
            db.query("SELECT advertisements.*, lookup_city.city_name, lookup_category.category_name, users.user_name FROM advertisements, lookup_city, lookup_category, users WHERE paid=1 AND lookup_city.city_id = advertisements.post_city AND lookup_category.category_id = advertisements.category AND advertisements.opened=1 AND users.user_id = advertisements.user_id " + additionalQuery + " ORDER BY repost_time DESC LIMIT ? OFFSET ?", [parseInt(req.count), parseInt(req.offset)], function (err, res1) {
                if (res1 != undefined)
                    callback({ret: 0, total: res[0].cnt, ads: res1});             // err (Invalid token)
                else
                    callback({ret: -1, err: "Unknown Error"});
            });
        });
    },
    // Get all my advertisements
    getMyAds: function (req, callback) {
        if (req.offset == undefined || req.offset < 0) req.offset = 0;
        if (req.count == undefined || req.count < 5 || req.count > 40) req.count = DEFAULT_PAGESIZE;
        User.checkUser(req.token, function (res) {
            if (res.ret != 0) {
                callback({ret: -1, err: "Invalid token."});             // err (Invalid token)
            } else {
                db.query("SELECT COUNT(*) AS cnt FROM advertisements,lookup_city,lookup_category WHERE paid=1 AND user_id=? AND lookup_city.city_id=advertisements.post_city AND lookup_category.category_id=advertisements.category", [res.user_id], function(err, res1, fields) {
                    db.query("SELECT advertisements.*,lookup_city.city_name,lookup_category.category_name FROM advertisements,lookup_city,lookup_category WHERE paid=1 AND user_id=? AND lookup_city.city_id=advertisements.post_city AND lookup_category.category_id = advertisements.category ORDER BY post_time DESC LIMIT ? OFFSET ?", [res.user_id, parseInt(req.count), parseInt(req.offset)], function (err, res2) {
                        callback({ret: 0, total: res1[0].cnt, ads: res2});
                    });
                });
            }
        });
    },
    // Get all premium advertisements
    getPremiumAds: function (req, callback) {
        if (req.offset == undefined || req.offset < 0) req.offset = 0;
        if (req.count == undefined || req.count < 5 || req.count > 40) req.count = DEFAULT_PREMIUM_PAGESIZE;
        db.query("SELECT COUNT(*) FROM advertisements,lookup_city,lookup_category WHERE paid=1 AND premium_open=1 AND advertisements.opened=1 AND lookup_city.city_id=advertisements.post_city AND lookup_category.category_id=advertisements.category AND advertisements.post_city=? AND advertisements.category=?", [req.city, req.cate], function(err, res1, fields) {
            db.query("SELECT advertisements.*,lookup_city.city_name,lookup_category.category_name FROM advertisements, lookup_city, lookup_category WHERE paid=1 AND premium_open=1 AND advertisements.opened=1 AND lookup_city.city_id=advertisements.post_city AND lookup_category.category_id = advertisements.category AND advertisements.post_city=? AND advertisements.category=? ORDER BY premium_time DESC LIMIT ? OFFSET ?", [req.city, req.cate, parseInt(req.count), parseInt(req.offset)], function (err, res2) {
                callback({ret: 0, total: res1[0].cnt, premiums: res2});
            });
        });
    },
    // post one advertisement
    postAd: function(req, callback) {
        //console.log(req);
        User.checkUser(req.token, function (res) {
            if (res.ret != 0) {
                callback({ret: -1, err: "Invalid token."});             // err (Invalid token)
            } else {
                if (req.post_title == undefined || req.post_desc == undefined)//req.post_name == undefined
                    callback({ret: -1, err: "Incomplete data."});       // err (Invalid token)
                else {
                    if (req.addr != undefined && req.addr != '') {
                        googleMapsClient.geocode({address: req.addr}, function (err, response) {
                            if (response.json.results.length > 0) {
                                var location = response.json.results[0].geometry.location;
                                req.latitude = location.lat;
                                req.longitude = location.lng;
                                //console.log("postADD,", err, location.lat, location.lng);
                            }
                            db.query("INSERT INTO advertisements(post_id, post_name, post_title, post_desc, url, phone, " + 
                            "contact_method, email, show_email, work_hour1, work_hour2, repost_interval, repost_count, addr, " + 
                            "user_id, category, post_city, latitude, longitude, premium_open, premium_period, premium_interval, movetotop_times) " +
                            "VALUES(NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", 
                            [req.post_name, req.post_title, req.post_desc, req.url, req.phone, req.contact_method, req.email, req.show_email, req.work_hour1, 
                            req.work_hour2, req.repost_interval, req.repost_count, req.addr, res.user_id, req.category_id, req.post_city, 
                            req.latitude, req.longitude, req.premium_open, req.premium_period, req.premium_interval, req.movetotop_times], function (err, res1) {
                                if (res1 == undefined) 
                                    callback({ret: -1, err: "Couldn't post"});
                                else
                                    callback({ret: 0, post_id: res1.insertId});
                            });
                        });
                    } else {
                        db.query("INSERT INTO advertisements(post_id, post_name, post_title, post_desc, url, phone, " + 
                        "contact_method, email, show_email, work_hour1, work_hour2, repost_interval, repost_count, addr, " + 
                        "user_id, category, post_city, latitude, longitude, premium_open, premium_period, premium_interval, movetotop_times) " +
                        "VALUES(NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", 
                        [req.post_name, req.post_title, req.post_desc, req.url, req.phone, req.contact_method, req.email, req.show_email, req.work_hour1, 
                        req.work_hour2, req.repost_interval, req.repost_count, req.addr, res.user_id, req.category_id, req.post_city, 
                        req.latitude, req.longitude, req.premium_open, req.premium_period, req.premium_interval, req.movetotop_times], function (err, res1) {
                            if (res1 == undefined) 
                                callback({ret: -1, err: "Couldn't post"});
                            else
                                callback({ret: 0, post_id: res1.insertId});
                        });
                    }
                }
            }
        });
    },
    // Update location for advertisement
    updatePos: function(req, callback) {
        db.query("UPDATE advertisements SET latitude=?, longitude=? WHERE post_id=?", [parseFloat(req.latitude), parseFloat(req.longitude), req.post_id], function (err, res1) {
            if (res1 != undefined && res1.affectedRows == 1)
                callback({ret: 0});
            else
                callback({ret: -1, err: "You have no permission or post doesn't exist."});
        }, function(v) {
            console.log("err", v);
        });
    },
    // Get one advertisement
    view: function(req, callback) {
        //User.checkUser(req.token, function (res) {
        //    if (res.ret == -1) {
        //        callback({ret: -1, err: "Invalid token."});             // err (Invalid token)
        //    } else {
                db.query("SELECT advertisements.*, lookup_city.city_name, lookup_state.state_name, lookup_category.category_name,lookup_category.category_credit, lookup_city.credit AS city_credit, lookup_city.state_id, lookup_city.city_id FROM advertisements, lookup_city, lookup_state, lookup_category " + 
                        "WHERE advertisements.post_id=? AND lookup_city.city_id=advertisements.post_city AND lookup_city.state_id=lookup_state.state_id AND advertisements.category=lookup_category.category_id", 
                        [req.post_id], function (err, res1) {
                    if (res1.length == 1)
                        callback({ret: 0, ad: res1[0]});
                    else
                        callback({ret: -1, err: "Doesn\'t exist"});
                });
        //    }
        //});
    },
    // Make a report for advertisement
    report: function(req, callback) {
        User.checkUser(req.token, function (res) {
            if (res.ret != 0 && req.token != "")
                callback({ret: -1, err: "Invalid token."});             // err (Invalid token)
            else {
                if (req.token = "")
                    res.user_id = -1;
                db.query("INSERT INTO reports(post_id, reporter_id, report_content) VALUES(?, ?, ?)", [req.post_id, res.user_id, req.report_content], function(err, res1) {
                    if (res1 != undefined && res1.affectedRows == 1)
                        callback({ret: 0});
                    else
                        callback({ret: -1, err: "Unknown err"});
                });
            }
        });
    },
    // send message for advertisement
    message: function(req, callback) {
        User.checkUser(req.token, function (res) {
            if (res.ret != 0 && req.token != "")
                res.user_id = 100000;
            db.query("INSERT INTO messages(post_id, sender_id, message_content) VALUES(?, ?, ?)", [req.post_id, res.user_id, req.message_content], function(err, res1) {
                if (res1 != undefined && res1.affectedRows == 1)
                    callback({ret: 0});
                else
                    callback({ret: -1, err: "Unknown err"});
            });
        });
    },
    // send share for advertisement
    share: function(req, callback) {
        if (req.token == '') {
            callback({ret:-1, err: "Login needed."});
        }
        User.checkUser(req.token, function (res) {
            db.query("SELECT advertisements.*, lookup_city.city_name, lookup_state.state_name, lookup_category.category_name,lookup_category.category_credit, lookup_city.credit AS city_credit, lookup_city.state_id, lookup_city.city_id,users.user_name FROM advertisements, users, lookup_city, lookup_state, lookup_category " + 
                "WHERE advertisements.post_id=? AND advertisements.user_id=users.user_id AND lookup_city.city_id=advertisements.post_city AND lookup_city.state_id=lookup_state.state_id AND advertisements.category=lookup_category.category_id", 
                [req.post_id], function (err, res1) {
                if (res1.length == 1) {
                    db.query("SELECT user_name FROM users WHERE token=?", [req.token], function(err2, res2) {
                        var htmlLink = req.email_content + '<br><h1>' + res1[0].post_title + '</h1>';
                        htmlLink += '<br>' + res1[0].post_desc + '<br>';
                        htmlLink += '<br>' + 'To view this posting, please click the link below<br>';
                        htmlLink += "<a href=http://www.whorub.com/#/view/" + res1[0].post_id + ">http://www.whorub.com/#/view/" + res1[0].post_id + "</a>"; 
                        var mailOptions = {
                            from: 'admin@whorub.com',
                            to: req.email_to,
                            subject: res2[0].user_name + ' shared ad in Whorub',
                            html: htmlLink,
                        };
                        console.log(mailOptions);
                        sendmail(mailOptions, function(error, reply) {
                            if (callback != null) {
                                if (error == null)
                                    callback({ret:0});
                                else
                                    callback({ret:-1});
                            }
                        });
                        //callback({ret:0});
                    });
                } else
                    callback({ret: -1, err: "Doesn\'t exist"});
            });
        });
    },
    // Open/close one advertisement
    open: function(req, callback) {
        User.checkUser(req.token, function (res) {
            if (res.ret != 0) {
                callback({ret: -1, err: "Invalid token."});             // err (Invalid token)
            } else {
                if (req.val == undefined || req.post_id == undefined)
                    callback({ret: -1, err: "Incomplete data."});             // err (Invalid token)
                else {
                    db.query("UPDATE advertisements SET opened=? WHERE (user_id=? OR ?=1) AND post_id=?", [parseInt(req.val), res.user_id, res.group_id, req.post_id], function (err, res1) {
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
    // Delete one advertisement
    delete: function(req, callback) {
        User.checkUser(req.token, function (res) {
            if (res.ret != 0) {
                callback({ret: -1, err: "Invalid token."});                 // err (Invalid token)
            } else {
                if (req.post_id == undefined)
                    callback({ret: -1, err: "Incomplete data."});           // err (Invalid token)
                else {
                    db.query("DELETE FROM advertisements WHERE post_id=? AND (user_id=? OR ?=1)", [req.post_id, res.user_id, res.group_id], function (err, res1) {
                        if (res1.affectedRows == 0) {
                            callback({ret: -1, err: "You have no permission."});
                        } else {
                            callback({ret: 0});
                        }
                    });
                }
            }
        });
    },
    // Update one advertisement
    update: function(req, callback) {
        User.checkUser(req.token, function (res) {
            if (res.ret != 0) {
                callback({ret: -1, err: "Invalid token."});             // err (Invalid token)
            } else {
                if (req.post_title == undefined || req.post_desc == undefined)
                    callback({ret: -1, err: "Incomplete data."});             // err (Invalid token)
                else {
                    db.query("UPDATE advertisements SET post_name=?, post_title=?, post_desc=?, url=?, phone=?, contact_method=?, email=?, show_email=?, work_hour1=?" + 
                        ", work_hour2=?, repost_interval=?, repost_count=?, addr=?, user_id=?, category=?, post_city=? WHERE post_id=?", 
                            [req.post_name, req.post_title, req.post_desc, req.url, req.phone, req.contact_method, req.email, req.show_email, parseInt(req.work_hour1), parseInt(req.work_hour2), 
                                parseInt(req.repost_interval), parseInt(req.repost_count), req.addr, res.user_id, req.category, req.post_city, req.post_id], function (err, res1) {
                        callback({ret: 0});
                    });
                }
            }
        });
    },
    // Repost one advertisement
    repost: function(req, callback) {
        User.checkUser(req.token, function (res) {
            if (res.ret != 0) {
                callback({ret: -1, err: "Invalid token."});             // err (Invalid token)
            } else {
                db.query("UPDATE advertisements SET repost_time=NOW(),opened=1,repost_count=repost_count-1 WHERE post_id=? AND repost_count>0", [req.post_id], function (err1, res1) {
                    if (res1.affectedRows == 1) {
                        db.query("SELECT repost_time, repost_count FROM advertisements WHERE post_id=?", [req.post_id], function (err2, res2) {
                            callback({ret: 0, repost_time: res2[0].repost_time, repost_count: res2[0].repost_count});
                        });
                    } else
                        callback({ret: -1, err: "No repost count"});
                });
            }
        });
    }
};
// Move ad on top when move_times is bigger than 0
var MoveOnTopJob = schedule.scheduleJob({second:0}, function() {
    console.log('Move on top!');
    db.query("UPDATE advertisements SET repost_time=NOW(),movetotop_times=movetotop_times-1 WHERE opened=1 AND movetotop_times>0 AND MINUTE(NOW())=MINUTE(post_time)", function (err, res) {
        console.log("moveontop err:", err, res.affectedRows);
    });
});
// Repost ad automatically
var RepostJob = schedule.scheduleJob({second:0, minute:0}, function() {
    console.log('Repost Job!');
    db.query("UPDATE advertisements SET repost_time=NOW(),repost_count=repost_count-1 WHERE opened=1 AND ((HOUR(NOW()) + 16) % 24)=work_hour1 AND repost_count>0 AND MOD(DATEDIFF(NOW(),post_time),repost_interval)=0", function (err, res) {
        console.log("repost err:", err, res.affectedRows);
    });
    db.query("UPDATE advertisements SET premium_open=0 WHERE premium_open=1 AND HOUR(TIMEDIFF(NOW(), post_time))>premium_period*168*30", function (err, res) {});
});
// Cycling premium ads
var PremiumJob = schedule.scheduleJob({second:0}, function() {
    console.log('Premium Job!');
    var min = new Date().getMinutes();
    db.query("SELECT post_id FROM advertisements WHERE premium_open=1 ORDER BY premium_time ASC LIMIT 1", function (err1, res1) {
        if (res1.length == 1) {
            db.query("UPDATE advertisements SET premium_time=NOW() WHERE post_id=" + res1[0].post_id, function (err, res) {
                console.log("Premium Job err:", err, res.affectedRows);
            });
        }
    });
});

module.exports = Advertisement;