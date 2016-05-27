def strlen(x):
	count = 0
	for i in x:
		count += 1
	return count
x = input('Enter a string: ')
print ("Length of string", x , "is = ", strlen(x))
