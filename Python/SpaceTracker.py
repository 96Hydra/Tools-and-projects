import ISS_Info

details = ISS_Info.iss_people_in_space()
print("There are currently {} people in space".format(details['number']))

for p in details['people']:
    print ("Name: {} (Craft: {}".format(p['name'],p['craft']))
