import jaydebeapi

conn = jaydebeapi.connect("com.toshiba.mwcloud.gs.sql.Driver",
    "jdbc:gs://239.0.0.1:41999/dockerGridDB", ["admin", "admin"], "./gridstore-jdbc.jar")
curs = conn.cursor()

curs.execute("DROP TABLE IF EXISTS Sample")
curs.execute("CREATE TABLE IF NOT EXISTS Sample ( id integer PRIMARY KEY, value string )")
print('SQL Create Table name=Sample')
curs.execute("INSERT INTO Sample values (0, 'test0'),(1, 'test1'),(2, 'test2'),(3, 'test3'),(4, 'test4')")
print('SQL Insert')
curs.execute("SELECT * from Sample where ID > 2")
print(curs.fetchall())

curs.close()
conn.close()
print('success!')
