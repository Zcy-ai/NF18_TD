## MCD en UML

![](/TD8/img/book.jpeg)

## NLD

    Book(#id:int, title:string, subtitle:string, year:int)
    Avec (title,subtitke,year) clé
    Auteur(#name:string, #firstname:string, #book=>Book)
    Licence(#by:boolean,#sa:boolean,#uc:boolean,#book=>Book)


## Réécrivez la requête correspondant à db.Book.find({"license.by":true}, {"title":1}) dans votre base relationnelle.

    SELECT b.title
    FROM Book b
    Join Licence l ON l.book = b.id
    WHERE l.by IS TRUE

