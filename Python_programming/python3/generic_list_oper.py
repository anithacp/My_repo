""" Basic program """
from __future__ import print_function

def add_to_list(mylist, elem):
    """ List add """
    #Add at the back
    #The index -1 always returns the last item in a list,
    mylist.insert(-1, elem)

def del_from_list(mylist, elem):
    """ List remove """
    mylist.remove(elem)

def del_index_from_list(mylist, index):
    """ List remove """
    mylist.pop(index)

def main():
    """ Main program """
    places = ["Italy", "Rome"]
    food = ["salad", "noodles"]
    add_to_list(places, "Spain")
    print(places)
    add_to_list(places, "Venice")
    print(places)
    add_to_list(food, "pasta")
    print(places)
    add_to_list(food, "roti")
    print(food)
    add_to_list(food, "curry")
    print(food)
    del_from_list(places, "Rome")
    print(places)
    del_index_from_list(places, 2)
    print(places)

main()
