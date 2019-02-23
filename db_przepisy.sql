-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 22 Lut 2019, 13:25
-- Wersja serwera: 10.1.31-MariaDB
-- Wersja PHP: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `db_przepisy`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategorie`
--

CREATE TABLE `kategorie` (
  `id_kategorii` int(11) NOT NULL,
  `nazwa_kategorii` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `baner_src` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `kategorie`
--

INSERT INTO `kategorie` (`id_kategorii`, `nazwa_kategorii`, `baner_src`) VALUES
(1, 'sniadania', '/images/img/banner_sniadania.png'),
(2, 'ciasta', '/images/img/banner_ciasta.png'),
(3, 'obiady', '/images/img/banner_obiady.png'),
(4, 'salatki', '/images/img/banner_salatki.png'),
(5, 'przekaski', '/images/img/banner_przekaski.png'),
(6, 'drinki', '/images/img/banner_drinki.png');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `komentarze`
--

CREATE TABLE `komentarze` (
  `id_komentarz` int(11) NOT NULL,
  `uzytkownik` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `komentarz` text COLLATE utf8_polish_ci NOT NULL,
  `id_przepis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `komentarze`
--

INSERT INTO `komentarze` (`id_komentarz`, `uzytkownik`, `komentarz`, `id_przepis`) VALUES
(17, 'lola233', 'świetny! polecam', 12),
(18, 'Janusz', 'trohe mało tej wudki', 12),
(19, 'damek', 'a słodkie to będzie?', 13),
(20, 'feraaa', 'Nie spodziewałam się, że takie połączenie smaków tak mnie zaskoczy, tak pozytywnie zaskoczy! ', 15),
(21, 'ola12', 'pychotka!', 16),
(22, 'fredd', 'moje dzieci ją uwielbiają', 16),
(23, 'polaa', 'najlepsza !!!', 16),
(24, 'fankadrinkow', 'orzeźwia', 18),
(25, ' l lk l ', 'hbjhbjhbjh', 17),
(26, 'słąbe', 'SŁABE', 19),
(27, 'polaa', 'rozpływa się w ustach! <3', 23),
(28, 'Ania', 'Uuu chyba będę musiała wypróbować w mojej restauracji', 29),
(29, 'Marek', 'Polecam ten przepis.. Jest cudowny', 29),
(30, 'Damian ', 'Ja i tak lepsze robię po swojemu.. ', 29),
(31, 'Gaba', 'Nie wątpię.', 29),
(32, 'fredd', 'wow!', 22),
(33, 'polaa', 'przepyszne', 22),
(34, 'ola12', 'polecam przepis!!!', 22),
(35, 'pipiii', 'najlepsze jakie jadłam!', 22),
(36, 'ror', 'robię co rok na urodziny córki', 22),
(37, 'ola12', 'idealny smak!', 12),
(38, 'fankadrinkow', 'najlepszyy', 12),
(39, 'fdds', 'super', 12),
(40, 'werra', 'polecam', 12),
(41, 'werr', 'najlepsza na świecie', 16),
(42, 'fredd', 'cóż za smak', 16),
(43, 'Janek', 'Mhmhm jakie pyszne', 22),
(45, 'Marek', 'Paskudztwo! ', 32),
(46, 'Ania', 'Świetny do mojej diety :)', 32),
(47, 'wfwef', 'fwefwef', 19);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przepisy`
--

CREATE TABLE `przepisy` (
  `id_przepis` int(11) NOT NULL,
  `nazwa_przepis` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `opis_przepis` text COLLATE utf8_polish_ci NOT NULL,
  `sciezka_zdjecie` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `krotki_opis` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `id_kategorii` int(11) NOT NULL,
  `zaakceptowany` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `przepisy`
--

INSERT INTO `przepisy` (`id_przepis`, `nazwa_przepis`, `opis_przepis`, `sciezka_zdjecie`, `krotki_opis`, `id_kategorii`, `zaakceptowany`) VALUES
(12, 'Krwawa Mary', 'Wszystkie składniki wkładamy do shakera i mieszamy. Drink jest gotowy do spożycia. Przelewamy go do wysokiej szklanki i dekorujemy gałązką selera naciowego, plasterkiem cytryny lub limonki itp.', 'images/przepisy_zdj/Krwawa Mary_drinki.jpeg', 'Krwawa Marry najbardziej znany drink', 6, 1),
(13, 'Tiramisu', 'Jajka włożyć do zlewu i przelać gorącą wodą. Zaparzyć kawę i ostudzić. Oddzielić żółtka od białek.\r\nŻółtka ubić z połową cukru pudru na puszysty i jasny krem (ok. 7 minut) - najlepiej początkowo ubijać na parze (w metalowej misce zawieszonej na garnku z parującą wodą), a gdy żółtka będą już ciepłe, odstawić z pary i dalej ubijać.\r\nNastępnie stopniowo dodawać likier cały czas ubijając. Teraz dodawać porcjami (po 3 łyżki) mascarpone, ale już w krótszych odstępach czasu, cały czas ubijając, aż krem będzie gęsty i jednolity.\r\nW oddzielnej misce ubić białka z dodatkiem szczypty soli na sztywną pianę, następnie stopniowo dodawać resztę cukru pudru i ubijać aż piana będzie gęsta i błyszcząca. Połączyć z kremem z żółtek i mascarpone delikatnie mieszając łyżką.\r\nPołowę biszkoptów na moment zanurzać w kawie i układać w prostokątnym naczyniu np. żaroodpornym lub w pojedynczych naczynkach. Posypać cienką warstwą kakao. Wyłożyć połowę kremu i przykryć kolejną warstwą nasączonych biszkoptów. Znów oprószyć kakao. Posmarować resztą kremu, posypać kakao i wstawić do lodówki na minimum 3 godziny lub na całą noc.', 'images/przepisy_zdj/Tiramisu_ciasta.jpeg', 'Prawdziwy, oryginalny i najlepszy przepis! Ti', 2, 1),
(15, 'Pizza z arbuza', 'Arbuza umyć i pokroić na plastry grubości ok. 1,5 cm, następnie każdy plaster na 6 kawałków. Posypać pokruszonym serem feta, plasterkami czarnych oliwek i listkami świeżej mięty.\r\n\"Pizzę\" skropić wymieszanym w równych proporcjach syropem klonowym i sokiem z cytryny.', 'images/przepisy_zdj/Pizza z arbuza_przekaski.jpeg', 'Pizza z arbuza z fetą, oliwkami i miętą.', 5, 1),
(16, 'Owsianka bounty z malinami', 'Płatki owsiane wsypać do garnka i zalać większą ilością zimnej wody z kranu, wymieszać i wylać mętną wodę, powtórzyć jeszcze 2 - 3 razy aż woda będzie czysta bez resztek łusek ziarna.\r\nWlać świeżą wodę w ilości 1 i 1/2 szklanki, dodać wiórki kokosowe i zagotować. Zmniejszyć ogień, przykryć i gotować przez ok. 10 minut, w międzyczasie 2 - 3 razy zamieszać.\r\nZdjąć pokrywę, dodać mleko kokosowe oraz cukier. Wymieszać i zdjąć z ognia.\r\nNałożyć do miseczek, na wierzchu posypać posiekaną czekoladą i malinami.\r\n\r\n1 szklanka płatków owsianych górskich\r\n2 łyżki wiórków kokosowych\r\n200 ml mleka kokosowego z puszki (lub zwykłego mleka krowiego)\r\n2 łyżki cukru\r\n50 g czekolady mlecznej lub deserowej\r\nmaliny', 'images/przepisy_zdj/Owsianka bounty_sniadania.jpeg', 'Owsianka, pyszna, z małą ilością cukru.', 1, 1),
(17, 'Sałatka z truskawkami', 'Podgrzać ocet balsamiczny i rozpuścić w nim cukier. Roszponkę opłukać i osuszyć, ułożyć na półmiskach. <br>\r\nAwokado obrać i pokroić w kostkę, doprawić solą i pieprzem, skropić sokiem z cytryny i położyć na sałacie. <br>Dodać serek ricotta i ułożyć plasterki truskawek. Doprawić solą i świeżo zmielonym pieprzem, polać sosem balsamicznym.', 'images/przepisy_zdj/Sałatka z truskawkami_salatki.jpeg', 'Prosta sałatka z truskawkami i octem.', 4, 1),
(18, 'Mojito', 'Limonkę dokładnie umyć, pokroić na półksiężyce. Włożyć do wysokiej szklanki, dodać cukier. Rozgnieść ugniataczem aby wycisnąć sok z limonki.\r\nListki mięty ugnieść nieco w dłoniach i dodać do szklanki.\r\nDo połowy wysokości szklanki dodać kruszony lód.\r\nDodać rum i wymieszać. Dopełnić kruszonym lodem oraz chlustem wody gazowanej.', 'images/przepisy_zdj/Mojito_drinki.jpeg', 'Orzeźwiający drink.', 6, 1),
(19, 'Filet z kurczaka w cebuli', 'Filet umyć, osuszyć, pokroić na mniejsze kawałki i lekko posolić.<br>\r\nUsmażyć kawałki fileta na rozgrzanym oleju, dodać pokrojoną cebulę wraz z przyprawami i dusić pod przykryciem do zeszklenia cebuli.', 'images/przepisy_zdj/Filet z kurczaka w cebuli_obiady.jpeg', 'Szybki w przygotowaniu, lekko pikantny filet.', 3, 1),
(20, 'Sex on the Beach', 'Wszystkie składniki, poza sokiem żurawinowym, wlewamy do shakera i wstrząsamy. Do szklanki, wypełnionej do połowy kostkami lodu, przelewamy zawartość shakera i dolewamy sok żurawinowy. Całość ozdabiamy np. kawałkiem pomarańczy.<br><br>\r\nMożna go podawać w szklance typu highball lub typu hurricane (nasza ma pojemność około 500 ml – dla tego typu szklanek należy zwiększyć proporcje składników mniej więcej dwa razy, w stosunku do tych podanych w przepisie). Istnieje kilka wariantów tego koktajlu, np. Modern Sex on the Beach, gdzie sok pomarańczowy jest zastępowany sokiem ananasowym. ', 'images/przepisy_zdj/Sex on the Beach_drinki.jpeg', 'Sex on the Beach znany i popularny drink', 6, 1),
(21, 'Faworki', 'Mąkę przesiać do miski, dodać sól i proszek do pieczenia, wymieszać. W drugiej misce ubić jajko i żółtka z łyżką cukru pudru na puszystą i gęstą pianę (ubijać przez ok. 8 minut, początkowo najlepiej na parze aby żółtka się ogrzały).<br>\r\nDodać do mąki, następnie dodać śmietanę i spirytus, zmiksować lub wymieszać łyżką. Połączyć składniki i zagnieść gładkie ciasto. Uformować kulę, zawinąć w folię spożywczą i odstawić na około 30 - 45 minut w temperaturze pokojowej (po tym czasie ciasto będzie łatwiejsze do wałkowania).<br>\r\nCiasto zagniatać przez ok. 7 minut, następnie rozwałkować na placek, złożyć na pół i znów rozwałkować, ponownie składać i rozwałkowywać jeszcze 2-3 razy, w międzyczasie można też tłuc ciasto wałkiem. W ten sposób uelastyczniamy ciasto i wtłaczamy w nie powietrze.<br>\r\nCiasto podzielić na 4 części i kolejno rozwałkowywać na jak najcieńsze placki (im cieńsze tym lepiej). Resztę ciasta trzymać zawinięte w folię spożywczą.<br>\r\nNożem lub radełkiem wycinać paski (ścięte na końcach prostokąty), mniejsze niż średnica garnka. W środku każdego paska zrobić nacięcie, przez które przełożyć (przewlec) jeden koniec ciasta. Złapać za końce i delikatnie potrząsnąć aby faworek miał ładny kształt. Odkładać na bok i trzymać pod ściereczką podczas wycinania kolejnych faworków.<br>\r\nRozgrzać olej do 180 stopni C w szerokim garnku i wkładać do niego po kilka faworków jednocześnie (szybko urosną i pokryją się pęcherzami powietrza). Smażyć na złoty kolor, po około 30 - 60 sekund z każdej strony.<br>\r\nFaworki układać na ręcznikach papierowych. Po ostudzeniu posypać cukrem pudrem. Można podawać z marmoladą lub konfiturą.', 'images/przepisy_zdj/Faworki_przekaski.jpeg', 'Tradycyjne faworki czyli \"chrust\".', 5, 1),
(22, 'Babeczki z truskawkami', 'Wszystkie składniki powinny być w temperaturze pokojowej. Mąkę pszenną przesiać z proszkiem do pieczenia i sodą oczyszczoną, wymieszać z migdałami i odłożyć.<br>\r\nW misie miksera umieścić masło z cukrem. Utrzeć do powstania jasnej i puszystej masy maślanej. Dodawać jajka, jedno po drugim, ucierając po każdym dodaniu. Dodać ekstrakty, zmiksować. Dodać przesiane suche składniki na zmianę z jogurtem, wymieszać szpatułką do połączenia.<br>\r\nFormę do muffinów wyłożyć papilotkami. Do każdej z nich nałożyć ciasta, wypełniając papilotki prawie do pełna (pół cm od ich górnej krawędzi). W babeczki powciskać truskawki. Posypać perłowym cukrem.<br>\r\nPiec w temperaturze 165ºC przez około 25 minut lub do tzw. suchego patyczka. Wyjąć, wystudzić na kratce.', 'images/przepisy_zdj/Babeczki z truskawkami_ciasta.jpeg', 'Mięciutkie, smaczne i proste babeczki.', 2, 1),
(23, 'Sernik limonkowy', 'Ciastka i masło umieścić w malakserze i zmiksować do momentu otrzymania masy ciasteczkowej o konsystencji mokrego piasku. W przypadku braku malaksera - ciastka umieścić w mocnym woreczku (np. z zapięciem) i uderzać mocno wałkiem lub tłuczkiem, do ich pokruszenia, na końcu połączyć z roztopionym masłem.<br>\r\nFormę o średnicy 23 cm wyłożyć papierem do pieczenia, sam spód, boków niczym nie smarować. Masę ciasteczkową wysypać na spód formy, lekko przyklepać dłońmi i wyrównać.<br>\r\nLimonkę niewoskowaną umyć, wyparzyć, otrzeć z niej skórkę, wycisnąć sok. Odłożyć.<br>\r\nW misie miksera umieścić jogurt grecki, serek mascarpone, cukier puder, skórkę i sok z limonki. Zmiksować (końcówki miksera do ubijania białek) do otrzymania jednolitej, bezgrudkowej masy.<br>\r\nŻelatynę w proszku zalać 50 ml zimnej wody, odstawić na 10 minut do napęcznienia. Postawić na palniku i podgrzewać, mieszając, do całkowitego rozpuszczenia się żelatyny lub podgrzać w mikrofali. Nie doprowadzać do wrzenia (żelatyna straci swoje właściwości żelujące). Zdjąć z palnika i lekko przestudzić.<br>\r\nDo jeszcze lekko ciepłej żelatyny dodać łyżkę masy serowej, dokładnie rozprowadzić. Dodać kolejne 2 łyżki i znowu wymieszać, obserwując, czy nie ma grudek. Tak zaprawioną żelatynę dodać do masy serowej i natychmiast zmiksować, do połączenia.<br>\r\nW osobnym naczyniu umieścić schłodzoną śmietanę kremówkę. Ubić do sztywności. Dodać ją do masy serowej, w dwóch turach i delikatnie wymieszać z masą serową.<br>\r\nNa spód ciasteczkowy wyłożyć masę serową. Wyrównać szpatułką. Schłodzić przez kilka godzin w lodówce, najkorzystniej przez noc. \r\nPrzed podaniem sernik ozdobić otartą skórką z limonki i limonkami.', 'images/przepisy_zdj/Sernik limonkowy_ciasta.jpeg', 'Delikatny limonkowy sernik na zimno.', 2, 1),
(24, 'Róże jabłkowo-cynamonowe', 'Do garnuszka nalać wodę, sok z cytryny i wsypać cukier. Wymieszać, zagotować.<br><br>\r\nW międzyczasie z jabłek usunąć gniazda nasienne, podzielić na ćwiartki i nie obierać. Nożykiem lub szybciej, np. przy pomocy mandoliny do warzyw pokroić jabłka na 2 mm plasterki. Plasterki przełożyć do gorącego syropu cukrowego (jeśli wody będzie zbyt mało można dolać) i chwilę pogotować (1 lub 2 minuty). Uwaga: długość gotowania zależy tylko od gatunku jabłek - jedne będą gotować się dłużej, inne tylko kilkanaście sekund. Gotowe plasterki jabłek powinny być miękkie i plastyczne, nie mogą jednak się rozpadać. Odcedzić (z syropu można przygotować pyszny kompot) i wystudzić plasterki.<br><br>\r\nPrzygotować formę do muffinów - o standardowej wielkości gniazd. 6 gniazd wysmarować masłem i oprószyć mąką pszenną; nadmiar mąki strzepać.<br><br>\r\nCiasto francuskie (najlepiej schłodzone, prosto z lodówki - z takim łatwiej się pracuje) lekko rozwałkować na długość do otrzymania ciasta o długości około 36 cm i szerokości 25 cm. Nożem pokroić na 6 części - pasków, każdy o szerokości około 6 cm. Marcepan rozwałkować i wyciąć z niego paski. Na pasek ciasta francuskiego położyć pasek marcepanu a następnie ułożyć plasterki jabłek w taki sposób, by na siebie zachodziły (patrz zdjęcia). Złożyć na pół i zwinąć w różyczkę, następnie umieścić w formie na muffiny. W taki sam sposób wykonać pozostałe róże.<br><br>\r\nPiec w temperaturze 220ºC przez około 5 minut, następnie zmniejszyć temperaturę do 200ºC i piec kolejne 25 - 30 minut uważnie obserwując ciasto. Jeśli jabłka zaczną się przypalać przykryć je folią aluminiową. Wyjąć, wystudzić.<br><br>\r\nPodawać oprószone cukrem pudrem i cynamonem (niekoniecznie).', 'images/przepisy_zdj/Róże jabłkowo-cynamonowe_ciasta.jpeg', 'Różana propozycja z ciasta francuskiego.', 2, 1),
(25, 'Kladdkaka', 'Wszystkie składniki powinny być w temperaturze pokojowej.<br><br>\r\nDo naczynia wbić jajka, dodać cukier, lekko roztrzepać rózgą kuchenną, tylko do połączenia. Dodać przesiane kakao, sól i wymieszać rózgą. Dodać migdały i masło, wymieszać do połączenia.<br><br>\r\nFormę o średnicy 21 cm wysmarować masłem, oprószyć mąką pszenną (lub migdałami jeśli ciasto ma być w 100% bezglutenowe). Przelać ciasto, wyrównać. Piec w temperaturze 175ºC przez 15 - 20 minut. Ciasto po tym czasie powinno być wypieczone, ale patyczek włożony w środek może się kleić. Nie może być jednak na nim śladów surowego ciasta, ani nie może być płynne. To jak z brownie - pieczone zbyt długo będzie zbyt suche. Niektórzy Szwedzi pieką ciasto tylko do momentu ścięcia się z góry, kiedy po przechyleniu foremki ciasto nie płynie - jest gotowe (wtedy jest jeszcze bardziej klejące w środku!).<br><br>\r\nWyjąć, wystudzić. <br><br>\r\nMożna podawać z 150 ml ubitej schłodzonej śmietany kremówki i świeżymi owocami, można oprószyć cukrem pudrem.', 'images/przepisy_zdj/Kladdkaka_ciasta.jpeg', 'Klejące ciasto czekoladowe prosto ze Szwecji.', 2, 1),
(26, 'Sałatka melonowa.', 'Melona obrać, pokroić w kostkę usuwając pestki. Wymieszać ze składnikami sosu.<br><br>Na talerzach rozłożyć opłukaną i osuszoną rukolę z roszponką, doprawić ją solą, pieprzem i skropić 1 łyżeczką oliwy, delikatnie wymieszać. Wyłożyć melona z sosem, jeżyny i pokruszony ser feta.<br><br>\r\nJeżyny można zastąpić borówką amerykańską.', 'images/przepisy_zdj/Sałatka melonowa._salatki.jpeg', 'Sałatka z melonem, jeżynami i serem feta.', 4, 0),
(27, 'Sałatka owocowa z mango', 'Wszystkie składniki winegretu wymieszać w miseczce. Owoce pokroić w cienkie paseczki (nożem lub melakserem), usuwając pestki. Włożyć do salaterki, polać winegretem i wymieszać.<br><br>\r\nPodawać jako surówkę do kaczki lub samodzielną sałatkę.', 'images/przepisy_zdj/Sałatka owocowa z mango_salatki.jpeg', 'Słodko pikantne smaki.', 4, 1),
(28, 'Zupa z pasternaku', 'Pasternak obrać obieraczką do warzyw (można pozostawić gdzieniegdzie trochę skórki aby zupa miała bogatszy aromat).<br><br>\r\nW garnku na oliwie i maśle zeszklić pokrojoną w kosteczkę cebulę. Dodać przeciśnięty przez praskę czosnek oraz pokrojony w kostkę pasternak. Mieszając co chwilę podsmażać składniki przez ok. 5 minut na umiarkowanym ogniu.<br><br>\r\nDodać obranego i pokrojonego w kostkę ziemniaka, pietruszkę oraz selera, wymieszać i podsmażać przez ok. 3 minuty.<br><br>\r\nDoprawić szczyptą soli, zmielonym czarnym pieprzem, dodać biały pieprz i gałkę muszkatołową. Zalać gorącym bulionem, wymieszać i zagotować.<br><br>\r\nPrzykryć, zmniejszyć ogień i gotować przez ok. 20 minut do miękkości warzyw. Odstawić z ognia, dodać mleko i zmiksować w stojącym blenderze kielichowym.', 'images/przepisy_zdj/Zupa z pasternaku_obiady.jpeg', 'Ciekawa, smaczna zupa.', 3, 1),
(29, 'Spaghetti bolognese', 'Boczek pokroić w drobną kostkę i włożyć na dużą patelnię, wytopić na małym ogniu aż się zrumieni. Przesunąć na bok, w wytopiony tłuszcz włożyć drobno posiekaną cebulę i zeszklić. Dodać drobno posiekany seler naciowy i startą marchewkę. Obsmażyć, następnie wszystko przełożyć do garnka.<br><br>\r\nNa patelnię wlać oliwę i obsmażyć mięso. Obsmażone mięso przełożyć do garnka z boczkiem i warzywami. Wlać wino i gotować mieszając ok. 5 minut. Dodać gorący bulion i koncentrat pomidorowy, wymieszać. Dodać pomidory z puszki, doprawić solą i pieprzem. Drewnianą łyżką rozdrobnić pomidory i wymieszać.<br><br>\r\nPrzykryć i gotować na małym ogniu przez minimum 2 godziny, od czasu do czasu mieszając. W połowie gotowania dodać mleko. Podawać z ugotowanym makaronem spaghetti posypując tartym parmezanem.', 'images/przepisy_zdj/Spaghetti bolognese_obiady.jpeg', 'Danie wszystkim znane, ale jakie pyszne.', 3, 1),
(30, 'Budyń jaglany', 'Kaszę jaglaną dokładnie opłukać na sicie w ciepłej wodzie, następnie włożyć do rondelka i zalać 1/2 szklanki mleka i 1/4 szklanki wody. Gotować na minimalnym ogniu pod przykryciem do całkowitego wchłonięcia płynu i miękkości kaszy, ok. 15 minut.<br><br>\r\nMiękką kaszę włożyć do pojemnika blendera, dodać resztę mleka (1/2 szklanki), 1/2 obranego banana i opcjonalnie masło orzechowe. Zmiksować na idealnie gładki mus (minimum 2 minuty miksowania).<br><br>Podawać z owocami.', 'images/przepisy_zdj/Budyń jaglany_przekaski.jpeg', 'Pyszna, bardziej pożywna alternatywa budyniu.', 5, 1),
(31, 'Jajka po tatarsku', 'Ugotowane jajka przekroić wzdłuż na pół i ułożyć na półmisku rozcięciem do góry. Delikatnie posolić. \r\nW misce wymieszać pokrojone w małą kosteczkę: cebulę, pieczarki, ogórka z majonezem i zmielonym pieprzem, delikatnie posolić.<br><br>\r\nFarsz wyłożyć na jajka. Posypać szczypiorkiem, udekorować koperkiem.<br><br>\r\n\r\n\r\nWSKAZÓWKI\r\nJak ugotować jajka: do garnka z ciepłą wodą włożyć jajka, przykryć i postawić na dużym ogniu do zagotowania. Zmniejszyć ogień i gotować przez ok. 6 minut. Po upływie tego czasu garnek zdjąć z ognia, wstawić do zlewu i zalać zimną wodą. Po ostudzeniu stłuc skorupkę i zostawić jajka w wodzie jeszcze na chwilę (dzięki temu będą się łatwiej obierały).', 'images/przepisy_zdj/Jajka po tatarsku_sniadania.jpeg', 'Prosta alternatywa dla jajek.', 1, 1),
(32, 'Koktajl z młodym jęczmieniem', 'Mango obrać, obkroić miąższ od pestki, włożyć do pojemnika stojącego blendera. Dodać obranego i pokrojonego banana, jogurt grecki i sok jabłkowy.<br><br>\r\nWsypać młody jęczmień (od 2 do 4 łyżeczek, zależy czy ma być bardziej czy mniej wyczuwalny). Zmiksować i przelać do szklanek.', 'images/przepisy_zdj/Koktajl z młodym jęczmieniem_sniadania.jpeg', 'Zdrowy i pożywny.', 1, 1),
(34, 'Schabowy', 'Ostrym nożem odciąć białą otoczkę z żyłki po zewnętrznej części mięsa. Pokroić na 4 plastry. Położyć na desce i dokładnie roztłuc na cieniutkie filety (mogą wyjść duże, wielkości pół talerza). Do rozbicia mięsa najlepiej użyć specjalnego tłuczka z metalowym obiciem z wytłoczoną krateczką.\r\nFilety namoczyć w mleku z dodatkiem soli i pieprzu (ewentualnie z dodatkiem kilku plastrów cebuli) przez ok. 2 godziny lub dłużej jeśli mamy czas (można też zostawić do namoczenia na noc).\r\nWyjąć filety z mleka i osuszyć je papierowymi ręcznikami. Doprawić solą (niezbyt dużo, bo zalewa z mleka była już solona) i pieprzem, obtoczyć w mące, następnie w roztrzepanym jajku, a na koniec w bułce tartej.\r\nNa patelni rozgrzać klarowane masło (ok. 1/2 cm warstwa) lub smalec. Smażyć partiami po 2 kotlety, na większym ogniu, po 2 minuty z każdej strony. Następnie zmniejszyć ogień i smażyć jeszcze po ok. 3 minuty z każdej strony. Przetrzeć patelnię papierowym ręcznikiem i powtórzyć z kolejną partią, na świeżym tłuszczu.\r\nUsmażone schabowe odsączyć z tłuszczu na papierowym ręczniku i podawać z ziemniakami i kapustą lub mizerią.', 'images/przepisy_zdj/Schabowy_obiady.jpeg', 'Najlepszy smak schabowego', 3, 1),
(35, 'Krupnik błyskawiczny', 'W garnku na maśle i oliwie zeszklić pokrojoną w kosteczkę cebulę. Dodać obraną i pokrojoną w kosteczkę marchewkę oraz pietruszkę i mieszając smażyć przez ok. 3 minuty.<br>\r\nWsypać kaszę, wlać gorący bulion i zagotować. Przykryć, zmniejszyć ogień i gotować przez ok. 5 minut.<br>\r\nDodać obrane i pokrojone w kosteczkę ziemniaki i gotować przez ok. 10 minut. Posypać koperkiem i podawać np. z pieczywem.', 'images/przepisy_zdj/Krupnik błyskawiczny_obiady.jpeg', 'Na rosole lub bulionie.', 3, 1),
(36, 'ewfefwef', 'fwefwef', 'images/przepisy_zdj/ewfefwef_sniadania.jpeg', 'ewfewfewfwef', 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `skladniki`
--

CREATE TABLE `skladniki` (
  `nazwa_skladnika` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `id_przepis` int(11) NOT NULL,
  `ilosc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `skladniki`
