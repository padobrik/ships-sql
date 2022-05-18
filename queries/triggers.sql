DROP TRIGGER OperatorTrigger;
DROP TRIGGER RowTrigger;
DROP TRIGGER Cutter;
DROP TRIGGER TriggerDescriptor;
DROP TRIGGER WhenTrigger;

DROP TABLE ShipsAudit;
DROP TABLE ClassesAudit;
DROP TABLE OutcomesAudit;
DROP TABLE Ships_new;

/* Task1 */
CREATE TABLE ShipsAudit(
users VARCHAR(20),
time TIMESTAMP,
TRG VARCHAR(20)
);

CREATE OR REPLACE TRIGGER OperatorTrigger
AFTER INSERT OR DELETE OR UPDATE ON Ships
DECLARE
BEGIN
INSERT INTO ShipsAudit(users, time, TRG) VALUES (user, SYSDATE, 'TRG_OPERATOR');
END OperatorTrigger;

INSERT INTO Ships VALUES ('Royal Oak', 'Revenge', 1916);
UPDATE Ships SET name = 'Royal Oak' WHERE name = 'Royal Oak';
DELETE FROM Ships WHERE name = 'Royal Oak';

SELECT * FROM ShipsAudit;

/* Task2 */
CREATE TABLE ClassesAudit(
users VARCHAR(20),
time TIMESTAMP,
TRG VARCHAR(20)
);

CREATE OR REPLACE TRIGGER RowTrigger
AFTER INSERT OR DELETE OR UPDATE ON Classes
FOR EACH ROW
DECLARE
BEGIN
INSERT INTO ClassesAudit(users, time, TRG) VALUES (user, SYSDATE, 'ROW_TRG');
END RowTrigger;

DELETE FROM Classes WHERE country='Germany';
INSERT INTO Classes VALUES ('Bismark', 'Bs', 'Germany', 8, 15, 42000);

SELECT * FROM ClassesAudit;

/* Task3 */
CREATE OR REPLACE TRIGGER Cutter
AFTER DELETE ON Battles
FOR EACH ROW
DECLARE
BEGIN
DELETE FROM Outcomes WHERE battle = :old.name;
END Cutter;

DELETE FROM Battles WHERE name = 'North Atlantic';
SELECT * FROM Outcomes;

/* Task4 */
CREATE TABLE OutcomesAudit(
users VARCHAR(20),
time TIMESTAMP,
action_type VARCHAR(20),
history VARCHAR(60)
);

CREATE OR REPLACE TRIGGER TriggerDescriptor
AFTER INSERT OR DELETE OR UPDATE ON Outcomes
FOR EACH ROW
DECLARE
type_act VARCHAR(10);
BEGIN
IF INSERTING THEN type_act := 'INSERT';
END IF;
IF DELETING THEN type_act := 'DELETE';
END IF;
IF UPDATING THEN type_act := 'UPDATE';
END IF;
INSERT INTO OutcomesAudit (users, time, action_type, history) VALUES (user, SYSDATE, type_act, 'oldName: '||:old.ship||' newName: '||:new.ship);
END TriggerDescriptor;

/* Task5 */
CREATE TABLE Ships_new AS
SELECT * FROM Ships
WHERE launched > 1950;

CREATE OR REPLACE TRIGGER WhenTrigger
AFTER INSERT ON Ships
FOR EACH ROW
WHEN (new.launched > 1950)
DECLARE
BEGIN
INSERT INTO Ships_new (name, class, launched) VALUES (:new.name, :new.class, :new.launched);
END WhenTrigger;