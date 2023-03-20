import pyfiglet 
import sys 
import socket 
from datetime import datetime

ascii_banner = pyfiglet.figlet_format(" SCANNER OF PORTS ")
print(ascii_banner)

target = input(str("Target IP: "))

#Banner 
print("_" *50)
print("Scanning : " + target) 
print("Scan began at: " +str(datetime.now()))
print("_" *50)

try: 
    for port in range (1,65535):
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        socket.setdefaulttimeout(0.5)

        result = s.connect_ex((target,port))
        if result == 0:
            print ("[*] Port {} is open for business".format(port))
            s.close()

except KeyboardInterrupt
        print ("\n Stopping Scan :(")
        sys.exit()

except socket.error: 
        print("\ We knocked, no answer :(") 
        sys.exit()

