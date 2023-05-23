

    tIncident(Num, Dat, Gra, Nom, Usi, Pie, Mag, Fou, Mod, Cat, Typ, Fam)

    Num -> Dat, Gra, Nom, Typ     **,Fam(car Num -> Typ et Typ -> Fam)**
    Pie -> Mag, Fou, Mod, Usi       **, Cat(car Pie -> Mod et Mod -> Cat)**
    Mod -> Cat
    Typ -> Fam

## Q1

L'ensemble des DF's de base forment déjà une CM

## Q2

F+: {Celles de base + 粗体字}

## Q3

Clé  num, pie
Aucun attribut ne determine num ou pie
le couple(num, pie) determine tous les autres attrributs
On ne peut rajouter un troisieme, car il serait determiné que par num ou pie

## Q4

Le schéma se trouve en 1 NF 

要求数据库中的每个属性都是原子的，即不可再分的。

car il est :
    - 1NF: attribut atomique
    - 2NF: partie de clé Pie -> Mag(attribut non clé) 

## Q5

faire des décomposition

passage en 2NF: séparer Num et Pie dans des relaions différentes 

要求非主键属性完全依赖于候选键（Candidate Key）。候选键是唯一标识一条记录的属性或属性组合。如果一个非主键属性只依赖于候选键的一部分，那么就需要将该属性从表中分离出来，创建一个新的表，并与原表通过关联关系连接起来。这样可以消除数据的冗余和更新异常。

    Incident(#Num, Dat, Gra, Nom, Typ, Fam)
    Pie(#Pie, Mag, Fou, Mod, Usi, Cat)
    Incident_Pie(#Num=>Incident, #Pie=>Pie)

## Q6 

Typ => Fam
Mod => Cat

Passage en 3DF 

非主键之间不存在依赖,传递依赖是指非主键属性依赖于其他非主键属性，而不是直接依赖于候选键

    Incident + Piece(#Num=>Incident,#Pie=>Pie)
    Incident(#Nom,Dat, Gra, Nom, Typ=>Type)
    type(#Typ, Fam)
    Pie(#Pie, Mag, Fou, Usi, Cat, Mod=>Modele)
    Modele(#Mod, Cat)

## Q7

![](/TD7/img/IMG_1406.jpg)

