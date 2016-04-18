print('Hello World')

shopping_list = ["banana", "orange", "apple"]

stock = {
    "banana": 6,
    "apple": 0,
    "orange": 32,
    "pear": 15
}
    
prices = {
    "banana": 4,
    "apple": 2,
    "orange": 1.5,
    "pear": 3
}

# Write your code below!
def compute_bill(food):
    total = 0
    for a in food:
        if stock[a] > 0:
            total += prices[a]
            stock[a] -= 1
    return total

net = compute_bill(shopping_list)
print("%0.1f" % net)

lloyd = {
    "name": "Lloyd",
    "homework": [],
    "quizzes": [],
    "tests": []
}
alice = {
    "name": "Alice",
    "homework":[],
    "quizzes":[],
    "tests":[]
}
tyler = {
    "name": "Tyler",
    "homework":[],
    "quizzes":[],
    "tests":[]
}

n = [1, 3, 5, 7, 9, 11]
# Remove the first item in the list here

print (n.pop(0))
print (n)

del(n[0])
print (n)

print (n.remove(11))
print (n)

choice = input('Enjoying the course? (y/n)')

while choice != 'y' and choice != 'n':  # Fill in the condition (before the colon)
    choice = input("Sorry, I didn't catch that. Enter again: ")

hobbies = []

# Add your code below!
for i in range(3):
    hobbies.append(input("Tell your hobby: "))
    
print (hobbies)



