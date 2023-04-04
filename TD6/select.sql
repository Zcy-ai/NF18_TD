-- En algèbre relationnel et en SQL, afficher le nom de l'auteur du document dont le titre est "Le Capital".
SELECT u.name
FROM Documents d JOIN Users u ON d.creator = u.login
WHERE d.title = 'Le Capital';

-- En algèbre relationnel et en SQL, afficher les logins des users qui sont à la fois creator et contrib et qui commencent par "k".
SELECT DISTINCT u.login
FROM Users u
JOIN Documents d on u.login = d.creator
JOIN Versions v on u.login = v.contrib
WHERE u.login LIKE 'k%';

-- En algèbre relationnel et en SQL, Afficher les logins des users qui n'ont ni créé, ni contribué.
SELECT u.login
FROM Users u
LEFT JOIN Documents d on u.login = d.creator
LEFT JOIN Versions v on u.login = v.contrib
WHERE d.creator IS NULL AND v.contrib IS NULL;

-- En SQL, afficher la dernière version (celle qui a le numéro le plus élevé) de chaque document, la liste sera triée par id des documents croissants.
SELECT d.id, d.title, MAX(v.num) AS last_version
FROM Documents d
JOIN Versions v ON v.doc = d.id
GROUP BY d.id
ORDER BY d.id;

-- En SQL, afficher le nombre de contributions pour chaque utilisateur, en face de leur nom, à condition que l'utilisateur ait contribué au moins 2 fois, la liste sera triée par nombre de contributions décroissant.
SELECT u.name, COUNT(v.contrib) AS nb_contributions
FROM Users u
JOIN Versions v ON v.contrib = u.login
GROUP BY u.login
HAVING COUNT(v.contrib) >= 2
ORDER BY nb_contributions DESC;

-- 为了筛选记录，我们在查询语句的末尾使用了 HAVING 关键字，而不是 WHERE 关键字。
-- 这是因为 HAVING 子句用于筛选基于聚合函数计算的结果，而 WHERE 子句用于筛选行级别的结果