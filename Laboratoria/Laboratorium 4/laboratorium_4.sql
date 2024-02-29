USE komis_samochodowy;

-- Auta z danego roku, które mają przebieg niższy niż średnia, bądź równe
SELECT marka, model, numer_rejestracyjny, rok_produkcji, przebieg
FROM samochody AS s
WHERE s.przebieg <= (
	SELECT AVG(sp.przebieg)
    FROM samochody AS sp
    WHERE sp.rok_produkcji = s.rok_produkcji
);

-- Sprzedaże z danego dnia, których cena jest wyższa lub równa średniej
SELECT id, data, cena
FROM rejestry_sprzedazy AS rs
WHERE rs.cena >= (
	SELECT AVG(rsp.cena)
    FROM rejestry_sprzedazy AS rsp
    WHERE rsp.data = rs.data
);

-- Sprzedaż za najwyższą cenę danego użytkownika

SELECT nabywcy.imie, nabywcy.nazwisko, nabywcy.pesel, data, cena
FROM rejestry_sprzedazy AS rs
INNER JOIN nabywcy ON nabywcy.id = rs.nabywca_id
WHERE rs.cena = (
	SELECT MAX(rsp.cena)
    FROM rejestry_sprzedazy AS rsp
    WHERE rsp.nabywca_id = rs.nabywca_id
);