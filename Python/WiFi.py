#Hunting for wifi networks near me 

import subprocess

nw = subprocesss.check_output(['netsh', 'wlan', 'show', 'network'])
decoded_nw = nw.decode('ascii')
print(decoded_nw)