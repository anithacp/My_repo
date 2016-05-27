"""
Write a Python function that takes a list of words and returns the length of the longest one
"""
def long_word_list(lst):
	length = 0
	for i in lst:
		if len(i) > length:
			length = len(i)
	return length

print(long_word_list({'aqnsgd','asgkfy','ak','shuehulefrhslfdjlfc'}))

def find_longest_word(words_list):  
    word_len = []  
    for n in words_list:  
        word_len.append((len(n), n))  
    word_len.sort()  
    return word_len[-1][1]  
  
print(find_longest_word(["PHP", "Exercises", "Backend"]))
