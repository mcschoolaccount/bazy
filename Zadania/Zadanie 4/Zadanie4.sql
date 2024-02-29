DROP DATABASE IF EXISTS zadanie2;
CREATE DATABASE zadanie2;
USE zadanie2;

CREATE TABLE produkty(
	nazwa_produkty VARCHAR(255),
    id_kategoria INT
);

INSERT INTO produkty(`nazwa_produkty`, `id_kategoria`) VALUES 
("avocado", 1),
("bataty", 2),
("krewetki", 3),
("parmezan", 5),
("salami", 10),
("tokaj", 4),
("winogrona", 1);

CREATE TABLE IF NOT EXISTS Artykuly (
	Nazwa Varchar(255) PRIMARY KEY,
    Rodzaj Varchar(255),
    Cena INT CHECK ( Cena > 0 ),
    INDEX (Rodzaj)
);

INSERT INTO Artykuly
VALUES  ('Windows', 'S.O.', 500),
		('Word', 'Edytor', 450),
        ('Linux', 'S.O.', 450),
        ('Star', 'Edytor', 220),
        ('Paradox', 'Baza', 900),
        ('DeltaCad', 'CAD', 1800),
        ('Delphi', 'Baza', 3100),
        ('Designer', 'CAD', 800),
        ('Optima C++', 'Baza', 1600),
        ('AutoCad', 'CAD', 6000);

CREATE TABLE IF NOT EXISTS Kraje (
	Nazwa Varchar(255) PRIMARY KEY,
    Obszar INT CHECK( Obszar > 0 ),
    Ludnosc INT CHECK( Ludnosc > 0 ),
    Kontynent Varchar(255),
    INDEX (Kontynent)
);

INSERT INTO Kraje
VALUES  ('Argentyna', 2766, 26, 'Ameryka'),
		('Polska', 313, 39, 'Europa'),
        ('USA', 9363, 230, 'Ameryka'),
        ('Kanada', 9976, 27, 'Ameryka'),
        ('Albania', 28, 3, 'Europa'),
        ('Francja', 547, 55, 'Europa'),
        ('Angola', 1246, 9, 'Afryka'),
        ('Kenia', 582, 21, 'Afryka');
        
-- 1
SELECT * FROM produkty;

-- 2
SELECT *,
CASE id_kategoria
WHEN 1 THEN "Owoce"
WHEN 2 THEN "Warzywa"
WHEN 3 THEN "Owoce morza"
WHEN 4 THEN "Wina"
WHEN 5 THEN "Sery"
ELSE "Nieznana_Kategoria"
END AS nazwa_kategorie
FROM produkty;

-- 3
SELECT *,
@nazwa_kategorie := CASE id_kategoria
WHEN 1 THEN "Owoce"
WHEN 2 THEN "Warzywa"
WHEN 3 THEN "Owoce morza"
WHEN 4 THEN "Wina"
WHEN 5 THEN "Sery"
ELSE "Nieznana_Kategoria"
END AS nazwa_kategorie,
CASE @nazwa_kategorie
WHEN "Owoce" THEN "Marka własna"
WHEN "Warzywa" THEN "Marka własna"
WHEN "Owoce morza" THEN "Marka własna"
ELSE "Obca marka"
END AS Marka
FROM produkty;

-- 4
SELECT *,
CASE 
WHEN cena < 150 THEN "Tanio"
WHEN cena >= 150 AND cena <= 250 THEN "Średnio"
WHEN cena > 250 THEN "Drogo"
END AS Ocena
FROM artykuly;

-- 5
SELECT *,
CASE 
WHEN ludnosc / obszar * 1000 < 20 THEN "Mało"
WHEN ludnosc / obszar * 1000 >= 20 AND ludnosc / obszar * 1000 <= 100 THEN "Średnio"
WHEN ludnosc / obszar * 1000 >= 100 AND ludnosc / obszar * 1000 <= 250 THEN "Dużo"
WHEN ludnosc / obszar * 1000 > 250 THEN "Przeludnienie"
END AS Zaludnienie
FROM kraje;
