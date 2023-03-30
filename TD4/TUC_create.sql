DROP TABLE IF EXISTS Trajet;
DROP TABLE IF EXISTS Bus;
DROP TABLE IF EXISTS Arret;
DROP TABLE IF EXISTS Ligne;
DROP TABLE IF EXISTS Station;
DROP TABLE IF EXISTS Conducteur;
-- DROP要从有foreign key的开始drop

CREATE TABLE Ligne (
    num INTEGER NOT NULL PRIMARY KEY CHECK(
        num > 0 AND num < 100
    ),
    km INTEGER NOT NULL CHECK (
        km > 0 AND km < 10000
    )
);

CREATE TABLE Station (
    num INTEGER NOT NULL PRIMARY KEY,
    nom VARCHAR NOT NULL,
    addresse VARCHAR NOT NULL
);

CREATE TABLE Arret (
    ligne INTEGER NOT NULL,
    station INTEGER NOT NULL,
    rang INTEGER NOT NULL,
    FOREIGN KEY (ligne) REFERENCES Ligne(num),
    FOREIGN KEY (station) REFERENCES Station(num),
    PRIMARY KEY (ligne, station)
);

CREATE TABLE Conducteur (
    matricule CHAR(10) NOT NULL PRIMARY KEY,
    nom VARCHAR NOT NULL,
    prenom VARCHAR NOT NULL
);

CREATE TABLE Bus (
    immat CHAR(10) NOT NULL PRIMARY KEY,
    typ VARCHAR NOT NULL CHECK (
        typ = 'Soufflets' OR typ = 'Normaux' OR typ = 'Reduits'
    ),
    -- typ ENUM('Soufflets','Normaux','Reduits') NOT NULL,
    kilometrage INTEGER NOT NULL CHECK (
        kilometrage > 0 AND kilometrage < 10000000
    ),
    matricule CHAR(10) NOT NULL REFERENCES Conducteur(matricule)
);

CREATE TABLE Trajet (
    ligne INTEGER NOT NULL REFERENCES Ligne(num),
    immat CHAR(10) NOT NULL REFERENCES Bus(immat),
    nbtrajets INTEGER NOT NULL CHECK (
        nbtrajets > 0 AND nbtrajets < 100
    ),
    PRIMARY KEY (ligne, immat)
);