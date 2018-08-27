# Strings are immutable. So cant modify them.

import string

greeting = "Hello World"
new_greeting = "J" + greeting[1:]
print(new_greeting)

x = "babbubbabbub"
print(string.uppercase)
print(string.lowercase)
print(string.digits)
print(string.find(x,"bb"))
print(string.find(x,"bb",4)) # Find bb from index 4
print(string.find(x, "bb", 6, 8)) # Find bb from index 6 till index 7

new_str = ''
for i in range(len(greeting)):
	new_str = new_str + greeting[i] + string.whitespace

print(new_str)

