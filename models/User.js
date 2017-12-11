var db = require('../dbconnection');
var Constants = require('../constants');
var EM = require('../email-dispatcher');
//var nodemailer = require('nodemailer');
var stripe = require('stripe')(Constants.stripe_token);

const sendmail = require('sendmail')();
var DEFAULT_PAGESIZE = 10;
var ADMIN_GROUP = 1;
var USER_GROUP = 0;
var User = {
    pay: function (req, callback) {
        User.checkUser(req.token, function(res) {
            if (req.st_token != undefined) {
                var chargeData = {
                    amount: req.amount,
                    source: req.st_token.id,
                    currency: 'usd',
                    description: 'Whorub',
                    statement_descriptor: 'WHORUB',
                };
                stripe.charges.create(chargeData, function(err, charge) {
                    if (err != null) {
                        callback({ret: -1, err: "payment"});
                    } else {
                        db.query("UPDATE users SET budget=budget+? WHERE token=?", [req.amount, req.token], function (err1, res1, fields1) {
                            if (err1 != null || res1.affectedRows == 0) {
                                callback({ret: -1,});
                            } else {
                                db.query("SELECT budget FROM users WHERE token=?", [req.token], function (err2, res2, fields2) {
                                    callback({ret: 0, budget: res2[0].budget});
                                })
                            }
                        });
                    }
                });
            } else {
                db.query("UPDATE users SET budget=budget+? WHERE token=?", [req.amount, req.token], function (err1, res1, fields1) {
                    if (err1 != null || res1.affectedRows == 0) {
                        callback({ret: -1});
                    } else {
                        db.query("SELECT budget FROM users WHERE token=?", [req.token], function (err2, res2, fields2) {
                            db.query("UPDATE advertisements SET paid=1 WHERE post_id=?", [req.postid], function (err3, res3, fields3) {
                                callback({ret: 0, budget: res2[0].budget});
                            })
                        })
                    }
                });
            }
        });
    },
    addcredit: function (req, callback) {
        User.checkUser(req.token, function(res) {
            if (res.group_id != ADMIN_GROUP) {
                callback({ret: -1, err: "Access denied"});
                return;
            } else {
                console.log("add credit");
                db.query("UPDATE users SET budget=budget+? WHERE user_id=?", [req.amount, req.user_id], function (err1, res1, fields1) {
                    if (err1 != null || res1.affectedRows == 0) {
                        callback({ret: -1});
                        return;
                    } else {
                        callback({ret: 0});
                        return;
                    }
                });
            }
        });
    },
    addUser: function (req, callback) {
        db.query("SELECT user_id FROM users WHERE user_name=?", [req.email], function (err, res, fields) {
            var codeStr = Math.floor(Math.random() * 8999 + 1000);
            if (res.length == 0) {
                User.sendMail("Account Verification", req.email, codeStr, function(res) {
                    if (res.ret == -1) {
                        callback({ret: -1, err: "Email error."});             // err (already existed)
                    } else {
                        db.query("INSERT INTO users(user_name, password, token, verifycode) VALUES(?, md5(?), md5(?), ?)", [req.email, req.password, req.email, codeStr]);
                        callback({ret: 0});                                     // created successfully
                    }
                });
            } else {
                callback({ret: -1, err: "Already exist."});             // err (already existed)
            }
        });
    },
    deleteUser: function(req, callback) {
        User.checkUser(req.token, function(res) {
            if (res.ret < 0) {
                callback({ret: -1, err: res.err});                                                  // fail
            } else {
                if (res.user_id == req.user_id) {
                    callback({ret: -1, err: "Can't delete oneself"});                               // fail
                } else if (res.group_id == ADMIN_GROUP) {
                    console.log(req.user_id, res.user_id);
                    db.query("DELETE FROM users WHERE user_id=?", [req.user_id], function (err, res1, fields) {
                        callback({ret: 0});
                    });
                } else
                    callback({ret: -1, err: "Access denied"});                                      // fail
            }
        });
    },
    suspend: function(req, callback) {
        console.log("suspened");
        User.checkUser(req.token, function(res) {
            if (res.ret < 0) {
                callback({ret: -1, err: res.err});                                                  // fail
            } else {
                if (res.group_id == ADMIN_GROUP) {
                    if (req.days > 0) {
                        db.query("UPDATE users SET suspended=TIMESTAMPADD(DAY,?,CURRENT_TIMESTAMP()) WHERE user_id=?", [req.days, req.user_id], function (err, res1, fields) {
                            callback({ret: 0});
                        });
                    } else {
                        db.query("UPDATE users SET suspended=NULL WHERE user_id=?", [req.user_id], function (err, res1, fields) {
                            callback({ret: 0});
                        });
                    }
                } else
                    callback({ret: -1, err: "Access denied"});                                      // fail
            }
        });
    },
    forget: function(req, callback) {
        db.query("SELECT user_id FROM users WHERE user_name=?", [req.email], function (err, res, fields) {
            if (res.length == 1) {
                var codeStr = Math.floor(Math.random() * 8999 + 1000);
                db.query('UPDATE users SET forget=? WHERE user_name=?', [codeStr, req.email], function (err, res, fields) {
                    User.sendMail("Password Recovery", req.email, codeStr, function(res) {
                        callback({ret: res.ret})
                    });
                });
            } else 
                callback({ret: -1, err: "User doesn't exist"});                                      // fail
        });
    },
    getAllUsers: function(req, callback) {
        if (req.offset == undefined || req.offset < 0) req.offset = 0;
        if (req.count == undefined || req.count < 5 || req.count > 40) req.count = DEFAULT_PAGESIZE;
        User.checkUser(req.token, function(res) {
            if (res.ret < 0) {
                callback({ret: -1, err: res.err});                                                  // fail
            } else {
                if (res.group_id == ADMIN_GROUP) {
                    var sql_state = '';
                    if (req.search != undefined && req.search != '') {
                        sql_state = " WHERE user_name LIKE '%" + req.search +"%' ";
                    }
                    db.query("SELECT COUNT(*) AS cnt FROM users" + sql_state, [], function(err, res1, fields) {
                        db.query("SELECT * FROM users " + sql_state + "LIMIT ? OFFSET ?", [req.count, req.offset], function (err, res2, fields) {
                            callback({ret: 0, total: res1[0].cnt, users: res2});
                        });
                    });
                } else
                    callback({ret: -1, err: "Access denied"});                                                  // fail
            }
        }, function(e){console.log(e)});
    },
    login: function (req, callback) {
        db.query("SELECT *,(suspended iS NULL OR suspended < CURRENT_TIMESTAMP()) AS op FROM users WHERE user_name=? AND password=md5(?)", [req.email, req.password], function (err, res, fields) {
            if (res.length != 0) {
                if (res[0].group_id != ADMIN_GROUP) {
                    if (res[0].op == 0) {
                        callback({ret: -1, err: "Account is locked."});
                        return;
                    } else if (res[0].verifycode != 0) {
                        callback({ret: -2, token: res[0].token, err: "Account is not verified yet."});
                        return;
                    }
                }
                db.query("SELECT * FROM settings", [], function(err2, res2) {
                    callback({ret: 0, token: res[0].token, username: res[0].user_name, budget: res[0].budget, type: res[0].group_id, user_id: res[0].user_id, premium_price: res2[0].setting_value});      // success                    
                });
            } else {
                callback({ret: -1, err: "Invalid username or password."});                                                  // fail
            }
        });
    },
    changePwd: function (req, callback) {
        if (req.newpwd.length < 3) {
            callback({ret: -1, err: "Password must be longer than 3"});                        // fail (password is too short)
        } else {
            db.query("SELECT token, user_name FROM users WHERE token=? AND password=md5(?)", [req.token, req.oldpwd], function (err, res, fields) {
                if (res.length == 0) {                  // fail
                    callback({ret: -1, err: "Invalid req"});
                } else {                                // success
                    db.query("UPDATE users SET password=md5(?) WHERE token=?", [req.newpwd, req.token]);
                    callback({ret: 0});
                }
            });
        }
    },
    resetPwd: function (req, callback) {
        if (req.newpwd.length < 3) {
            callback({ret: -1, err: "Password must be longer than 3"});                        // fail (password is too short)
        } else {
            db.query("UPDATE users SET password=md5(?) WHERE user_name=? AND forget=?", [req.newpwd, req.email, parseInt(req.verifycode)], function(err, res, fields) {
                if (err != null || res.affectedRows == 0)
                    callback({ret: -1, err: "Incorrect info"});
                else
                    callback({ret: 0});
            });
        }
    },
    openUser: function (req, callback) {
        User.checkUser(req.token, function (res) {
            if (res.ret >= 0 && res.group_id == ADMIN_GROUP) {              // only if admin
                db.query("UPDATE users SET opened=? WHERE user_id=?", [req.value, req.user_id], function(err, res1, fields) {
                    if (res1.affectedRows == 0)
                        callback({ret: -1, err: "Not exist"});
                    else
                        callback({ret: 0});
                });
            } else {
                callback({ret: -1, err: "Access denied."});
            }
        });
    },
    verify: function (req, callback) {
        User.checkUser(req.token, function (res) {
            console.log("verify", res.user_id, req.verify);
            if (res.ret == -2) {              // only if admin
                db.query("UPDATE users SET verifycode=0 WHERE user_id=? AND verifycode=?", [parseInt(res.user_id), parseInt(req.verify)], function(err1, res1, fields) {
                    if (res1.affectedRows == 0)
                        callback({ret: -1, err: "Code is incorrect."});
                    else {
                        db.query("SELECT * FROM users WHERE token=?", [req.token], function (err2, res2, fields) {
                            callback({ret: 0, token: res2[0].token, username: res2[0].user_name, budget: res2[0].budget, type: res2[0].group_id, user_id: res2[0].user_id});      // success                    
                        });
                    }
                });
            } else {
                callback({ret: -1, err: "Invalid user."});
            }
        });
    },
    resend: function(req, callback) {
        User.checkUser(req.token, function (res) {
            if (res.ret == -2) {              // only if admin
                console.log(req.token);
                db.query("SELECT * FROM users WHERE token=?", [req.token], function (err2, res2, fields) {
                    User.sendMail("Account Verification", res2[0].user_name, res2[0].verifycode, function(res3) {
                        if (res3.ret == -1) {
                            callback({ret: -1, err: "Email error."});             // err (already existed)
                        } else {
                            callback({ret: 0});                                     // created successfully
                        }
                        return;
                    });
                });
            } else {
                callback({ret: -1, err: "Invalid user."});
            }
        });
    },
    checkUser: function (token, callback) {
        db.query("SELECT user_id, user_name, group_id, verifycode,(suspended iS NULL OR suspended < CURRENT_TIMESTAMP()) AS op FROM users WHERE token=?", [token], function (err, res, fields) {
            if (res.length == 0) {
                callback({ret: -1, err: 'User not exist or suspended'});
            } else if (res[0].op == 0 && res[0].group_id != ADMIN_GROUP) {
                callback({ret: -3, err: 'User is blocked by admin'});
            } else if (res[0].verifycode != 0) {
                callback({ret: -2, err: 'Mail is not verified yet', user_id:res[0].user_id});
            } else {
                res[0].ret = 0;
                callback(res[0]);
            }
        });
    },
    sendMail: function (mode, emailTo, codeStr, callback) {
        var htmlLink = '<h1>Code for ' + mode + '</h1><br>' + 'Your verify code : ' + codeStr + '<br>';
        var mailOptions = {
            from: 'verify@whorub.com',
            to: emailTo,
            subject: 'Verify code for Whorub',
            html: htmlLink,
        };
        /*var transport = nodemailer.createTransport('smtps://wanderstover%40gmail.com:rnrmf2015@smtp.gmail.com/?pool=true');
        transport.sendMail(mailOptions, function(error, info) {
            if (error) {
                callback({ret:-1});
            } else {
                callback({ret:0});
            }
            transport.close();
        });*/
        sendmail(mailOptions, function(error, reply) {
            if (callback != null) {
                if (error == null)
                    callback({ret:0});
                else
                    callback({ret:-1});
            }
        });
    }
};
//User.sendMail("Test", "seoyura@outlook.com", "333", null);
module.exports = User;