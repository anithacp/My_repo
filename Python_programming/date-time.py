import datetime  
now = datetime.datetime.now()  
print ("Current date and time : ")  
print (now.strftime("%Y-%m-%d %H:%M:%S"))
print (now.time())
'''
# Print a string after 3 seconds
if (datetime.datetime.now().time() - now.time() > 3):
	print ("3 seconds elapsed")
'''
