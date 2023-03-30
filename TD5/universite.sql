CREATE TABLE etudiant(
login CHAR(8) PRIMARY KEY,
nom TEXT,
prenom TEXT
);

CREATE TABLE devoir(
num INTEGER PRIMARY KEY,
daterendu DATE UNIQUE NOT NULL,
description TEXT NOT NULL
);

CREATE TABLE note(
etudiant CHAR(8) REFERENCES etudiant(login),
devoir INTEGER REFERENCES devoir(num),
valeur INTEGER NOT NULL,
PRIMARY KEY(etudiant, devoir),
CHECK (valeur BETWEEN 0 AND 20)
);

INSERT INTO etudiant(login, nom, prenom) VALUES ('bfrankli', 'Franklin', 'Benjamin');
INSERT INTO devoir(num, daterendu, description) VALUES (1, '10-05-2013','Structures de donnees en C');
INSERT INTO note(etudiant, devoir, valeur) VALUES ('bfrankli', 1, 15);