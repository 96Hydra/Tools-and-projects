import smtplib 
from email import encoders 
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email.mime.multipart import MIMEMultipart

server = smtplib.SMTP('smtp.world4you.com', 25)

server.ehlo()

with open ('password.txt', 'r') as f:
    password = f.read()

server.login('hydratestmail@gmail.com', password)

msg = MIMEMultipart

#Specify your name 
msg['From'] = 'Hydra'

#Specify where it is going
msg ['To'] = putemailhere@dontforget.com

#Specify subject
msg['Subject'] = ''

with open('message.txt', 'r') as f:
    message = f.read()

msg.attach(MIMEText(message, 'plain'))

filename = 'coding.jpg' 
atachment = open('filename, 'rb')

p = MIMEBase('application', 'octet-stream')
p.set_payload(attachement.read()) 

encoders.encode_base64(p)
p.add_header('Content-Disposition', f'atachement; filename{filename}')
msg.attach(p) 

text = msg.as_string()
server.sendmail('mailtesting@testmail.com'), 'putemailhere@dontforget.com', text) 