/* Task 1 */
DECLARE
shipName Ships.name % TYPE;
shipBattle Outcomes.battle % TYPE;

CURSOR Task1 IS
SELECT Ships.name, Outcomes.battle
FROM Ships
JOIN Outcomes ON Ships.name = Outcomes.ship;

BEGIN
  OPEN Task1;
    LOOP
      FETCH Task1 INTO shipName, shipBattle;
      EXIT WHEN
    Task1  %ROWCOUNT>3 OR Task1 %NOTFOUND;
    DBMS_OUTPUT.enable;
    DBMS_OUTPUT.put_line(shipName||' - '||shipBattle);
END LOOP;
CLOSE Task1;
END;

/* Task2 */
DECLARE
shipName Ships.name % TYPE;
shipClass Ships.class % TYPE;

CURSOR Task2 IS
SELECT Ships.name, Ships.class
FROM Ships;

BEGIN
  OPEN Task2;
    LOOP
      FETCH Task2 INTO shipName, shipClass;
      EXIT WHEN
    Task2 %NOTFOUND;
    DBMS_OUTPUT.enable;
    DBMS_OUTPUT.put_line(shipName||' - '||shipClass);
END LOOP;
CLOSE Task2;
END;

/* Task4 */
DECLARE
CURSOR Task4(sname VARCHAR, sbattle VARCHAR, sresult VARCHAR)
IS
SELECT Ships.name, Outcomes.battle, Ships.launched
FROM Ships
JOIN Outcomes ON Ships.name = Outcomes.ship
WHERE Outcomes.result = sresult;
dirRecord Task4 %ROWTYPE;

BEGIN
  OPEN Task4 ('', '', 'sunk');
    LOOP
      FETCH Task4 INTO dirRecord;
      EXIT WHEN
    Task4 %ROWCOUNT >10 OR Task4 %NOTFOUND;
    DBMS_OUTPUT.enable;
    DBMS_OUTPUT.put_line(dirRecord.name||' - '||dirRecord.battle||' - '||dirRecord.launched);
END LOOP;
CLOSE Task4;
END;

/* Task5 */
DECLARE
CURSOR Task5 
IS
SELECT Ships.name, Classes.class, Classes.country
FROM Ships, Classes
WHERE Ships.class = Classes.class
AND Ships.name IN (SELECT Outcomes.ship FROM Outcomes);
performRec Task5 %ROWTYPE;

BEGIN
OPEN Task5;
LOOP
FETCH Task5 INTO performRec;
EXIT WHEN Task5 %NOTFOUND;
DBMS_OUTPUT.enable;
DBMS_OUTPUT.put_line(performRec.name||' - '||performRec.class||' - '||performRec.country);
END LOOP;
CLOSE Task5;
END;