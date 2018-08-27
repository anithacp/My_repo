fruit = "bananas"
letter = fruit[1]
last_letter = fruit[-1]
print(fruit, letter, len(fruit), last_letter)

for char in fruit:
	print(char)
print(fruit[:3])
print(fruit[1:5])

# Two dimentional table
'''
i = 1
while i <= 6:
	print(i*2)
	i = i + 1
print()
'''
table = []
num = int(input("Enter a positive integer: "))
for x in range(num):
	table.append((x * 2))

def print_table(table):
	print(table)
'''
	for row in table:
		#print(" ".join(row))
		print(row)
'''
print_table(table)

