import psycopg2

# 连接到数据库
conn = psycopg2.connect(
    host="localhost",
    database="recensement",
    user="zhacheny",
    password="0412"
)

# 创建一个 cursor 对象
cur = conn.cursor()

# 插入departement
# num = input("No. du departement: ")
# nom = input("Nom du departement: ")
# pop = input("Population: ")
# sql = "INSERT INTO dpt2 VALUES ('%s','%s','%s');" %(num,nom,pop)
# cur.execute(sql)

# 删除departement
# num = input("No. du departement")
# sql_1 = "DELETE FROM dpt2 WHERE num='%s';" %(num)
# cur.execute(sql_1)
# conn.commit()

# 更新departement
num = input("No. du departement: ")
pop = input("population: ")
sql_2 = "UPDATE dpt2 SET population = '%s' WHERE num = '%s';" %(pop,num)
cur.execute(sql_2)
conn.commit()

# 执行排序查询语句
cur.execute("SELECT num,nom,population FROM dpt2 ORDER BY num;")
# 读取查询结果
rows = cur.fetchall()
# 输出查询结果
print("\t[No.] num (population)")
for row in rows:
    print("\t [%s] %s (%s)" % (row[0], row[1], row[2]))

# 关闭 cursor 和连接
cur.close()
conn.close()
