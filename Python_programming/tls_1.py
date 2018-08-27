# From think like a scientist python ebook 
def newline():
	print()
print(type(5))
print(type('hello'))
print(type(-6.6))
newline()

betty = type('32')
print(betty)
print(id(betty))
newline()

'''
A module is a file that contains a collection of related functions grouped together.
To call one of the functions, we have to specify the name of the module and the
name of the function, separated by a dot. Called dot-notation.
'''
import math
print(math.pi)
newline()

def printTwice(value):
	print(value, value)

printTwice("abcd")
printTwice("Hello"*5)
printTwice(6.3265425)
newline()

print(5 == 5)
print(5.0 == 5)
print(5.8 == 5)
print('x' > 'a')
newline()

def compare(x,y):
	if x < y:
		print("x<y")
		a = 1
	elif x > y:
		print("x>y")
		a = 2
	else:
		print("x=y")
		a = 3
	return a

print(compare(5,6))
print(compare(15,6))
print(compare(15,15))
newline()

def countdown(n):
	if n == 0:
		print("Blastoff!!")
	else:
		print(n)
		countdown(n-1)

countdown(10)
newline()
'''
def recurse():
	recurse()

recurse()
'''


name = input("Enter your name: ")
age = input("Enter your age: ")
print(name, "is", age, "years old.")
newline()

def fact(n):
	if n < 0 or int(n) != n:
		print("Erroneous input. Enter positive integer")
		return
	elif n == 0:
		return 1
	else:
		return (n*fact(n-1))

print("Factorial of 9 is", fact(9))
newline()
print("Factorial of -9 is", fact(-9))
newline()
print("Factorial of 1.5 is", fact(1.5))
newline()


def fibonacci(n):
	if n == 0 or n == 1:
		return 1
	else:
		return fibonacci(n-1) + fibonacci(n-2)
fib = int(input("Enter a number: "))
print("Fibonacci of", fib, "is =", fibonacci(fib))
newline()
