const fs = require('fs');
let express = require('express');
let router = express.Router();

router.get('/', function (req, res) {
    if(req.session.loggedIN) {
        db.query('SELECT COUNT(id_przepis) as ilosc FROM przepisy WHERE zaakceptowany = 1', function (error, dane) {
            db.query('SELECT COUNT(id_przepis) as ilosc FROM przepisy WHERE zaakceptowany = 0', function (error, dane2) {
                db.query('SELECT COUNT(id_komentarz) as ilosc FROM komentarze', function (error, dane3) {
                    res.render('admin/index', {
                        username: req.session.username,
                        przepisy1: dane,
                        przepisy2: dane2,
                        przepisy3: dane3,
                    })
                });
            });
        });
    } else {
        res.redirect('/login');
    }
});

router.get('/nieaktywne', function(req, res) {
    if(req.session.loggedIN) {
        let zapytanie = 'SELECT id_przepis, nazwa_przepis, opis_przepis, sciezka_zdjecie, krotki_opis, nazwa_kategorii FROM przepisy natural join kategorie WHERE zaakceptowany = 0';
        db.query(zapytanie, function(error, dane) {
            res.render('admin/przepisy_cat', {
                dane: dane,
                category: "Czekajace na akceptacje"
            });
        });
    } else {
        res.redirect('/login');
    }
});

router.get('/aktywne', function (req, res) {
    if(req.session.loggedIN) {
        let zapytanie = 'SELECT id_przepis, nazwa_przepis, opis_przepis, sciezka_zdjecie, krotki_opis, nazwa_kategorii FROM przepisy natural join kategorie WHERE zaakceptowany = 1';
        db.query(zapytanie, function(error, dane) {
            res.render('admin/przepisy_cat', {
                dane: dane,
                category: "Zaakceptowane przepisy"
            });
        });
    } else {
        res.redirect('/login');
    }
});

router.get('/edit', function (req,res) {
    if(req.session.loggedIN) {
        res.redirect('/admin');
    } else {
        res.redirect('/login');
    }
});

router.get('/edit/:id_przepis', function (req,res) {
    if(req.session.loggedIN) {
        db.query("SELECT id_przepis, nazwa_przepis, opis_przepis, sciezka_zdjecie, krotki_opis, nazwa_kategorii, nazwa_skladnika, ilosc FROM przepisy natural join kategorie natural join skladniki WHERE id_przepis = ?", req.params.id_przepis, function (error, dane) {
            res.render('admin/one_element', {
                dane: dane
            });
        });
    } else {
        res.redirect('/login');
    }
});

router.post('/edit/:id_przepis', function (req, res) {
    if(req.session.loggedIN) {
        if(req.body.action === 'delete') {
            db.query('SELECT sciezka_zdjecie FROM przepisy WHERE id_przepis = ?', req.params.id_przepis, function (err, result) {
                if (err) return res.status(500).send(err);
                let image = result[0].sciezka_zdjecie;
                db.query("DELETE FROM skladniki WHERE id_przepis = ?", req.params.id_przepis, function (error, req1) {
                    if (error) throw error;
                    db.query("DELETE FROM komentarze WHERE id_przepis = ?", req.params.id_przepis, function (error, req2) {
                        if (error) throw error;
                        db.query("DELETE FROM przepisy WHERE id_przepis = ?", req.params.id_przepis, function (error, req3) {
                            if (error) throw error;
                            fs.unlink(`public/${image}`, function (err) {
                                if (err) {
                                    return res.status(500).send(err);
                                }
                                res.redirect('/admin');
                            });
                        })
                    })
                })
            });
        }
        if(req.body.action === 'update') {
            let nazwa = req.body.nazwa_przepis;
            let opis_krotki = req.body.opis_krotki;
            let instrukcja = req.body.instrukcja;

            db.query("UPDATE przepisy SET nazwa_przepis = ?, opis_przepis = ?, krotki_opis = ?, zaakceptowany = 1 WHERE id_przepis = ?", [nazwa, instrukcja, opis_krotki, req.params.id_przepis], function (error, result) {
                if(error)  return res.status(500).send(error);
                res.redirect('/admin/aktywne');
            })
        }
    } else {
        res.redirect('/login');
    }
});

router.post('/json/chart', function (req, res) {
    if(req.session.loggedIN) {
        db.query('SELECT nazwa_kategorii, COUNT(id_przepis) as ilosc FROM przepisy NATURAL JOIN kategorie WHERE zaakceptowany = 1 GROUP BY id_kategorii', function (err, dane) {
            res.json(dane);
        })
    } else {
        res.redirect('/login');
    }

});

module.exports = router;