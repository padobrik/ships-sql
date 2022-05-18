/* Task1 */
UPDATE Classes
SET bore = bore * 2.5;

/* Task2 */
UPDATE Classes
SET numGuns = numGuns + 1, bore = bore - 2
WHERE country = 'G Britain' OR country = 'USA';

/* Task3 */
ALTER TABLE Battles
ADD ShipNum INT;
SELECT DISTINCT(Battles.name), COUNT(Outcomes.ship) FROM Outcomes, Battles 
WHERE Outcomes.battle = Battles.name
GROUP BY Battles.name;
UPDATE Battles
SET ShipNum = 5 WHERE Battles.name = 'North Atlantic';
UPDATE Battles
SET ShipNum = 5 WHERE Battles.name = 'Surigao Strait';
UPDATE Battles
SET ShipNum = 3 WHERE Battles.name = 'Guadalcanal';
UPDATE Battles
SET ShipNum = 2 WHERE Battles.name = 'North Cope';

/* Task4 */
SELECT Ships.name FROM Ships
JOIN Classes ON Ships.class = Classes.class
WHERE Classes.displacement > 36000;

/* Task5 */
SELECT * FROM Ships 
FULL OUTER JOIN Outcomes ON Ships.name = Outcomes.ship;

SELECT * FROM Ships
LEFT JOIN Classes ON Classes.class = Ships.class
LEFT JOIN Outcomes ON Ships.name = Outcomes.ship;

SELECT * FROM Ships
RIGHT JOIN Classes ON Classes.class = Ships.class
RIGHT JOIN Outcomes ON Ships.name = Outcomes.ship;