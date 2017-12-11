var express = require('express');
var router = express.Router();
var Message = require('../models/Message');
var User = require('../models/User');

router.get('/', function (req, res) {
  Message.getAll(req.query, function (result) {
    res.json(result);
  });
});
router.get('/unread', function (req, res) {
  Message.getUnread(req.query, function (result) {
    res.json(result);
  });
});
router.delete('/:id?', function (req, res) {
  if (req.params.id != undefined) {
      req.query.message_id = req.params.id;
      Message.delete(req.query, function (result) {
          res.json(result);
      });
  } else {
      res.json({ret: -1, err: "Unknown action"});
  }
});
router.post('/', function (req, res) {

});
router.get('/:id?/:act?', function (req, res) {
  if (req.params.id != undefined) {
    if (req.params.act != undefined) {
        if (req.params.act == 'open' || req.params.act == 'close') {
            req.query.message_id = req.params.id;
            req.query.val = 0;
            if (req.params.act == 'open')
                req.query.val = 1;                 
            Message.open(req.query, function (result) {
                res.json(result);
            });
        } else {
            res.json({ret: -1, err: "Unknown action"});
        }
    } else {
        res.json({ret: -1, err: "Unknown id"});
    }
  }
});
module.exports = router;