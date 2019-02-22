let express = require('express');
let router = express.Router();

router.get('/', function(req, res) {
  db.query('SELECT id_przepis, nazwa_przepis, opis_przepis, sciezka_zdjecie, krotki_opis, nazwa_kategorii FROM przepisy natural join kategorie WHERE zaakceptowany = 1 order by id_przepis DESC  LIMIT 3', function (error, dane) {
    db.query('SELECT id_przepis, nazwa_przepis, opis_przepis, sciezka_zdjecie, krotki_opis, nazwa_kategorii, COUNT(id_przepis) as liczba_komentarzy FROM przepisy NATURAL JOIN kategorie NATURAL JOIN komentarze WHERE zaakceptowany = 1 GROUP BY id_przepis ORDER BY COUNT(id_przepis) DESC LIMIT 3', function(error2, dane2) {
      res.render('client/index', {
        title: 'Strona główna',
        tytul_baner: 'przepisiki',
        dane: dane, dane2: dane2
      });
    });
	console.log("Podłączony klient: " + req.connection.remoteAddress);
  });
});

module.exports = router;
