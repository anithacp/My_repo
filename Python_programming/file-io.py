my_list = [i**2 for i in range(1,11)]

my_file = open("output.txt", "r+")

# Add your code below!
for x in my_list:
    my_file.write(str(x) + "\n")
my_file.close()

my_file = open("output.txt", "r")
print (my_file.read())
my_file.close()


my_file = open("text.txt", "r")
for i in range(3):
    print (my_file.readline())
my_file.close()

'''
file objects contain a special pair of built-in methods: __enter__() and __exit__(). The details aren't important, but what is important is that when a file object's __exit__() method is invoked, it automatically closes the file. How do we invoke this method? With with and as.

The syntax looks like this:

with open("file", "mode") as variable:
    # Read or write to the file
'''
with open("my_text.txt", "w") as my_file:
	my_file.write("Success!\n")

if my_file.closed == False:
    my_file.close()
print (my_file.closed)