--

INSERT INTO `skladniki` (`nazwa_skladnika`, `id_przepis`, `ilosc`) VALUES
('ananas', 27, 50),
('arbuz', 15, 500),
('awokado', 17, 100),
('banan', 30, 100),
('banan', 32, 60),
('bardzo mocna kawa espresso', 13, 350),
('białka', 13, 50),
('biały pieprz', 28, 10),
('biały rum', 18, 50),
('boczek', 29, 150),
('bordowe śliwki', 27, 50),
('brązowy cukier', 18, 10),
('brzoskwinia', 27, 50),
('bulion', 28, 700),
('bułka tarta', 34, 30),
('cebula', 19, 20),
('cebula', 28, 50),
('cebula', 29, 50),
('cebula szalotka', 31, 40),
('ciastka pełnoziarniste', 23, 160),
('ciasto francuskie', 24, 300),
('cukier', 16, 30),
('cukier', 17, 20),
('cukier', 24, 70),
('cukier', 27, 50),
('cukier puder', 13, 100),
('cukier puder', 21, 10),
('cukier puder', 23, 100),
('cukier puder do posypania', 22, 30),
('cukier trzcinowy', 25, 170),
('czarne oliwki', 15, 100),
('czekolada mleczna lub deserowa', 16, 50),
('czerwone wino', 29, 250),
('czosnek', 28, 30),
('drobny cukier', 22, 150),
('ekstrakt z migdałów', 22, 10),
('ekstrakt z wanilii', 22, 10),
('filet z kurczaka', 19, 200),
('fwefew', 36, 44),
('fwefw', 36, 32323),
('gałka muszkatołowa', 28, 10),
('gęsta śmietana', 21, 60),
('gorący bulion', 29, 250),
('gorzkie kakao', 13, 30),
('imbir', 26, 30),
('jabłka deserowe', 24, 100),
('jajka', 21, 20),
('jajka', 22, 100),
('jajka', 25, 100),
('jajka', 31, 250),
('jajka', 34, 20),
('jeżyny', 26, 250),
('jogurt grecki', 23, 250),
('jogurt grecki', 32, 100),
('jogurt naturalny', 22, 250),
('kakao', 25, 40),
('kasza jaglana', 30, 100),
('kawałeczki sera naciowego/marchewki', 12, 20),
('koncentrat pomidorowy', 29, 50),
('koperek', 31, 20),
('likier amaretto', 13, 25),
('limonka', 18, 20),
('limonka przekrojona w ćwiartki', 23, 50),
('listki świeżej mięty', 15, 10),
('majonez', 31, 30),
('makaron spaghetti', 29, 200),
('maliny', 16, 100),
('mango', 27, 100),
('mango', 32, 50),
('marchewka', 29, 30),
('marchewka', 35, 20),
('marynowane pieczarki', 31, 80),
('masa marcepanowa', 24, 120),
('mascarpone', 23, 250),
('masło', 22, 60),
('masło', 23, 40),
('masło', 25, 115),
('masło', 28, 15),
('masło orzechowe', 30, 40),
('mąka pszenna ', 21, 400),
('mąka pszenna', 22, 350),
('melon', 26, 50),
('mielony imbir', 27, 10),
('mięso', 34, 200),
('mięso mielone', 29, 500),
('mięta', 18, 10),
('miód', 26, 30),
('mleko', 28, 400),
('mleko', 29, 100),
('mleko', 30, 250),
('mleko kokosowe z puszki', 16, 200),
('młody jęczmień', 32, 30),
('nektarynka', 27, 80),
('obrane pomidory', 29, 200),
('ocet balsamiczny', 17, 10),
('ocet ryżowy', 27, 15),
('ogórek kiszony', 31, 30),
('oliwa', 26, 15),
('oliwa', 28, 15),
('oliwa', 29, 30),
('parmezan', 29, 50),
('pasternak', 28, 400),
('pieprz', 12, 3),
('pieprz', 26, 5),
('pieprz', 31, 5),
('pietruszka', 28, 100),
('pietruszka', 35, 5),
('płatki chili', 27, 10),
('płatki owsiane górskie', 16, 200),
('podłużne biszkopty', 13, 300),
('proszek do pieczenia', 21, 10),
('proszek do pieczenia', 22, 10),
('roszponka', 17, 150),
('rukola z roszponką', 26, 150),
('schnapps brzoskwiniowy', 20, 20),
('seler', 28, 100),
('seler naciowy', 29, 50),
('ser feta', 15, 100),
('ser feta', 26, 80),
('serek mascarpone', 13, 500),
('serek ricotta', 17, 125),
('słodka papryka mielona', 19, 3),
('soda oczyszczona', 22, 5),
('sok jabłkowy', 32, 300),
('sok pomarańczowy', 20, 40),
('sok pomidorowy', 12, 200),
('sok z cytryny', 12, 5),
('sok z cytryny', 15, 10),
('sok z cytryny', 17, 10),
('sok z cytryny', 24, 20),
('sok z limonki', 23, 30),
('sok z limonki', 27, 30),
('sok z limonki lub cytryny', 26, 15),
('sok żurawinowy', 20, 40),
('sos sojowy', 19, 5),
('sos Worchester', 12, 5),
('sól', 12, 3),
('sól', 25, 3),
('sól', 26, 5),
('sól', 31, 5),
('sól i pieprz', 17, 10),
('starty świeży chrzan', 12, 5),
('syrop klonowy', 15, 20),
('szczypiorek', 31, 30),
('śmietana kremówka 30%', 23, 250),
('Tabasco', 12, 10),
('truskawki', 17, 200),
('truskawki pokrojone na kawałki', 22, 250),
('wiórki kokosowe', 16, 30),
('woda', 23, 50),
('woda', 24, 250),
('woda gazowana', 18, 25),
('wódka', 12, 30),
('wódka', 20, 40),
('ziemniaki', 28, 150),
('ziemniaki', 35, 50),
('zmielone migdały', 22, 100),
('zmielone migdały', 25, 70),
('żelatyna w proszku', 23, 10),
('żółtka', 13, 100),
('żółtko', 21, 30);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `uzytkownicy`
--

