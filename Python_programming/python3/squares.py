""" Numerical lists """
from __future__ import print_function

def main():
    """ Main program """
    print("Make a list of the first 10 square numbers:")
    squares = []
    for val in range(1, 11):
        #two asterisks ( ** ) represent exponents.
        squares.append(val**2)
    print(squares)
    print("Min value: %d" % (min(squares)))
    print("Max value: %d" % (max(squares)))
    print("Total value: %d" % (sum(squares)))

    # Using list comprehension allows you to generate this same list in
    # just one line of code.
    # range() function, Python stops one item before the second index
    # you specify
    squares_1 = [value**2 for value in range(1, 11)]
    print(squares_1)
    # List of skip counted numbers using list comprehension
    skip_list = [val for val in range(0, 20, 3)]
    print(skip_list)

    # List Slicing
    players = ['charles', 'martina', 'michael', 'florence', 'eli']
    print(players)
    # want the second, third, and fourth items in a list
    print(players[1:4])
    # If you omit the first index in a slice, Python automatically
    # starts your slice at the beginning of the list
    # Print 1st 3 elements
    print(players[:3])
    # want all items from the third item through the last item
    print(players[2:])
    # print the last three players
    print(players[-3:])
    # assigning directly makes new list a reference to the orig list
    new_players = players
    print(new_players)

    # Copying lists - creates a independent list
    new_players_1 = players[:]
    print(new_players_1)
    players[0] = 'James'
    print(players)
    print(new_players)
    print(new_players_1)

    # immutable list is called a tuple. A tuple looks just like a list
    # except you use parentheses instead of square brackets.
    # Eg we have a rectangle that should always be a certain size, we
    # can ensure that its size does not change by putting the dimensions
    # into a tuple
    dimensions = (200, 50)
    print(dimensions[0])
    print(dimensions[1])
    # dimensions[0] = 250
    # >>> TypeError: 'tuple' object does not support item assignment

    # Although you cannot modify a tuple, you can assign a new value to
    # a variable that holds a tuple. So if we wanted to change our
    # dimensions, we could redefine the entire tuple
    dimensions = (400, 80)
    print(dimensions[0])
    print(dimensions[1])

main()
