DROP TABLE Classes;
DROP TABLE Battles;
DROP TABLE Outcomes;
DROP TABLE Ships;

CREATE TABLE Classes(
    class VARCHAR(20), 
    kind VARCHAR(20), 
    country VARCHAR(20),
    numGuns INT,
    bore INT,
    displacement INT);
    
CREATE TABLE Battles(
    name VARCHAR(20),
    data DATE);
   
CREATE TABLE Outcomes(
    ship VARCHAR(20),
    battle VARCHAR(20),
    result VARCHAR(20));

CREATE TABLE Ships(
    name VARCHAR(20),
    class VARCHAR(20),
    launched INT);

INSERT INTO Classes VALUES ('Bismark', 'Bs', 'Germany', 8, 15, 42000);
INSERT INTO Classes VALUES ('Iowa', 'Bs', 'USA', 9, 16, 46000);
INSERT INTO Classes VALUES ('Kongo', 'Bc', 'Japan', 8, 14, 32000);
INSERT INTO Classes VALUES ('North Carolina', 'Bs', 'USA', 9, 16, 37000);
INSERT INTO Classes VALUES ('Renown', 'Bc', 'G Britain', 6, 15, 32000);
INSERT INTO Classes VALUES ('Revenge', 'Bs', 'G Britain', 8, 15, 29000);
INSERT INTO Classes VALUES ('Tennessee', 'Bs', 'USA', 12, 14, 32000);
INSERT INTO Classes VALUES ('Yamato', 'Bs', 'Japan', 9, 18, 65000);


INSERT INTO Battles VALUES ('North Atlantic', TO_DATE('1941-02-24', 'yyyy-mm-dd'));
INSERT INTO Battles VALUES ('Guadalcanal', TO_DATE('1942-11-15', 'yyyy-mm-dd'));
INSERT INTO Battles VALUES ('North Cope', TO_DATE('1943-12-26', 'yyyy-mm-dd'));
INSERT INTO Battles VALUES ('Surigao Strait', TO_DATE('1944-10-25', 'yyyy-mm-dd'));

INSERT INTO Outcomes VALUES ('Bismark', 'North Atlantic', 'sunk');
INSERT INTO Outcomes VALUES ('California', 'Surigao Strait', 'ok');
INSERT INTO Outcomes VALUES ('Duke of York', 'North Cope', 'ok');
INSERT INTO Outcomes VALUES ('Fuso', 'Surigao Strait', 'sunk');
INSERT INTO Outcomes VALUES ('Hood', 'North Atlantic', 'sunk');
INSERT INTO Outcomes VALUES ('King George', 'North Atlantic', 'ok');
INSERT INTO Outcomes VALUES ('Kirishima', 'Guadalcanal', 'sunk');
INSERT INTO Outcomes VALUES ('Prince of Wales', 'North Atlantic', 'damaged');
INSERT INTO Outcomes VALUES ('Rodney', 'North Atlantic', 'ok');
INSERT INTO Outcomes VALUES ('Schambost', 'North Cope', 'sunk');
INSERT INTO Outcomes VALUES ('South Dakota', 'Guadalcanal', 'damaged');
INSERT INTO Outcomes VALUES ('Tennessee', 'Surigao Strait', 'ok');
INSERT INTO Outcomes VALUES ('Washington', 'Guadalcanal', 'ok');
INSERT INTO Outcomes VALUES ('West Virginia', 'Surigao Strait', 'ok');
INSERT INTO Outcomes VALUES ('Yamashiro', 'Surigao Strait', 'sunk');
INSERT INTO Outcomes VALUES ('Prince of Wales', 'Surigao Straiy', 'ok');

INSERT INTO Ships VALUES ('California', 'Tennessee', '1921');
INSERT INTO Ships VALUES ('Haruna', 'Kongo', '1915');
INSERT INTO Ships VALUES ('Hiei', 'Kongo', '1914');
INSERT INTO Ships VALUES ('Iowa', 'Iowa', '1943');
INSERT INTO Ships VALUES ('Kirishima', 'Kongo', '1915');
INSERT INTO Ships VALUES ('Kongo', 'Kongo', '1913');
INSERT INTO Ships VALUES ('Missouri', 'Iowa', '1944');
INSERT INTO Ships VALUES ('Musachi', 'Yamato', '1942');
INSERT INTO Ships VALUES ('New Jersey', 'Iowa', '1943');
INSERT INTO Ships VALUES ('North Carolina', 'North Carolina', '1941');
INSERT INTO Ships VALUES ('Ramillies', 'Revenge', '1917');
INSERT INTO Ships VALUES ('Renown', 'Renown', '1916');
INSERT INTO Ships VALUES ('Repulse', 'Renown', '1916');
INSERT INTO Ships VALUES ('Resolution', 'Revenge', '1916');
INSERT INTO Ships VALUES ('Revenge', 'Revenge', '1916');
INSERT INTO Ships VALUES ('Royal Oak', 'Revenge', '1916');
INSERT INTO Ships VALUES ('Royal Sovereign', 'Revenge', '1916');
INSERT INTO Ships VALUES ('Tennessee', 'Tennessee', '1920');
INSERT INTO Ships VALUES ('Washington', 'North Carolina', '1941');
INSERT INTO Ships VALUES ('Wisconsin', 'Iowa', '1944');
INSERT INTO Ships VALUES ('Yamato', 'Yamato', '1941');