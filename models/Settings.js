// Chatting related APIs
var db = require('../dbconnection');
var Constants = require('../constants');
var User = require('../models/User');
var DEFAULT_PAGESIZE = 10;
var Settings = {
    premium: function (req, callback) {
        User.checkUser(req.token, function (res) {
            if (res.ret != 0)
                callback({ret: -1, err: "Invalid token."});             // err (Invalid token)
            else {
                db.query("UPDATE settings SET setting_value=? WHERE setting_name='premium'", [req.val], function(err2, res2) {
                    if (err2 == null)
                        callback({ret:0});
                    else
                        callback({ret:-1, err:"Unknown error"});
                });
            }
        });
    },
};

module.exports = Settings;