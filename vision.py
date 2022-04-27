import requests
import json
import base64
import re
import os
import cx_Oracle
from pandas import DataFrame

# postman myWorkspace에서 key와 base_url 값 가져오기
key = 'AIzaSyCmUxa-455EtL2FNAozVgH41hXW-oYOjYA'
base_url = 'https://vision.googleapis.com/v1/images:annotate'
url = f'{base_url}?key={key}'


def recognize(path):
    row = open(path, 'rb').read()

    # path의 이미지를 base64코드로 변환시켜 json_row에 넣기위해
    # base64를 이용해 인코딩후 바로 디코딩
    content = base64.b64encode(row).decode('ascii')
    json_row = {
        "requests": [{
            "image": {
                "content": content
            },
            "features": [{
                "type": "TEXT_DETECTION"
            }],
            "imageContext": {
                "languageHints": ["ko"] # 한국어의 languageHints 코드 ko
            }
        }]
    }
    # 값을 전달해주는 dumps메소드
    data = json.dumps(json_row)

    #결과 return
    return requests.post(url, data).json()


if __name__ == "__main__":
    # 정규표현식
    reg = re.compile("[0-9]{2,3}..\\d{4}")

    # recognize괄호 안의 문자열은 path에 해당하는 부분
    j = recognize("C:/Users/SMHRD/Desktop/image002.png")
    for item in j['responses']:
        for textAnnotation in item['textAnnotations']:
            description = textAnnotation['description']
            plate_numbers = reg.findall(description)
            if len(plate_numbers) > 0:
                # # 인식부분 좌표 출력
                # print(textAnnotation['boundingPoly']['vertices'])
                for plate_number in plate_numbers:
                    print("===========================================")
                    print(f"번호판 식별 결과 : {plate_number}")




#==================== DB ========================================

# 환경변수 등록
LOCATION = r"c:\instantclient_21_3"
os.environ["PATH"] = LOCATION + ";" + os.environ["PATH"]

# oracle 연결
connect = cx_Oracle.connect("hr", "hr", "localhost:1521/xe")
cursor = connect.cursor()

# SQL Query

# 인식 된 번호판을 t_carinfo에서 select ==> 체납차량인지 식별
sql = "select * from t_carinfo where plate_num = '{}'".format(plate_number)
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
