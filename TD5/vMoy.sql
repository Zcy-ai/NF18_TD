CREATE VIEW vMoy AS
SELECT ROUND(AVG(valeur), 1) AS moy, etudiant
FROM Note
GROUP BY etudiant;