"""
 Write a Python program to count the number of strings where the string length is 2 or more and the first and last character are same from a given list of strings.
"""
def str_count(string_list):
	new_list = []
	count = 0
	for i in string_list:
		if i[0] == i[len(i)-1]:
			new_list.append(i)
			count += 1
	print (new_list)
	return count

print(str_count(['abc', 'xyz', 'aba', '1221']))


