"""
Write a Python function to insert a string in the middle of a string.
"""
def str_insert(old_str, in_str):
	i = int(abs(len(old_str)/2))
	result = old_str[0:i]+in_str+old_str[i:]
	return result

print(str_insert('[[]]', 'Python'))
print(str_insert('((()))', 'PHP'))

"""
Write a Python function to get a string made of 4 copies of the last two characters of a specified string
"""
def string_copy(in_str):
	if len(in_str) < 2:
		return in_str
	result = ''
	last_char = in_str[-2:]
	for i in range(4):
		result += last_char
	return result

print(string_copy('a'))
print(string_copy('abcdef'))

"""
Write a Python function to get a string made of 4 copies of its first three characters of a specified string. If the length of the string is less than 3 then return the original string.
"""
def first_3_copy(in_str):
	if len(in_str) < 3:
		return in_str
	new_str = in_str[0:3]
	return new_str*4

print(first_3_copy('Python'))
print(first_3_copy('Programming'))
