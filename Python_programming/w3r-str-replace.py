"""
def str_replace(str):
	first_char = str[0:1]
	count = 0
	for i in str:
		if count == 0:
			count += 1
			continue
		if i == first_char:
			str[count] = '$'
			count += 1
	return str

print(str_replace("restart"))
"""
def change_char(str1):  
  char = str1[0]  
  length = len(str1)  
  str1 = str1.replace(char, '$')  
  str1 = char + str1[1:]  
  
  return str1  
  
print(change_char('restart')) 
