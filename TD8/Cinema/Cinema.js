db.Cinema.drop()

db.Cinema.insert(
{
nom:"Goodfellas",
annee:1990,
realisateur:{nom:"Scorsese", prenom:"Martin"},
acteurs:
	[
	{nom:"De Niro", prenom:"Robert"},
	{nom:"Liotta", prenom:"Ray"},
	{nom:"Pesci", prenom:"Joe"}
	]
})

db.Cinema.insert(
{
nom:"The Godfather", 
annee:1972,
realisateur:{nom:"Coppola", prenom:"Francis Ford"},
acteurs: 
	[ 
	{nom:"Pacino", prenom:"Al"},
	{nom:"Brando", prenom:"Marlon"}, 
	{nom:"Duvall", prenom:"Robert"}
	]
})

db.Cinema.insert(
{
nom:"Million Dollar Baby",
realisateur:{nom:"Eastwood", prenom:"Clint"},
acteurs: 
	[ 
	{nom:"Swank", prenom:"Hilary"}, 
	{nom:"Eastwood", prenom:"Clint"}
	]
})

db.Cinema.insert(
{
nom:"Gran Torino",
annee:2008,
realisateur:{nom:"Eastwood", prenom:"Clint"},
acteurs: 
	[ 
	{nom:"Vang", prenom:"Bee"}, 
	{nom:"Eastwood", prenom:"Clint"}
	]
})

db.Cinema.insert(
{
nom:"Unforgiven",
realisateur:{nom:"Eastwood", prenom:"Clint"},
acteurs: 
	[ 
	{nom:"Hackman", prenom:"Gene"}, 
	{nom:"Eastwood", prenom:"Clint"}
	]
})

db.Cinema.insert(
{
nom:"Mystic River",
realisateur:{nom:"Eastwood", prenom:"Clint"},
acteurs: 
	[ 
	 {nom:"Penn", prenom:"Sean"}, 
	 {nom:"Bacon", prenom:"Kevin"}
	]
})

db.Cinema.insert(
{
nom:"Honkytonk Man",
realisateur:{nom:"Eastwood", prenom:"Clint"},
annee:1982,
acteurs: 
	[ 
	 {nom:"Eastwood", prenom:"Kyle"},
	 {nom:"Bloom", prenom:"Verna"}
	]
})
// Quels sont les films sortis en 1990 ?
db.Cinema.find({"annee":1990})
// Quels sont les films sortis avant 2000 ?
db.Cinema.find({"annee":{$lt:2000}})
// Quels sont les films réalisés par Clint Eastwood ?
db.Cinema.find({"realisateur":{"nom":"Eastwood", "prenom":"Clint"}})
// Quels sont les films réalisés par quelqu'un prénommé Clint ?
db.Cinema.find({"realisateur.prenom":"Clint"})
// Quels sont les films réalisés par quelqu'un prénommé Clint avant 2000  ?
db.Cinema.find({"realisateur.prenom":"Clint", "annee":{$lt:2000}})
// Quels sont les films dans lesquels joue Clint Eastwood ?
db.Cinema.find({"acteurs":{nom:"Eastwood", prenom:"Clint"}})
// Quels sont les films dans lesquels joue un Eastwood ?
db.Cinema.find({"acteurs.nom":"Eastwood"})
// Quels sont les noms des films dans lesquels joue un Eastwood ?
db.Cinema.find({"acteurs.nom":"Eastwood"},{"nom":1,"_id":0})