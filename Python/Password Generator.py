# Quick and easy random password generator

import random
import string 

print('Password Gnerator')

#length of password 

length = int(input('\nEnter length of password: '))

#define data 

lower = string.ascii_lowercase
upper = string.ascii_uppercase
num = string.digits
symbols = string.punctuation

#Combine everything

all = lower + upper + num + symbols 

# Use Random! 

temp = random.sample(all,length)

#Password creation 

password = "".join(temp)

#print output

print(password)