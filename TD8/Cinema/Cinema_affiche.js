conn = new Mongo();
db = conn.getDB("Cinema");

recordset = db.Cinema.find({"acteurs.nom":"Eastwood"}, {"nom":1,"_id":0})

while ( recordset.hasNext() ) {
   film = recordset.next() ;
   print("- ", film.nom);	
}