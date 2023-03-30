dpt:(#num:string(2), nom:string, population:entier) avec num cle, population not null

#### creation du fichier csv
* ouvrir un terminal
* atom dpt2.csv
* copier les donnees dans le ficheir dpt2.csv

#### TD2
* universite.sql
* copier le code SQL dans le fichier universite.sql
* dans le terminal avec le client psql \i universite.sql

* create VIEW v Devoir AS
SELECT d.description, d.daterendu, n.etudient, n.valeur
FROM Devoir d JOIN Note n ON d.num = n.devoir
ORDER BY d.daterendu

* 