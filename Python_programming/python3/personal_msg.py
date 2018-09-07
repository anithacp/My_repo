""" 2.3 """
#Store a person's name in a variable, and print a message to that
#person. Your message should be simple, such as, "Hello Eric, would you
#like to learn some Python today?"

from __future__ import print_function

def main():
    """ Main program"""
    name = input("Please enter your name: ")
    print("Hello", name, ", would you like to learn some Python today?")
    print("Hello " + name + ", would you like to learn some Python today?")
    print("Hello %s, would you like to learn some Python today?" % (name))
    print("Different forms of your name: %s %s %s" % (name.lower(),
    name.upper(), name.title()))
    
    age = input("Enter your age: ")
    print("Happy %dth birthday to %s!!!!!!!" % (int(age), name.title()))

main()
