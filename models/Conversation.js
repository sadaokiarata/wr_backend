// Chatting related APIs
var db = require('../dbconnection');
var Constants = require('../constants');
var User = require('../models/User');
var ws = require('nodejs-websocket');
var DEFAULT_PAGESIZE = 10;
var connections = [];
// Create server for message notifications
var server = ws.createServer(function (conn) {
    var token = conn.path.substring(1);
    conn.token = token;
    console.log("New connection-----------------------", token);
    User.checkUser(token, function(res) {
        if (res.ret < 0) {
            conn.user_id = -1;
        } else {
            conn.user_id = res.user_id;
        }
        conn.sendText("Connected");
        connections.push(conn);
    });
    conn.on("close", function (code, reason) {
        console.log(connections.length);
        console.log("Connection closed----------------------");
        connections.pop(conn);
        console.log(connections.length);
    });
    conn.on("error", function (err) {
        console.log(connections.length);
        console.log("errr");
        connections.pop(conn);
        console.log(connections.length);
    });
}).listen(30090);
var Conversation = {
    // Get all contacts for one advertisement
    contacts: function (req, callback) {
        User.checkUser(req.token, function (res) {
            if (res.ret != 0)
                callback({ret: -1, err: "Invalid token."});             // err (Invalid token)
            else {
                var dir = (res.user_id == req.contact_id)? 1: 0;
                db.query("SELECT * FROM (SELECT users.user_id,users.user_name FROM conversations,users WHERE conversations.post_id=? AND conversations.contact_id=users.user_id GROUP BY users.user_name) AS T1 LEFT JOIN (SELECT * FROM (SELECT contact_id, COUNT(*) AS cnt FROM conversations WHERE post_id=? AND conv_read=0 AND conv_direction=? GROUP BY contact_id,conv_read) AS T2) AS T3 ON T1.user_id=T3.contact_id", [req.post_id, req.post_id, dir], function(err2, res2) {
                    callback({ret:0, contacts: res2});
                });
            }
        });
    },
    // Get all conversations for one contact
    conversations: function (req, callback) {
        User.checkUser(req.token, function (res) {
            if (res.ret != 0)
                callback({ret: -1, err: "Invalid token."});
            else {
                db.query("SELECT conversations.post_id,max(conversations.conv_time) AS ti, advertisements.post_title FROM conversations,advertisements WHERE conversations.contact_id=? OR (advertisements.post_id=conversations.post_id AND advertisements.user_id=?) GROUP BY conversations.post_id ORDER BY ti DESC", [res.user_id, res.user_id], function(err2, res2) {
                    db.query("SELECT conversations.post_id,max(conversations.conv_time) AS ti,advertisements.post_title FROM conversations,advertisements WHERE conversations.conv_read=0 AND ((conversations.contact_id=? AND conversations.conv_direction=1) OR (advertisements.post_id=conversations.post_id AND advertisements.user_id=? AND conversations.conv_direction=0)) GROUP BY conversations.post_id", [res.user_id, res.user_id], function(err3, res3) {
                        callback({ret:0, convs: res2, unreads: res3});
                    });
                });
            }
        });
    },
    // Update read status for conversations
    conv: function (req, callback) {
        User.checkUser(req.token, function (res) {
            if (res.ret != 0)
                callback({ret: -1, err: "Invalid token."});             // err (Invalid token)
            else {
                db.query("SELECT * FROM conversations WHERE conversations.post_id=? AND conversations.contact_id=? ORDER BY conv_time", [req.post_id, req.contact_id], function(err2, res2) {
                    var dir = (res.user_id == req.contact_id)? 1: 0;
                    console.log(req.post_id, req.contact_id, dir);
                    db.query("UPDATE conversations SET conv_read=1 WHERE post_id=? AND contact_id=? AND conv_direction=?", [req.post_id, req.contact_id, dir]);
                    // for (var i = 0; i < connections.length; i++) {
                    //     if (connections[i].user_id == req.contact_id || connections[i].user_id == res.user_id) {
                    //         connections[i].sendText("UPDATE", function(){});
                    //     }
                    // }
                    callback({ret:0, convs: res2});
                });
            }
        });
    },
    // Send one message
    send: function (req, callback) {
        User.checkUser(req.token, function (res) {
            if (res.ret != 0)
                callback({ret: -1, err: "Invalid token."});
            else {
                var isAdmin = (res.user_id == req.contact_id)? 0: 1;
                db.query("INSERT INTO conversations(post_id, contact_id, conv_content, conv_direction) VALUES(?,?,?,?)", [req.post_id, req.contact_id, req.conv_content, isAdmin], function(err1, res1) {
                    callback({ret:0});
                    db.query("SELECT user_id FROM advertisements WHERE post_id=?", [req.post_id], function(err2, res2) {
                        console.log(res2[0].user_id);
                        for (var i = 0; i < connections.length; i++) {
                            if (connections[i].user_id == req.contact_id || connections[i].user_id == res2[0].user_id) {
                                connections[i].sendText("UPDATE", function(){});
                            }
                        }
                    });
                    
                });
            }
        });
    }
};

module.exports = Conversation;