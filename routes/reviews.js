var express = require('express');
var router = express.Router();
var Review = require('../models/Review');
var User = require('../models/User');

router.get('/', function (req, res) {
    Review.getAll(req.query, function (result) {
    res.json(result);
  });
});
router.post('/write', function (req, res) {
    Review.write(req.body, function (result) {
        res.json(result);
    });
});
router.delete('/:id', function (req, res) {
    req.query.id = req.params.id;
    Review.delete(req.query, function (result) {
        res.json(result);
    });
});
router.post('/like', function (req, res) {
    Review.like(req.body, function (result) {
        res.json(result);
    });
});
module.exports = router;