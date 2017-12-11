var express = require('express');
var router = express.Router();
var Settings = require('../models/Settings');
router.post('/premium', function (req, res) {
    console.log("--------");
    Settings.premium(req.body, function (result) {
        res.json(result);
    }); 
});
module.exports = router;