#gps
from numpy import double
import serial
import pynmea2
def parseGPS(str):
    if str.find('GGA') > 0:
        msg = pynmea2.parse(str)
        print ('Timestamp: {} -- Lat: {} {} -- Lon: {} {} -- Altitude:{} {}'.format(msg.timestamp,msg.lat,msg.lat_dir,msg.lon,msg.lon_dir,msg.altitude,msg.altitude_units))


        #우리나라와 외국에서 받아오는 형식이 달라서 우리나라 형식으로 값 환산해주는방법
        if msg.lat != "" :
            print("hello")
            lat = round((double(msg.lat[0:2])+(double(msg.lat[2:])/60)),6)
            lon = round((double(msg.lon[0:3])+(double(msg.lon[3:])/60)),6)
            print(lat)
            print(lon)
        else :
            print("no value")

serialPort = serial.Serial("/dev/ttyS0", 9600, timeout=0.5)
while True:
    str=serialPort.readline()
    str_decode = str.decode()
    parseGPS(str_decode)