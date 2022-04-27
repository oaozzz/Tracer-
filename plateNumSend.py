import os
import plate_main
import cx_Oracle
from pandas import DataFrame

result_chars = (plate_main.result_chars)

# # 임의의 값 테스트용
# result_chars = '148다3411'

# 환경변수 등록
LOCATION = r"c:\instantclient_21_3"
os.environ["PATH"] = LOCATION + ";" + os.environ["PATH"]

# oracle 연결
connect = cx_Oracle.connect("hr", "hr", "localhost:1521/xe")
cursor = connect.cursor()

# SQL Query
# 인식 된 번호판을 t_carinfo에서 select ==> 체납차량인지 식별
sql = "select * from t_carinfo where plate_num = '{}'".format(result_chars)
# sql2 = "select * from t_board where plate_num = (select plate_num from t_carinfo where plate_num = '{}')".format(result_chars)
cursor.execute(sql)

# cursor객체는 인덱스 값을 꺼내올 수 없으므로 fetchall 함수 사용
t_carinfo_result = cursor.fetchall()
df_oracle = DataFrame(t_carinfo_result)
print(df_oracle)

# 재사용을 위해 select된 Data들을 각각 변수로 선언
name = t_carinfo_result[0][0]
plate_num = t_carinfo_result[0][1]
default_money = t_carinfo_result[0][2]
default_year = t_carinfo_result[0][3]
report_num = t_carinfo_result[0][4]

# t_reportNow에 하나의 튜플만 가질 수 있도록 t_board1의 튜플들 삭제 ==> t_reportNow 초기화
sql4 = f"delete from t_reportNow"
cursor.execute(sql4)

# 변수로 선언된 객체들을 이용하여 t_reportNow 테이블에 insert
sql5 = f"insert into t_reportNow values('{name}', '{plate_num}','{default_money}', '{default_year}', '{report_num}')"
cursor.execute(sql5)


# for i in cursor:
#     print(i)

# 커밋
commit = "commit"
cursor.execute(commit)

# 열린 순서의 반대순서로 close()
cursor.close()
connect.close()