INSERT INTO `uzytkownicy` (`id_user`, `username`, `password`) VALUES
(1, 'admin', 'admin');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`id_kategorii`);

--
-- Indeksy dla tabeli `komentarze`
--
ALTER TABLE `komentarze`
  ADD PRIMARY KEY (`id_komentarz`),
  ADD KEY `id_przepis` (`id_przepis`);

--
-- Indeksy dla tabeli `przepisy`
--
ALTER TABLE `przepisy`
  ADD PRIMARY KEY (`id_przepis`),
  ADD UNIQUE KEY `nazwa_przepis` (`nazwa_przepis`,`id_kategorii`),
  ADD KEY `id_kategorii` (`id_kategorii`);

--
-- Indeksy dla tabeli `skladniki`
--
ALTER TABLE `skladniki`
  ADD PRIMARY KEY (`nazwa_skladnika`,`id_przepis`),
  ADD KEY `id_przepis` (`id_przepis`);

--
-- Indeksy dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `id_kategorii` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `komentarze`
--
ALTER TABLE `komentarze`
  MODIFY `id_komentarz` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT dla tabeli `przepisy`
--
ALTER TABLE `przepisy`
  MODIFY `id_przepis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `komentarze`
--
ALTER TABLE `komentarze`
  ADD CONSTRAINT `komentarze_ibfk_1` FOREIGN KEY (`id_przepis`) REFERENCES `przepisy` (`id_przepis`);

--
-- Ograniczenia dla tabeli `przepisy`
--
ALTER TABLE `przepisy`
  ADD CONSTRAINT `przepisy_ibfk_1` FOREIGN KEY (`id_kategorii`) REFERENCES `kategorie` (`id_kategorii`);

--
-- Ograniczenia dla tabeli `skladniki`
--
ALTER TABLE `skladniki`
  ADD CONSTRAINT `skladniki_ibfk_1` FOREIGN KEY (`id_przepis`) REFERENCES `przepisy` (`id_przepis`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
