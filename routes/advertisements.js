var express = require('express');
var fileUpload = require('express-fileupload');
//var multiparty = require('multiparty');
var fs = require('fs');
var app = express();
var router = express.Router();
var Advertisement = require('../models/Advertisement');
var Message = require('../models/Message');
var ja = require('jpeg-autorotate');
router.use(fileUpload());
router.get('/test', function (req, res) {
    res.send('Advertisement test');
});
router.get('/myads', function (req, res) {
    Advertisement.getMyAds(req.query, function (result) {
        res.json(result);
    });
});
router.post('/repost', function (req, res) {
    Advertisement.repost(req.body, function (result) {
        res.json(result);
    });
});
router.get('/premium', function (req, res) {
    Advertisement.getPremiumAds(req.query, function (result) {
        res.json(result);
    });
});
router.delete('/:id?', function (req, res) {
    if (req.params.id != undefined) {
        req.query.post_id = req.params.id;
        Advertisement.delete(req.query, function (result) {
            res.json(result);
        });
    } else {
        res.json({ret: -1, err: "Unknown action"});
    }
});
router.post('/', function (req, res) {
    Advertisement.postAd(req.body, function (result) {
        res.json(result);
    });
});
router.post('/update', function (req, res) {
    Advertisement.update(req.body, function (result) {
        res.json(result);
    });
});
router.post('/pay', function (req, res) {
    Advertisement.pay(req.body, function(result) {
        res.json(result);
    })
});
router.post('/:id?/:act?/', function(req, res) {
    var options = {quality: 100};
    if (req.params.id != undefined) {
        if (req.params.act.startsWith('upload')) {
            var path = "imgs/img" + req.params.id + "_" + req.params.act.charAt(6) + ".jpg";
            console.log(path);
            var profile = req.files['profile'];
            if (profile != undefined) {
                fs.writeFile(path, profile.data, function(err) {
                    console.log("File err", err, path);
                    ja.rotate(path, options, function(error, buffer, orientation) {
                        console.log("File err2", error, orientation);
                        if (error == null && orientation != ja.errors.correct_orientation)
                            fs.writeFile(path, buffer, function(err) {});
                        res.json({res: 100});
                    })
                });
            }
        } else if (req.params.act == 'upload') {
            var profile = req.files['profile0'];
            if (profile != undefined) {
                var path = "imgs/img" + req.params.id + "_0.jpg";
                console.log(path);
                fs.writeFile(path, profile.data, function(err) {
                    path = "imgs/img" + req.params.id + "_0.jpg";
                    console.log("File err", err, path);
                    ja.rotate(path, options, function(error, buffer, orientation) {
                        console.log("File err2", error, orientation);
                        if (error == null && orientation != ja.errors.correct_orientation)
                            fs.writeFile(path, buffer, function(err) {});
                    })
                });
            }
        } else if (req.params.act == 'report') {
            req.body.post_id = req.params.id;
            Advertisement.report(req.body, function (result) {
                res.json(result);
            });
        } else if (req.params.act == 'message') {
            req.body.post_id = req.params.id;
            Advertisement.message(req.body, function (result) {
                res.json(result);
            })
        } else if (req.params.act == 'share') {
            req.body.post_id = req.params.id;
            Advertisement.share(req.body, function (result) {
                res.json(result);
            })
        } else if (req.params.act == 'repost') {
            req.body.post_id = req.params.id;
            Advertisement.repost(req.body, function (result) {
                res.json(result);
            });
        } else
            res.json({ret: -1, err: 'Unknown action'});
    }
});
router.get('/:id?/image/:subid?', function (req, res) {
    var path = "imgs/img" + req.params.id + "_" + req.params.subid + ".jpg"
    if (req.params.id == undefined || !fs.existsSync(path))
        path = "noimg.png";
    
    var img = fs.readFileSync(path);
    res.writeHead(200, {'Content-Type': 'image/jpg'});
    res.end(img, 'binary');
});

router.get('/:id?/:act?', function (req, res) {
    if (req.params.id != undefined) {
        if (req.params.act != undefined) {
            if (req.params.act == 'open' || req.params.act == 'close') {
                req.query.post_id = req.params.id;
                req.query.val = 0;
                if (req.params.act == 'open')
                    req.query.val = 1;                 
                Advertisement.open(req.query, function (result) {
                    res.json(result);
                });
            } else if (req.params.act == 'updatePos') {
                req.query.post_id = req.params.id;
                Advertisement.updatePos(req.query, function (result) {
                    res.json(result);
                });
            } else if (req.params.act == 'messages') {
                req.query.post_id = req.params.id;
                Message.getSubMessage(req.query, function (result) {
                    res.json(result);
                });
            } else {
                res.json({ret: -1, err: "Unknown action"});
            }
        } else {
            req.query.post_id = req.params.id;
            Advertisement.view(req.query, function (result) {
                res.json(result);
            });
        }
    } else {
        Advertisement.getAllAds(req.query, function (result) {
            res.json(result);
        });
    }
});

module.exports = router;