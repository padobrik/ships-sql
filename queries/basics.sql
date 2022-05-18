/* Task1 */
SELECT class FROM Classes WHERE displacement > 30000;

/* Task2 */
SELECT Outcomes.ship, Classes.displacement, Classes.numGuns FROM Outcomes, Classes, Ships
WHERE Outcomes.battle = 'Guadalcanal' AND Outcomes.ship = Ships.name AND Ships.class = Classes.class;

/* Task3 */
SELECT ship FROM Outcomes
UNION
SELECT name FROM Ships;

/* Task4 */
SELECT country FROM Classes
WHERE kind = 'Bc'
INTERSECT
SELECT country FROM Classes
WHERE kind = 'Bs';

/* Task5 */
SELECT DISTINCT(Outcomes1.ship) FROM Outcomes Outcomes1, Outcomes Outcomes2, Battles Battles1, Battles Battles2
WHERE Outcomes1.result = 'damaged'
AND Outcomes2.result = 'ok'
AND Outcomes1.ship = Outcomes2.ship
AND Battles1.data < Battles2.data;

/* Task6 */
SELECT DISTINCT(Outcomes1.ship), Outcomes1.battle FROM Outcomes Outcomes1, Outcomes Outcomes2, Ships Ships1, Ships Ships2, Classes Classes1, Classes Classes2
WHERE Outcomes1.battle = Outcomes2.battle
AND Outcomes1.ship != Outcomes2.ship
AND Ships1.name = Outcomes1.ship
AND Ships2.name = Outcomes2.ship
AND Classes1.class = Ships1.class
AND Classes2.class = Ships2.class
AND Classes1.country = Classes2.country;