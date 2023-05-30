![](https://nf18.ens.utc.fr/devoir/20Dbdj_web_devoir/res/arbres.png)

## Réalisez une implémentation de la couche de stockage en utilisant la technologie Relationnel-JSON sous PostgreSQL.

### Code SQL de création des tables

    CREATE TABLE Pays (
        code CHAR(2) PRIMARY KEY,
        nom VARCHAR NOT NULL
    );

    CREATE TABLE Foret (
        id INTEGER PRIMARY KEY,
        nom VARCHAR NOT NULL,
        surface INTEGER NOT NULL,
        type CHAR(2) NOT NULL CHECK(type IN ('r','f','rf')) NOT NULL,
        arbre JSON NOT NULL
    );

    CREATE Table Appartient (
        foret INTEGER,
        pays CHAR(2),
        PRIMARY KEY (foret,pays),
        FOREIGN KEY (foret) REFERENCES Foret(id),
        FOREIGN KEY (pays) REFERENCES Pays(code)
    );

### Code SQL d'insertion de données d'exemple

    INSERT INTO Pays VALUES('FR','France')；
    INSERT INTO Pays VALUES('ES','Espagne');
    INSERT INTO Foret VALUES(1,'asdada',22,'r','[{"marque":"ACBC","h":10,"d":1,"Forme":"cone"},{"marque":"ACBD","h":20,"d":1,"Forme":"cylindre"}
    ]');
    INSERT INTO Foret VALUES(2,'adasdada',22,'r','[{"marque":"FFP1","h":12,"d":3,"Forme":"cone"}]');
    INSERT INTO Appartient VALUES(1,'FR'),(2,'FR'),(3,'ES');

## Proposez des vues permettant de gérer les méthodes.

### Code SQL de création des méthodes

    CREATE VIEW v_foret_sous_methode AS
    SELECT f.nom, f.surface, f.type, a->>'marque' AS Marque, CAST(a->>'h' AS INTEGER) AS h, CAST(a->>'d' AS INTEGER) AS d, a->>'forme' AS Forme
    FROM Foret f, JSON_ARRAY_ELEMENTS(f.arbre) a;

    CREATE VIEW v_arbre AS
    SELECT * ,ROUND(d,2) AS r, CASE WHEN forme = 'cone' THEN ROUND(a*d/20*d/20*h,2)
    ELSE ROUND(1.5*d/20*d/20*h,2)
    END AS cubage
    FROM v_foret_sous_methode

### Exemple de requête sur ces méthodes