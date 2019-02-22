let express = require('express');
let router = express.Router();

router.get('/', function (req, res, next) {
    let query1 = "select * from kategorie";
    db.query(query1, function (error, dane) {
        res.render('client/add_receipe', {
            title: 'Dodaj nowy przepis',
            kategorie: dane,
            message: '',
        });
    });
});

router.post('/', function (req, res, next) {
    let nazwa_przepis = req.body.nazwa_przepis;
    let instrukcja = req.body.instrukcja;
    let krotki_opis = req.body.krotki_opis;
    let kategoria = req.body.kategoria;
    let zdjecieUpload = req.files.zdjecie;
    let image_name = zdjecieUpload.name;
    let fileExtension = zdjecieUpload.mimetype.split('/')[1];


    image_name = 'images/przepisy_zdj/' + nazwa_przepis + '_' + kategoria + '.' + fileExtension;

    let przepisQuery = "SELECT * FROM przepisy WHERE nazwa_przepis = '" + nazwa_przepis + "' AND id_kategorii = (SELECT id_kategorii FROM kategorie WHERE nazwa_kategorii =  '" + kategoria + "')";
    db.query(przepisQuery, function(err, result) {
       if(err) return res.status(500).send(err);
       if(result.length > 0) {
           let kategorie = "select * from kategorie";
           db.query(kategorie, function (error2, dane) {
               res.render('client/add_receipe', {
                   tytul_baner: 'Dodaj nowy przepis',
                   kategorie: dane,
                   message: 'Przykro nam, taki przepis już istnieje'
               });
           })
       } else {
           if (zdjecieUpload.mimetype === 'image/png' || zdjecieUpload.mimetype === 'image/jpeg' || zdjecieUpload.mimetype === 'image/gif' || zdjecieUpload.mimetype === 'image/jpg') {
               zdjecieUpload.mv(`public/${image_name}`, (err ) => {
                   if (err) {
                       return res.status(500).send(err);
                   }
                   let id_kat = "(SELECT id_kategorii FROM kategorie WHERE nazwa_kategorii =  '" + kategoria + "')";
                   let query = "INSERT INTO przepisy(id_przepis, nazwa_przepis, opis_przepis, sciezka_zdjecie, krotki_opis, id_kategorii, zaakceptowany) VALUES " +
                       "('', '"+ nazwa_przepis + "', '" +  instrukcja + "','" + image_name + "', '" + krotki_opis + "', " + id_kat + ", '0')";
                   db.query(query, (err, result) => {
                       if (err) {
                           return res.status(500).send(err);
                       }
                       let id_przepis = "(SELECT id_przepis FROM przepisy WHERE nazwa_przepis = '" + nazwa_przepis + "' AND id_kategorii = " + id_kat + ")";
                       for(let i = 1; i<=req.body.liczbaSkladnikow; i++) {
                           let query1 = "INSERT INTO skladniki(nazwa_skladnika, id_przepis, ilosc) VALUES ('" + req.body['skladnik' + i][0] + "', " + id_przepis + ",'" + req.body['skladnik' + i][1] + "')";
                           db.query(query1, (err,result) => {});
                       }
                       res.redirect('/add');
                   });
               });
           }
       }
    });
});
module.exports = router;