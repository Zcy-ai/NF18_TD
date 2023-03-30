DROP TABLE IF EXISTS ArretDeBus;
DROP TABLE IF EXISTS SiteTouristique;
DROP TABLE IF EXISTS Activite;
DROP TABLE IF EXISTS Hotel;
DROP TABLE IF EXISTS TypeCuisine;
DROP TABLE IF EXISTS Restaurant;
DROP TABLE IF EXISTS Activite_SiteTouristique;
DROP TABLE IF EXISTS Dessert_Site;
DROP TABLE IF EXISTS Dessert_Hotel;

CREATE TABLE ArretDeBus (
    ligne INTEGER,
    horaire TIME,
    PRIMARY KEY (ligne, horaire)
);

CREATE TABLE SiteTouristique (
    nom VARCHAR PRIMARY KEY,
    anciennete INTEGER
);

CREATE TABLE Activite (
    nom VARCHAR PRIMARY KEY
);

CREATE TABLE Hotel (
    nom VARCHAR PRIMARY KEY,
    addresse VARCHAR,
    code_postal VARCHAR,
    ville VARCHAR,
    etoile INTEGER
);

CREATE TABLE TypeCuisine (
    label VARCHAR PRIMARY KEY
);

CREATE TABLE Restaurant (
    sk INTEGER PRIMARY KEY,
    nom VARCHAR NOT NULL,
    telephone VARCHAR,
    type_cuisine VARCHAR NOT NULL,
    hotel VARCHAR,
    site_touristique VARCHAR,
    FOREIGN KEY (type_cuisine) REFERENCES  TypeCuisine(label),
    FOREIGN KEY (hotel) REFERENCES Hotel(nom),
    FOREIGN KEY (site_touristique) REFERENCES SiteTouristique(nom)
);

CREATE TABLE Activite_SiteTouristique (
    activite VARCHAR,
    site_touristique VARCHAR,
    FOREIGN KEY (site_touristique) REFERENCES SiteTouristique(nom),
    FOREIGN KEY (activite) REFERENCES Activite(nom),
    PRIMARY KEY (activite, site_touristique)
);

CREATE TABLE Dessert_Site (
    bus_ligne INTEGER,
    bus_horaire TIME,
    bus_site VARCHAR,
    FOREIGN KEY (bus_ligne, bus_horaire) REFERENCES ArretDeBus(ligne, horaire),
    FOREIGN KEY (bus_site) REFERENCES SiteTouristique(nom),
    PRIMARY KEY (bus_ligne, bus_horaire, bus_site) 
);

CREATE TABLE Dessert_Hotel (
    bus_ligne INTEGER,
    bus_horaire TIME,
    bus_hotel VARCHAR,
    FOREIGN KEY (bus_ligne, bus_horaire) REFERENCES ArretDeBus(ligne, horaire),
    FOREIGN KEY (bus_hotel) REFERENCES Hotel(nom),
    PRIMARY KEY (bus_ligne, bus_horaire, bus_hotel) 
);
