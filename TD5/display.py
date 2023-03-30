def display(conn, login):
    # print("Notes de l'etudiant PRENOM NOM (%s)") %(login)
    cur = conn.cursor()
    sql = "SELECT nom, prenom FROM etudiant WHERE login ='%s';" %login
    cur.execute(sql)
    row = cur.fetchone()
    if row:
        nom = row[0]
        prenom = row[1]
        print("Note de l'etudiant %s %s %s" %(nom, prenom, login))
    else:
        print("etudiant inconnu")
        return 0
    sql = "SELECT description, daterendu, valeur FROM vDevoir WHERE etudiant = '%s';" %login
    cur.execute(sql)
    rows = cur.fetchall()
    for row in rows:
        print("- %s [%s]: %s" %(row[0],row[1],row[2]))
    sql_1 = "SELECT moy FROM vMoy WHERE etudiant = '%s';" %login
    cur.execute(sql_1)
    row = cur.fetchone()
    print("la Moyenne:", row[0])
    cur.close()