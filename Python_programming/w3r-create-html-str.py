"""
Write a Python function to create the HTML string with tags around the word(s).
"""
def add_tags(char1, string2):
	result = "<"+char1+">"+string2+"</"+char1+">"
	return result

def add_tags1(tag, word):  
    return "<%s>%s<!--%s-->" % (tag, word, tag)
print(add_tags('i', 'Python'))
print(add_tags('b', 'Python Tutorial'))
print(add_tags1('i', 'Python'))
print(add_tags1('b', 'Python Tutorial'))
