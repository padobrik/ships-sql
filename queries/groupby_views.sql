/* Task1 */
SELECT COUNT(kind) FROM Classes
WHERE kind = 'Bs';

/* Task2 */
SELECT ROUND(AVG(numGuns), 1) FROM Classes
WHERE kind = 'Bs';

/* Task3 */
SELECT ROUND(AVG(bore), 1) FROM Classes
WHERE numGuns > (SELECT AVG(numGuns) FROM Classes);

/* Task4 */
SELECT Classes.class, MIN(Ships.launched) FROM Classes, Ships
WHERE Classes.class = Ships.class
GROUP BY Classes.class;

/* Task5 */
SELECT Ships.class, COUNT(Outcomes.result) FROM Ships, Outcomes
WHERE Ships.name = Outcomes.ship AND Outcomes.result = 'sunk'
GROUP BY Ships.class;

/* Task6 */
SELECT Ships.class, COUNT(Outcomes.result) FROM Ships, Outcomes
WHERE Ships.name = Outcomes.ship AND
(SELECT COUNT(Ships1.name) FROM Ships Ships1, Ships Ships2 WHERE Ships1.class = Ships2.class) >= 3 AND Outcomes.result = 'sunk'
GROUP BY Ships.class;

/* Task7 */
SELECT Classes1.country, ROUND(AVG(POWER(Classes1.bore, 3)/2), 1) FROM Classes Classes1, Classes Classes2 
WHERE Classes1.country = Classes2.country
GROUP BY Classes1.country;

/* Task8 */
DROP VIEW BritishShips;

CREATE VIEW BritishShips
AS SELECT Ships.name, Classes.kind, Classes.numGuns, Classes.bore, Classes.displacement, Ships.launched FROM Ships, Classes
WHERE Ships.class = Classes.class AND Classes.country = 'G Britain';
SELECT * FROM BritishShips;

/* Task9 */
SELECT Ships1.launched, ROUND(AVG(Ships1.numGuns), 1) FROM BritishShips Ships1, BritishShips Ships2
WHERE Ships1.launched = Ships2.launched
GROUP BY Ships1.launched;
