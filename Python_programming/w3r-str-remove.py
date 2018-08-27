"""
Write a Python program to remove the nth index character from a non empty string.
"""
def remove_char(string,n):
	first_part = string[:n]
	last_part = string[n+1:]
	return first_part + last_part

print(remove_char("hellooooo",3))

"""
Write a Python program to change a given string to a new string where the first and last chars have been exchanged.
"""
def char_exchange(string):
	new_str = string[1:len(string)-2]
	first_char = string[0]
	last_char = string[len(string)-1]
	return last_char + new_str + first_char

print(char_exchange("Zserdcvfghy"))

"""
 Write a Python program to remove the characters which have odd index values of a given string
"""
def char_remove_odd_index(string):
	new_str = string[0:len(string) -1:2]
	return new_str

def char_remove_even_index(string):
	new_str = string[1:len(string) -1:2]
	return new_str

def odd_values_string(str):  
  result = ""   
  for i in range(len(str)):  
    if i % 2 == 0:  
      result = result + str[i]  
  return result 

print(char_remove_even_index("ABCDEFGHIJKL"))
print(char_remove_odd_index("ABCDEFGHIJKL"))
print(odd_values_string("ABCDEFGHIJKL"))
