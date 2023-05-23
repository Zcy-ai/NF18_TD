
## Q1 Établissez un modèle relationnel correspondant à ce modèle UML.

Les heritage

Pour les deux, 

on choisit une transformation par classe mere:
* heritage presque complet
* Les classes mere ne sont pas abstraite et elles ont des associations tiers

Transformation par référence: 

possible, mais on a autant de relation inutile

Transformation par classe fille: indésirable, car cela plus des contraints

## Q2 En se basant sur le modèle relationnel que vous avez produit, écrivez les requêtes SQL LDD permettant de créer les tables dans une base de données.

    1. Auteur(#ID:Integer, Nom:String, Prenom: String, Email:String, NombrePublication:Integer, AnneeD'experience:Integer)
    
    Avec Nom, Prenom Not NULL, Si NombrePublication Not NULL alors AnneeD'experience NULL, Si NomnbrePublication NULL AnneD'experience NULL

    2. Revue(#Nom:String, Periodicite:{...}, type:{"S"|"M"}DomaineDeRecherche:String, Specialite:String)

    Avec Periodicite Not NULL si type = "S" alors DomaineDeRecherche NOT NULL et si type = "M" alors Specialite Not NULL et si type NULL alors DomaineDeRecherche et Specialite NULL

    3. Numero(#Revue=>Revue, Numero:Integer, Annee:Integer, NombreDePages:Integer)

    Avec Numero local key, Annee et NombreDePage NOT NULL,NombreDePage > 0 et Annee > 0

    4. Article(#Titre: String, contenu:String, numero=>Numero.numero, nomRevue=>Numero.Revue)

    Avec Contenu Not NULL et Numero Not NULL
    
    5. Reference(#Article=>Article,#Article=>Article)

    6. Ecrit(#idAuteur=>Auteur, #titre=>Article)

    Contraints complexes: 
    Projection(Revue, Nom) = Projection(Numero, Revue)
    Projection(Article, numero, nomRevue) = Projection(Numero, Numero, Revue)
    Projection(Auteur,ID) = Projection(Ecrit, idAuteur)
    Projection(Article, titre) = Projection(Ecrit, titre)

-------------------

    DFE

    Revue: Nom => Periodicite, type, DomaineDeRecherche, Specialite

    Auteur: ID => Nom, Prenom, Email ,NombrePublication:Integer, AnneeD'experience

    Numero: (Revue, Numero) => Annee, NbPage

    Article: titre => Contenu, Num, nomRevue

    Reference: 空集

    Ecrit: 空集

    BCNF

    CREATE TABLE Revue (
        Nom VARCHAR(255) PRIMARY KEY,
        Periodicite ENUM('Quotidien', 'Hebdomadaire', 'Mensuel', 'Bimestriel', 'Trimestriel', 'Semestriel', 'Annuel'),
        Type ENUM('S', 'M'),
        DomaineDeRecherche VARCHAR(255),
        Specialite VARCHAR(255)
    );

    CREATE VIEW v_Revue AS
    SELECT *
    FROM Revue
    WHERE
        (Type = 'S' AND DomaineDeRecherche IS NOT NULL AND Specialite IS NULL)
        OR (Type = 'M' AND Specialite IS NOT NULL AND DomaineDeRecherche IS NULL)
        OR (Type IS NULL AND DomaineDeRecherche IS NULL AND Specialite IS NULL);


    CREATE TABLE Auteur (
        ID INT PRIMARY KEY,
        Nom VARCHAR(255),
        Prenom VARCHAR(255),
        Email VARCHAR(255),
        Type: ENUM('chercheur', 'journaliste'),
        NombrePublication INT,
        AnneeExperience INT
    );

    CREATE VIEW v_Auteur AS
    SELECT *
    FROM Auteur
    WHERE
        (Type = 'chercheur' AND NombrePublication IS NOT NULL AND AnneeExperience IS NULL)
        OR (Type = 'journaliste' AND AnneeExperience IS NOT NULL AND NombrePublication IS NULL)
        OR (Type IS NULL AND AnneeExperience IS NULL AND NombrePublication IS NULL);


    CREATE TABLE Numero (
        Revue VARCHAR(255),
        Numero INT,
        Annee INT,
        NombreDePages INT,
        PRIMARY KEY (Revue, Numero),
        FOREIGN KEY (Revue) REFERENCES Revue(Nom)
    );

    CREATE TABLE Article (
        Titre VARCHAR(255),
        Contenu TEXT,
        Numero INT,
        NomRevue VARCHAR(255),
        PRIMARY KEY (Titre),
        FOREIGN KEY (Numero, NomRevue) REFERENCES Numero(Numero, Revue)
    );

    CREATE TABLE Reference (
        Article1 VARCHAR(255),
        Article2 VARCHAR(255),
        PRIMARY KEY (Article1, Article2),
        FOREIGN KEY (Article1) REFERENCES Article(Titre),
        FOREIGN KEY (Article2) REFERENCES Article(Titre)
    );

    CREATE TABLE Ecrit (
        idAuteur INT,
        titreArticle VARCHAR(255),
        PRIMARY KEY (idAuteur, titreArticle),
        FOREIGN KEY (idAuteur) REFERENCES Auteur(ID),
        FOREIGN KEY (titreArticle) REFERENCES Article(Titre)
    );

---------
## Écrivez en algèbre relationnel et en SQL la requête permettant de trouver les noms et prénoms des auteurs des articles qui ont un contenu non null.

    R1 = Restriction(Article, Contenu not null)

    R2 = Jointure(R1, Ecrit, R1.titre = Ecrit.titreArticle)

    R3 = Jointure(R2, Auteur, R2.idAuteur = Auteur.id)

    R4 = Projection(R3, nom, prenom)

----------

    SELECT nom, prenom
    FROM Auteur au
    JOIN Ecrit e ON e.idAuteur = a.id
    JOIN Article ar ON ar.titre = e.titreArticle
    WHERE ar.contenu IS NOT NULL;

## Écrivez en algèbre relationnel et en SQL la requête permettant de trouver les titres des articles qui ne sont jamais référencés.

    R1 = JOINTUREExterneGauche(article,reference, article.titre=Reference.articlereferencé)

    R2 = Restriction(R1, articleReferencé IS NULL)

    R3 = Projection(R2, titre)

------------
    SELECT titre
    FROM Article ar
    LEFT JOIN Reference ref ON ref.Article1 = ar.titre
    WHERE ref.Article1 IS NULL;

## Écrivez en SQL la requête permettant de renvoyer le nom de toutes les revues annuelles avec le nombre de numéros qu'elles ont publié et la somme des pages que cela représente, sous réserve que la revue ait publié au moins deux numéros.

    SELECT 
        Revue.Nom,
        COUNT(Numero.Numero) AS NombreNumeros,
        SUM(Numero.NombreDePages) AS SommePages
    FROM
        Revue
    JOIN
        Numero ON Revue.Nom = Numero.Revue
    WHERE
        Revue.Periodicite = 'Annuel'
    GROUP BY
        Revue.Nom
    HAVING
        COUNT(Numero.Numero) >= 2;

