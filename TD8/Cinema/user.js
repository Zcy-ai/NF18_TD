db.User.drop()

db.User.insert(
{
 "pseudo":"Stph",
 "liked" : 
   [
     {"film":ObjectId("590c366d70f50381c920ca71"),"star":3},
     {"film":ObjectId("590c366d70f50381c920ca72"),"star":1}
   ]
}
)

db.User.insert(
{
 "pseudo":"Luke",
 "liked" : 
   [
     {"film":ObjectId("590c366d70f50381c920ca71"),"star":2}
   ]
}
)

db.User.insert(
{
 "pseudo":"Tuco",
 "liked" : 
   [
     {"film":ObjectId("590c366d70f50381c920ca73"),"star":3}
   ]
}
)

db.User.find()