-- Skapa tabellen Fornlämningar med relevanta kolumner och rätt typer
CREATE TABLE Fornlämningar (
    ObjektID INTEGER PRIMARY KEY AUTOINCREMENT ,
    Typ TEXT NOT NULL,
    Latitud REAL NOT NULL,
    Longitud REAL NOT NULL,
    Län TEXT NOT NULL,
    Kommun TEXT NOT NULL
);

-- Skapa tabellen Kommuner med relevanta kolumner och rätt typer
CREATE TABLE Kommuner (
    KommunID INTEGER PRIMARY KEY AUTOINCREMENT ,
    KommunNamn TEXT NOT NULL,
    Folkmängd INTEGER NOT NULL,
    Län TEXT NOT NULL,
    FOREIGN KEY (KommunNamn) REFERENCES Fornlämningar(Kommun)
);

-- Lägg in endast 1 rad data i tabellen Fornlämningar
INSERT INTO Fornlämningar (Typ, Latitud, Longitud, Län, Kommun)
VALUES ('Dammvall',	60.152395,	16.082578,	'Dalarna',	'Avesta');

-- Lägg in resterande 5 rader data i tabellen Fornlämningar samtidigt
INSERT INTO Fornlämningar (Typ, Latitud, Longitud, Län, Kommun) VALUES
('Gränsmärke',	58.340962,	13.421396,	'Västra Götaland',	'Skara'),
('Bro',	57.671237,	15.759517,	'Kalmar',	'Vimmerby'),
('Vägmärke',	56.229537,	14.774027,	'Blekinge',	'Karlshamn'),
('Bytomt/gårdstomt',	55.989728,	13.193631,	'Skåne',	'Svalöv'),
('Husgrund',	57.224412,	12.248797,	'Halland',	'Varberg');

-- Lägg in data i tabellen Kommuner
INSERT INTO Kommuner (KommunNamn, Folkmängd, Län) VALUES
('Avesta',	22468,	'Dalarna'),
('Skara',	18752,	'Västra Götaland'),
('Vimmerby',	15414,	'Kalmar'),
('Karlshamn',	31742,	'Blekinge'),
('Svalöv',	14402,	'Skåne'),
('Varberg',	69327,	'Halland');

-- Läs all data i tabellerna med wildcard *
SELECT * FROM Fornlämningar;
SELECT * FROM Kommuner;

-- Läs endast all data i kolumnerna Folkmängd och KommunNamn i tabellen Kommuner
SELECT Folkmängd, KommunNamn FROM Kommuner;

-- Läs endast ut datan i kolumnerna Folkmängd och KommunNamn där värdet i Folkmängd > 20000, i tabellen Kommuner
SELECT Folkmängd, KommunNamn FROM Kommuner WHERE Folkmängd > 20000;

-- Läs endast ut datan i kolumnerna Typ och Kommun Från län Kalmar, i tabellen Fornlämningar
SELECT Typ, Kommun FROM Fornlämningar WHERE Län = 'Kalmar';

-- Uppdatera folkmängden i Avesta till 25000
UPDATE Kommuner
SET Folkmängd = 25000
WHERE KommunNamn = 'Avesta';

-- Ta bort raden med KommunID = 6
DELETE FROM Kommuner WHERE KommunID = 6;

-- Läs ändringarna i tabellen
SELECT * FROM Kommuner;

-- Läs Typ och Lat, Long från Fornlämningar och Folkmängd från Kommuner genom att joina KommunNamn och Kommun i de 2 tabellerna.
SELECT Fornlämningar.Typ, Fornlämningar.Latitud, Fornlämningar.Longitud, Kommuner.Folkmängd
FROM Fornlämningar
INNER JOIN Kommuner ON Fornlämningar.Kommun = Kommuner.KommunNamn;