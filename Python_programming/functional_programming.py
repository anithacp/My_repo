my_list = [x for x in range(16)]
print (my_list)

print (list(filter(None, my_list)))

def f(x):
	return x % 3 == 0

print (list(filter(f,my_list)))
			
print (list(filter(lambda x: x % 3 == 0, my_list)))

languages = ["HTML", "JavaScript", "Python", "Ruby"]
print (list(filter(lambda x: x == "Python", languages)))

squares=[x**2 for x in range(1,11)]
print (list(filter(lambda i: i >= 30 and i <= 70, squares)))

garbled = "IXXX aXXmX aXXXnXoXXXXXtXhXeXXXXrX sXXXXeXcXXXrXeXt mXXeXsXXXsXaXXXXXXgXeX!XX"
print (list(filter(lambda x: x != 'X', garbled)))
