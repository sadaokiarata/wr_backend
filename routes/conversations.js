var express = require('express');
var router = express.Router();
var Conversation = require('../models/Conversation');
router.get('/test', function (req, res) {
    res.send('Advertisement test');
});

router.get('/contacts', function (req, res) {
    Conversation.contacts(req.query, function (result) {
        res.json(result);
    }); 
});
router.get('/conv', function (req, res) {
    Conversation.conv(req.query, function (result) {
        res.json(result);
    });
});
router.get('/conversations', function (req, res) {
    Conversation.conversations(req.query, function (result) {
        res.json(result);
    });
});
router.get('/send', function (req, res) {
    Conversation.send(req.query, function (result) {
        res.json(result);
    });
});

module.exports = router;