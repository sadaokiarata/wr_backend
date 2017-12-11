var express = require('express');
var router = express.Router();
var Report = require('../models/Report');
var User = require('../models/User');

router.get('/', function (req, res, next) {
  Report.getAll(req.query, function (result) {
    res.json(result);
  });
});
router.get('/unread', function (req, res, next) {
  Report.getUnread(req.query, function (result) {
    res.json(result);
  });
});
router.delete('/:id?', function (req, res, next) {
  if (req.params.id != undefined) {
      req.query.report_id = req.params.id;
      Report.delete(req.query, function (result) {
          res.json(result);
      });
  } else {
      res.json({ret: -1, err: "Unknown action"});
  }
});
router.get('/:id?/:act?', function (req, res, next) {
  if (req.params.id != undefined) {
    if (req.params.act != undefined) {
        if (req.params.act == 'open' || req.params.act == 'close') {
            req.query.report_id = req.params.id;
            req.query.val = 0;
            if (req.params.act == 'open')
                req.query.val = 1;                 
            Report.open(req.query, function (result) {
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