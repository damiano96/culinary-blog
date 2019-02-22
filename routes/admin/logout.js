let express = require('express');
let router = express.Router();

router.get('/', function(req, res) {
    if (req.session.loggedIN) {
        req.session.loggedIN = false;
        res.redirect('/');
    } else {
        res.redirect('/login');
    }
});

module.exports = router;