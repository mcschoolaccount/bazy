USE Zadanie1;

SELECT nazwa
FROM kraje AS k
WHERE k.ludnosc > (
	SELECT AVG(kp.ludnosc)
    FROM kraje AS kp
    WHERE kp.kontynent = k.kontynent
);

SELECT nazwa
FROM kraje AS k
WHERE k.obszar < (
	SELECT AVG(kp.obszar)
    FROM kraje AS kp
    WHERE kp.kontynent = k.kontynent
);