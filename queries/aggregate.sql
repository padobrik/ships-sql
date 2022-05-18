/* Task1 */
SELECT name FROM Ships
WHERE Ships.name = Ships.class
UNION
SELECT ship FROM Outcomes, Ships
WHERE Ships.class = Outcomes.ship;

/* Task2 */
SELECT name FROM Ships
MINUS
(SELECT name FROM Ships
WHERE Ships.class = Ships.name
UNION
SELECT ship FROM Outcomes, Ships
WHERE Ships.class = Outcomes.ship);

/* Task3*/
SELECT class FROM Classes
INTERSECT
SELECT class FROM Ships;

/* Task4 */
SELECT name FROM Ships
MINUS
SELECT ship FROM Outcomes;

/* Task5 */
SELECT ship FROM Outcomes
MINUS
SELECT name FROM Ships;