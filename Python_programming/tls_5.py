
import tls_utils

new_list = range(1,6)
print(new_list)
print(new_list[-2])
tls_utils.newline()

my_list = [1,2,3] *4
print(my_list)
del my_list[0] # delete 1st element
print(my_list)
del my_list[-1] # delete last element
print(my_list)
del my_list[-2] # delete 2nd last element
print(my_list)
tls_utils.newline()


a = "hello"
b = "hello"
print(id(a), id(b))
tls_utils.newline()


c = [1,2,3]
d = [1,2,3]
e = d # NOTE: Both refer to same object so modifying one changes the other as well
print(id(c), id(d), id(e))
print(d, e)
e[0] = 100
print(d, e)
tls_utils.newline()


'''
If we want to modify a list and also keep a copy of the original, we need to be able
to make a copy of the list itself, not just the reference. This process is sometimes
called cloning, to avoid the ambiguity of the word “copy.”
The easiest way to clone a list is to use the slice operator
'''
f = [1,2,3,4,5]
g = f[:]
print(id(f), id(g)) # Have different ids
print(f,g)
g[0] = 1000
print(f,g)
tls_utils.newline()

