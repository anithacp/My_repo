"""
Write a Python program to add 'ing' at the end of a given string (length should be at least 3). If the given string is already ends with 'ing' then add 'ly' instead. If the string length of the given string is less than 3, leave it unchanged
"""
def add_string(str):
	if len(str) < 3:
		return str
	if str[-3:] == 'ing':
		return str + 'ly'
	return str + 'ing'

print(add_string("abc"))
print(add_string("abcing"))
print(add_string("ab"))

def not_poor(str1):  
  snot = str1.find('not')  
  sbad = str1.find('poor')  
  
  if sbad > snot:  
    str1 = str1.replace(str1[snot:(sbad+4)], 'good')  
  
  return str1  
print(not_poor('The lyrics is not that poor!')) 
print(not_poor('The lyrics is not poor!')) 
print(not_poor('The lyrics is not bad!')) 
print(not_poor('The lyrics is poor not!')) 
	
