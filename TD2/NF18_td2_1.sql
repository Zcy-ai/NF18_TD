DROP TABLE IF EXISTS Match;
DROP TABLE IF EXISTS Joueur;
DROP TABLE IF EXISTS Equipe;

CREATE Table Equipe(
    nom VARCHAR PRIMARY KEY
);

CREATE Table Joueur(
    id Integer PRIMARY KEY,
    nom VARCHAR NOT NULL,
    prenom VARCHAR NOT NULL,
    equipe VARCHAR NOT NULL REFERENCES Equipe(nom)
);

CREATE Table Match(
    gagnant VARCHAR REFERENCES Equipe(nom),
    perdant VARCHAR REFERENCES Equipe(nom),
    date Date NOT NULL,
    Score INTEGER CHECK(score>=0 AND score<=1),
    PRIMARY KEY (gagnant, perdant),
    CHECK(gagnant <> perdant)
);

INSERT INTO Equipe VALUES('PSG');
INSERT INTO Equipe VALUES('OM');

INSERT INTO Joueur VALUES(1, 'Leo', 'Messi', 'PSG');
INSERT INTO Joueur VALUES(2, 'Alexis', 'Sanchez', 'OM');