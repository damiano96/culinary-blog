let express = require('express');
let router = express.Router();

function capitalizeFirstLetter(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
}

router.get('/', function (req, res) {
    res.redirect('/');
});

router.get('/:nazwa_kategorii', function (req, res) {
    db.query("select nazwa_kategorii, baner_src from kategorie where nazwa_kategorii = ?", [req.params.nazwa_kategorii], function(error, result) {
        if(result.length > 0) {
            db.query("select id_przepis, nazwa_przepis, opis_przepis, sciezka_zdjecie, krotki_opis from przepisy where id_kategorii = (select id_kategorii from kategorie where nazwa_kategorii = ?) AND zaakceptowany = '1'", [req.params.nazwa_kategorii], (error, results) => {
                if(error) return res.status(500).send(error);
                res.render('client/category', {
                    title: capitalizeFirstLetter(req.params.nazwa_kategorii),
                    tytul_baner: capitalizeFirstLetter(req.params.nazwa_kategorii),
                    kategoria: result,
                    dane: results
                });
            });
        } else {
            res.render('client/error', {
                title: 'Blad kategorii',
                error_message: 'Nieprawidłowa kategoria!'
            });
        }
    });
});

router.get('/:nazwa_kategorii/:przepis', function (req, res) {
    let przepis_name = req.params.przepis.split("_").join(" ");
    db.query("select nazwa_kategorii, baner_src from kategorie where nazwa_kategorii = ?", [req.params.nazwa_kategorii], function(error, result)  {
        if(error) throw error;
        if(result.length > 0) {
            db.query("select id_przepis, nazwa_przepis, opis_przepis, sciezka_zdjecie, opis_przepis, ilosc, nazwa_skladnika from przepisy natural join skladniki where id_kategorii = (select id_kategorii from kategorie where nazwa_kategorii = ? AND nazwa_przepis = ?)", [req.params.nazwa_kategorii, przepis_name], (error, results) => {
                if(error) throw error;
                if(results.length > 0) {
                    let commentQuery = "select uzytkownik, komentarz from komentarze where id_przepis = '" + results[0].id_przepis + "';";
                    db.query(commentQuery, (error, results_comment) => {
                        res.render('client/one_record', {
                            title: capitalizeFirstLetter(req.params.nazwa_kategorii),
                            kategoria: result,
                            dane: results,
                            komentarze: results_comment
                        });
                    });
                } else {
                    res.render('client/error', {
                        title: 'Blad przepisu',
                        error_message: 'Nieprawidłowy przepis!'
                    });
                }
            });
        } else {
            res.render('client/error', {
                title: 'Blad kategorii',
                error_message: 'Nieprawidłowa kategoria!'
            });
        }
    });
});


router.post('/:nazwa_kategorii/:przepis', function (req, res) {
    let uzytkownik = req.body.uzytkownik;
    let komentarz = req.body.komentarz;
    let idPrzepis = req.body.idPrzepis;
    let kategoria = req.params.nazwa_kategorii;
    let nazwaPrzepis = req.params.przepis;

    if (uzytkownik !== '' && komentarz !== '') {
        db.query("insert into komentarze(id_komentarz, uzytkownik, komentarz, id_przepis) values('', '" + uzytkownik + "','" + komentarz + "','" + idPrzepis + "')", function (error, dane) {
            if (error) throw error;
            res.redirect('/kategoria/'+kategoria+'/'+nazwaPrzepis);
        });
    } else {
        res.redirect('/kategoria/'+kategoria+'/'+nazwaPrzepis);
    }

});

module.exports = router;
