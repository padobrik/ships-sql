/* crop each foreign keys */
   
ALTER TABLE Ships_keys
DROP CONSTRAINT classes_ships_f;
ALTER TABLE Outcomes_keys
DROP CONSTRAINT ships_outcomes_f;
ALTER TABLE Outcomes_keys
DROP CONSTRAINT outcomes_battles_f;

/* crop each base keys */
    
ALTER TABLE Classes_keys
DROP CONSTRAINT classes_ships_p;
ALTER TABLE Ships_keys
DROP CONSTRAINT ships_outcomes_p;
ALTER TABLE Battles_keys    
DROP CONSTRAINT outcomes_battles_p;

DROP TABLE Classes_keys;
DROP TABLE Battles_keys;
DROP TABLE Outcomes_keys;
DROP TABLE Ships_keys;

CREATE TABLE Classes_keys(
    class VARCHAR(20),
    kind VARCHAR(20),
    country VARCHAR(20),
    numGuns INT,
    bore INT,
    displacement INT
);

CREATE TABLE Ships_keys(
    name VARCHAR(20),
    class VARCHAR(20),
    launched INT
);

CREATE TABLE Outcomes_keys(
    ship VARCHAR(20),
    battle VARCHAR(20),
    result VARCHAR(20)
);

CREATE TABLE Battles_keys(
    name VARCHAR(20),
    data DATE
);  


INSERT INTO Classes_keys VALUES ('Bismark', 'Bs', 'Germany', 8, 15, 42000);
INSERT INTO Classes_keys VALUES ('Iowa', 'Bs', 'USA', 9, 16, 46000);
INSERT INTO Classes_keys VALUES ('Kongo', 'Bc', 'Japan', 8, 14, 32000);
INSERT INTO Classes_keys VALUES ('North Carolina', 'Bs', 'USA', 9, 16, 37000);
INSERT INTO Classes_keys VALUES ('Renown', 'Bc', 'G Britain', 6, 15, 32000);
INSERT INTO Classes_keys VALUES ('Revenge', 'Bs', 'G Britain', 8, 15, 29000);
INSERT INTO Classes_keys VALUES ('Tennessee', 'Bs', 'USA', 12, 14, 32000);
INSERT INTO Classes_keys VALUES ('Yamato', 'Bs', 'Japan', 9, 18, 65000);


INSERT INTO Battles_keys VALUES ('North Atlantic', TO_DATE('1941-02-24', 'yyyy-mm-dd'));
INSERT INTO Battles_keys VALUES ('Guadalcanal', TO_DATE('1942-11-15', 'yyyy-mm-dd'));
INSERT INTO Battles_keys VALUES ('North Cope', TO_DATE('1943-12-26', 'yyyy-mm-dd'));
INSERT INTO Battles_keys VALUES ('Surigao Strait', TO_DATE('1944-10-25', 'yyyy-mm-dd'));

INSERT INTO Outcomes_keys VALUES ('Bismark', 'North Atlantic', 'sunk');
INSERT INTO Outcomes_keys VALUES ('California', 'Surigao Strait', 'ok');
INSERT INTO Outcomes_keys VALUES ('Duke of York', 'North Cope', 'ok');
INSERT INTO Outcomes_keys VALUES ('Fuso', 'Surigao Strait', 'sunk');
INSERT INTO Outcomes_keys VALUES ('Hood', 'North Atlantic', 'sunk');
INSERT INTO Outcomes_keys VALUES ('King George', 'North Atlantic', 'ok');
INSERT INTO Outcomes_keys VALUES ('Kirishima', 'Guadalcanal', 'sunk');
INSERT INTO Outcomes_keys VALUES ('Prince of Wales', 'North Atlantic', 'damaged');
INSERT INTO Outcomes_keys VALUES ('Rodney', 'North Atlantic', 'ok');
INSERT INTO Outcomes_keys VALUES ('Schambost', 'North Cope', 'sunk');
INSERT INTO Outcomes_keys VALUES ('South Dakota', 'Guadalcanal', 'damaged');
INSERT INTO Outcomes_keys VALUES ('Tennessee', 'Surigao Strait', 'ok');
INSERT INTO Outcomes_keys VALUES ('Washington', 'Guadalcanal', 'ok');
INSERT INTO Outcomes_keys VALUES ('West Virginia', 'Surigao Strait', 'ok');
INSERT INTO Outcomes_keys VALUES ('Yamashiro', 'Surigao Strait', 'sunk');
INSERT INTO Outcomes_keys VALUES ('Prince of Wales', 'Surigao Strait', 'ok');

