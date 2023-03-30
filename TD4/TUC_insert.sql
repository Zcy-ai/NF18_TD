-- q1
INSERT INTO Conducteur VALUES ('AAA AAA AA', 'Bakataly', 'Danish');
INSERT INTO Conducteur VALUES ('AAA BBB AA', 'Colin', 'ZHA');
INSERT INTO Station VALUES (1, 'Gare SNCF', 'Paris');
INSERT INTO BUS VALUES ('5647 MA 49', 'Soufflets', 11, 'AAA AAA AA');
INSERT INTO BUS VALUES ('666 XX 66', 'Normaux', 12, 'AAA BBB AA');
INSERT INTO Ligne VALUES (42, 20);
INSERT INTO Arret VALUES (42, 1, 1); 
INSERT INTO Trajet Values (42, '5647 MA 49', 12);
INSERT INTO Ligne VALUES (1, 35);
INSERT INTO Trajet Values (1, '5647 MA 49', 15);

-- q2
SELECT c.nom, c.prenom FROM Bus b JOIN Conducteur c ON c.matricule = b.matricule
WHERE b.immat = '5647 MA 49';

-- q3
SELECT b.immat, b.typ
FROM Bus b Join Trajet t ON b.immat = t.immat
JOIN Arret a ON t.ligne = a.ligne
JOIN Station s ON a.station = s.num
WHERE a.rang = 1 AND s.nom = 'Gare SNCF';

-- q4
SELECT l.num
FROM Bus b JOIN Trajet t ON b.immat = t.immat AND b.typ = 'Soufflets'
RIGHT JOIN ligne l ON t.ligne = l.num
WHERE t.ligne IS NULL;