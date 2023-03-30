create VIEW vDevoir AS
SELECT d.description, d.daterendu, n.etudiant, n.valeur
FROM Devoir d JOIN Note n ON d.num = n.devoir
ORDER BY d.daterendu;