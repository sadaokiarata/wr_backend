var express = require('express');
var router = express.Router();
var Category = require('../models/Category');

router.get('/', function (req, res, next) {
    Category.getAll(req.query, function (res1) {
        res.json(res1);
    });
});
router.delete('/:id?', function (req, res, next) {
    if (req.params.id != undefined) {
        req.query.category_id = req.params.id;
        Category.delete(req.query, function (result) {
            res.json(result);
        });
    }
});
router.post('/:id?/:act?', function (req, res, next) {
    req.body.category_id = req.params.id;
    if (req.params.id != undefined) {
        if (req.params.act == 'rename')
            Category.rename(req.body, function (result) {
                res.json(result);
            });
        else if (req.params.act == 'credit')
            Category.credit(req.body, function (result) {
                res.json(result);
            });
    } else {
        Category.create(req.body, function (result) {
            res.json(result);
        });
    }
});
module.exports = router;