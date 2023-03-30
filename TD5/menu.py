import psycopg2
import display

# 连接到数据库
conn = psycopg2.connect(
    host="localhost",
    database="universite",
    user="zhacheny",
    password="0412"
)

login = '1'
while login != '0':
    login = input("Entrez le login de l'etudient recherché (0 pour sortie): ")
    display.display(conn, login)
# 创建一个 cursor 对象
# cur = conn.cursor()


# 关闭 cursor 和连接
# cur.close()
conn.close()
