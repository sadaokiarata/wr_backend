var express = require('express');
var router = express.Router();
var Location = require('../models/Location');
var geoip = require('geoip-lite');
router.get('/', function (req, res) {
    Location.getAllLocations(function (res1) {
        var ip = req.headers['x-forwarded-for'] || req.connection.remoteAddress || req.socket.remoteAddress || req.connection.socket.remoteAddress;
        ip = ip.split(',')[0].split(':').slice(-1); //in case the ip returned in a format: "::ffff:146.xxx.xxx.xxx"
        //ip[0] = "108.253.179.240";
        var mine = geoip.lookup(ip[0]);//'165.227.2.220');//45.56.159.198');
        //console.log(ip, mine);
        if (mine != null && mine.country == 'US') {
            mine.stateid = mine.cityid = -1;
            for (var i = 0; i < res1.length; i++) {
                if (res1[i].state_code == mine.region) {
                    mine.stateid = i;
                    for (var j = 0; j < res1[i].cities.length; j++) {
                        if (res1[i].cities[j].city_name == mine.city) {
                            mine.cityid = j;
                            res.json({locations: res1, mine: mine});
                            return;
                        }
                    }
                    res.json({locations: res1, mine: mine});
                    return;            
                }
            }
        } else {
            mine = null;
        }
        res.json({locations: res1, mine: mine});
    });
});

router.get('/states', function (req, res) {
    Location.getAllStates(function (res1) {
        res.json(res1);
    });
});
router.get('/near', function (req, res) {
    Location.near(req.query, function (res1) {
        res.json(res1);
    });
});
router.delete('/state/:id?', function(req, res) {
    if (req.params.id != undefined) {
        req.query.state_id = req.params.id;
        Location.deleteState(req.query, function(result) {
            res.json(result);
        }); 
    }
});
router.delete('/city/:id?', function(req, res) {
    if (req.params.id != undefined) {
        req.query.city_id = req.params.id;
        Location.deleteCity(req.query, function(result) {
            res.json(result);
        }); 
    }
});
router.post('/addstate', function(req, res) {
    Location.addState(req.body, function(result) {
        res.json(result);
    });
});
router.post('/addcity', function(req, res) {
    Location.addCity(req.body, function(result) {
        res.json(result);
    });
});
router.post('/setPosition', function(req, res) {
    Location.setPosition(req.body, function(result) {
        res.json(result);
    });
});
router.post('/setCredit', function(req, res) {
    console.log("credit1", req.body.val);
    Location.setCredit(req.body, function(result) {
        console.log("credit2");
        res.json(result);
    });
});
module.exports = router;