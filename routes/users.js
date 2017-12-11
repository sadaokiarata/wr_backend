var express = require('express');
var router = express.Router();
var User = require('../models/User');

/* GET users listing. */
router.get('/11', function(req, res, next) {
  res.send('respond with a resource');
  User.sendMail(function (req, res, next) {
    
  });
});
router.post('/pay', function (req, res) {
  User.pay(req.body, function(result) {
      res.json(result);
  })
});
router.post('/login', function(req, res, next) {
  User.login(req.body, function(result) {
    res.json(result);
  });
});
router.post('/changepwd', function(req, res, next) {
  User.changePwd(req.body, function(result) {
    res.json(result);
  });
});
router.post('/register', function(req, res, next) {
  User.addUser(req.body, function (result) {
    res.json(result);
  });
});
router.post('/verify', function(req, res, next) {
  User.verify(req.query, function(result) {
    res.json(result);
  })
});
router.post('/resend', function(req, res, next) {
  User.resend(req.query, function(result) {
    res.json(result);
  })
});
router.post('/', function(req, res, next) {
  User.getAllUsers(req.body, function (result) {
    res.json(result);
  });
});
router.delete('/:id?', function(req, res, next) {
  if (req.params.id != undefined) {
    req.query.user_id = req.params.id;
    User.deleteUser(req.query, function(result){
      res.json(result);
    }); 
  }
});
router.get('/forget', function(req, res, next) {
  User.forget(req.query, function(result) {
    res.json(result);
  });
});
router.post('/resetpwd', function(req, res, next) {
  User.resetPwd(req.body, function(result) {
    res.json(result);
  });
});
router.get('/:id?/:act?', function (req, res, next) {
  if (req.params.id != undefined) {
    req.query.user_id = req.params.id;
    if (req.params.act != undefined) {
      if (req.params.act == 'open')
        req.query.value = 1;
      else if (req.params.act == 'close')
        req.query.value = 0;
      else if (req.params.act == 'suspend') {
        User.suspend(req.query, function(result) {
          res.json(result);
          return;
        })
        return;
      } else if (req.params.act == 'addcredit') {
        User.addcredit(req.query, function(result) {
          res.json(result);
          return;
        })
        return;
      } else {
        res.json({ret:-1});
        return;
      }
      User.openUser(req.query, function(result) {
        res.json(result);
      });
    }
  } else {
    res.json({ret: -1, err: "Unknown"});
  }
});
module.exports = router;