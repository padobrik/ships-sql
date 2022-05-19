/* Task1 1st version */
SELECT DISTINCT(country) FROM Classes
WHERE numGuns >= ALL(SELECT numGuns FROM Classes);

/* Task1 2nd version */
SELECT DISTINCT(country) FROM Classes
WHERE numGuns < ANY(SELECT numGuns FROM Classes);

/* Task2 1st version */
SELECT class from Ships
WHERE name IN (SELECT ship from Outcomes WHERE result = 'sunk')
UNION
SELECT ship FROM Outcomes
WHERE ship NOT IN (SELECT name FROM Ships) AND ship IN (SELECT class from Classes) AND result = 'sunk';

/* Task2 2nd version */
SELECT class FROM Ships
WHERE EXISTS (SELECT ship FROM Outcomes WHERE Outcomes.result = 'sunk' AND Ships.name = Outcomes.ship)
UNION
SELECT class FROM Classes
WHERE EXISTS (SELECT ship FROM Outcomes WHERE Outcomes.ship = Classes.class AND result = 'sunk');

/* Task3 1st version */
SELECT DISTINCT(battle) FROM Outcomes
WHERE EXISTS (SELECT class FROM Ships WHERE Outcomes.ship = Ships.name AND EXISTS (SELECT bore FROM Classes WHERE Ships.class = Classes.class AND bore > 10));

/* Task3 2nd version */
SELECT DISTINCT(battle) FROM OUTCOMES
WHERE ship IN (SELECT name FROM Ships WHERE class IN (SELECT class FROM Classes WHERE bore > 10));

/* Task4 1st version */
SELECT name, data FROM Battles
WHERE EXISTS (SELECT Outcomes.battle FROM Outcomes, Ships WHERE Outcomes.ship = Ships.name AND Ships.class = 'Kongo' AND Battles.name = Outcomes.battle);

/* Task4 2nd version */
SELECT name, data FROM Battles
WHERE name IN (SELECT battle FROM Outcomes WHERE Outcomes.ship IN (SELECT name FROM Ships WHERE class = 'Kongo'));

/* Task5 1st version */
SELECT DISTINCT(name) FROM Ships
WHERE EXISTS (SELECT Classes1.class FROM Classes Classes1, Classes Classes2 
WHERE Ships.class = Classes1.class AND Classes1.displacement = Classes2.displacement AND Classes1.numGuns > Classes2.numGuns AND Classes1.class > Classes2.class);

/* Task5 2nd version */
SELECT DISTINCT(name) FROM Ships
WHERE Ships.class IN (SELECT Classes1.class FROM Classes Classes1, Classes Classes2
WHERE Classes1.displacement = Classes2.displacement AND Classes1.numGuns > Classes2.numGuns AND Classes1.class > Classes2.class);