INSERT INTO Ships_keys VALUES ('California', 'Tennessee', '1921');
INSERT INTO Ships_keys VALUES ('Bismark', 'Bismark', '1913');
INSERT INTO Ships_keys VALUES ('Duke of York', 'Tennessee', '1920');
INSERT INTO Ships_keys VALUES ('Fuso', 'Kongo', '1912');
INSERT INTO Ships_keys VALUES ('Hood', 'Renown', '1915');
INSERT INTO Ships_keys VALUES ('Haruna', 'Kongo', '1915');
INSERT INTO Ships_keys VALUES ('Hiei', 'Kongo', '1914');
INSERT INTO Ships_keys VALUES ('Iowa', 'Iowa', '1943');
INSERT INTO Ships_keys VALUES ('King George', 'Iowa', '1919');
INSERT INTO Ships_keys VALUES ('Kirishima', 'Kongo', '1915');
INSERT INTO Ships_keys VALUES ('Kongo', 'Kongo', '1913');
INSERT INTO Ships_keys VALUES ('Missouri', 'Iowa', '1944');
INSERT INTO Ships_keys VALUES ('Musachi', 'Yamato', '1942');
INSERT INTO Ships_keys VALUES ('New Jersey', 'Iowa', '1943');
INSERT INTO Ships_keys VALUES ('North Carolina', 'North Carolina', '1941');
INSERT INTO Ships_keys VALUES ('Prince of Wales', 'Revenge', '1918');
INSERT INTO Ships_keys VALUES ('Ramillies', 'Revenge', '1917');
INSERT INTO Ships_keys VALUES ('Renown', 'Renown', '1916');
INSERT INTO Ships_keys VALUES ('Repulse', 'Renown', '1916');
INSERT INTO Ships_keys VALUES ('Resolution', 'Revenge', '1916');
INSERT INTO Ships_keys VALUES ('Revenge', 'Revenge', '1916');
INSERT INTO Ships_keys VALUES ('Rodney', 'Revenge', '1916');
INSERT INTO Ships_keys VALUES ('Royal Oak', 'Revenge', '1916');
INSERT INTO Ships_keys VALUES ('Royal Sovereign', 'Revenge', '1916');
INSERT INTO Ships_keys VALUES ('Schambost', 'Yamato', '1940');
INSERT INTO Ships_keys VALUES ('South Dakota', 'Tennessee', '1919');
INSERT INTO Ships_keys VALUES ('Tennessee', 'Tennessee', '1920');
INSERT INTO Ships_keys VALUES ('Washington', 'North Carolina', '1941');
INSERT INTO Ships_keys VALUES ('West Virginia', 'Iowa', '1943');
INSERT INTO Ships_keys VALUES ('Wisconsin', 'Iowa', '1944');
INSERT INTO Ships_keys VALUES ('Yamato', 'Yamato', '1941');
INSERT INTO Ships_keys VALUES ('Yamashiro', 'Yamato', '1942');

ALTER TABLE Classes_keys    
ADD CONSTRAINT classes_ships_p PRIMARY KEY(class);

ALTER TABLE Ships_keys    
ADD CONSTRAINT ships_outcomes_p PRIMARY KEY(name);

ALTER TABLE Battles_keys    
ADD CONSTRAINT outcomes_battles_p PRIMARY KEY(name);

ALTER TABLE Ships_keys    
ADD CONSTRAINT classes_ships_f FOREIGN KEY(class) REFERENCES Classes_keys(class);

ALTER TABLE Outcomes_keys    
ADD CONSTRAINT ships_outcomes_f FOREIGN KEY(ship) REFERENCES Ships_keys(name);

ALTER TABLE Outcomes_keys    
ADD CONSTRAINT outcomes_battles_f FOREIGN KEY(battle) REFERENCES Battles_keys(name);