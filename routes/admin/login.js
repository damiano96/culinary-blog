let express = require('express');

let router = express.Router();

router.get('/', function(req, res) {
    if(req.session.loggedIN === true) {
        res.redirect('/admin');
    } else {
        res.render('admin/login', {
            error: ''
        });
    }
});

router.post('/', function (req, res) {
   let username = req.body.username;
   let password = req.body.password;
    if (username && password) {
        db.query("SELECT * FROM uzytkownicy WHERE username = ? AND password = ?", [username, password], function (error, results) {
            if(results.length > 0) {
                req.session.loggedIN = true;
                req.session.username = username;
                res.redirect('/admin');
            } else {
                res.render('admin/login', {
                    error: 'Wpisales złe dane! Popraw.'
                });
            }
        })
    }
});

module.exports = router;