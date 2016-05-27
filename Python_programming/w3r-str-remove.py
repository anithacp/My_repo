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
