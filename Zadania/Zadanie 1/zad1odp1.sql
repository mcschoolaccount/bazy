-- Zadania
-- 1
SELECT kontynent, AVG(ludnosc) as srednia
FROM kraje
GROUP BY kontynent
HAVING AVG(ludnosc) > (
	SELECT AVG(ludnosc)
    FROM kraje
)
ORDER BY srednia;

-- 2
SELECT kontynent, AVG(ludnosc) as srednia
FROM kraje
GROUP BY kontynent
HAVING AVG(ludnosc) > (
	SELECT AVG(ludnosc)
    FROM kraje
    WHERE kontynent = (
		SELECT kontynent 
        FROM kraje 
        WHERE nazwa = "Albania"
    )
)
ORDER BY srednia DESC;

-- 3
SELECT kontynent, AVG(ludnosc) as srednia
FROM kraje
GROUP BY kontynent
HAVING AVG(ludnosc) > (
	SELECT AVG(ludnosc)
    FROM kraje
    WHERE kontynent = (
		SELECT kontynent 
        FROM kraje 
        WHERE nazwa = "Albania"
    )
)
ORDER BY srednia DESC;

-- 4
SELECT nazwa, obszar, kontynent
FROM kraje
WHERE (kontynent, obszar) IN (
	SELECT kontynent, MIN(obszar)
    FROM kraje
    GROUP BY kontynent
    HAVING kontynent = (
		SELECT kontynent 
        FROM kraje 
        WHERE nazwa = "Polska"
    )
)