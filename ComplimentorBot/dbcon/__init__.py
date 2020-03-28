import pymysql

compliment_db = pymysql.connect("comp-db.cwl2dcwupaak.us-east-2.rds.amazonaws.com", "jordankbartos", "hachimachicilantro", "complimentor_bot")

query = compliment_db.cursor()
query.execute("SELECT * FROM words")
row = query.fetchall()
print(row)
