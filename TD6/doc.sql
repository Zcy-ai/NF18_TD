/** 
DROP TABLE Versions ;
DROP TABLE Documents ;
DROP TABLE Users ;
**/
CREATE TABLE Users (
	login VARCHAR PRIMARY KEY,
	pwd VARCHAR,
	name VARCHAR
) ;
CREATE TABLE Documents (
	id INTEGER PRIMARY KEY,
	title VARCHAR,
	creator VARCHAR REFERENCES Users(login)
) ;
CREATE TABLE Versions (
	num INTEGER,
	doc INTEGER REFERENCES Documents(id),
	contrib VARCHAR REFERENCES Users(login),
  PRIMARY KEY (num, doc)
) ;
INSERT INTO Users (login, pwd, name) VALUES ('karl', 'marx', 'Karl Marx') ;
INSERT INTO Users (login, pwd, name) VALUES ('al', 'ecm2', 'Albert Einstein') ;
INSERT INTO Users (login, pwd, name) VALUES ('stc', 'nf17', 'Stéphane Crozat') ;
INSERT INTO Users (login, pwd, name) VALUES ('paul', 'mot', 'Paul Pagnol') ;
INSERT INTO Documents (id, title, creator) VALUES (1, 'Le Capital', 'karl') ;
INSERT INTO Documents (id, title, creator) VALUES (2, 'La théorie de la relativité restreinte et générale', 'al') ;
INSERT INTO Documents (id, title, creator) VALUES (3, 'Les bases de données', 'stc') ;
INSERT INTO Versions (num, doc, contrib) VALUES (1, 1, 'karl') ;
INSERT INTO Versions (num, doc, contrib) VALUES (2, 1, 'karl') ;
INSERT INTO Versions (num, doc, contrib) VALUES (3, 1, 'karl') ;
INSERT INTO Versions (num, doc, contrib) VALUES (1, 2, 'al') ;
INSERT INTO Versions (num, doc, contrib) VALUES (2, 2, 'stc') ;
INSERT INTO Versions (num, doc, contrib) VALUES (1, 3, 'stc') ;