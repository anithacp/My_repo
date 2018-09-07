""" Basic program"""
from __future__ import print_function

def main():
    """ Main program"""
    motorcycles = []
    motorcycles.append('honda')
    motorcycles.append('yamaha')
    motorcycles.append('suzuki')
    motorcycles.append('rx100')
    motorcycles.append('enfield')
    motorcycles.append('bullet')
    print(motorcycles)
    #Insert as 2nd element
    motorcycles.insert(1, 'ducati')
    print(motorcycles)
    #Delete 3rd element
    del motorcycles[2]
    print(motorcycles)
    #Remove the last element from list
    popped_motorcycle = motorcycles.pop()
    print(motorcycles)
    print(popped_motorcycle)
    #Include index in pop()
    popped_motorcycle = motorcycles.pop(2)
    print(motorcycles)
    print(popped_motorcycle)
    #Use value to delete...but cant save the deleted element
    popped_motorcycle = motorcycles.remove("rx100")
    print(motorcycles)
    print(popped_motorcycle)
    #The remove() method deletes only the first occurrence of the value
    #you specify. If there is a possibility the value appears more than
    #once in the list, you will need to use a loop to determine if all
    #occurrences of the value have been removed.
    to_remove = "ducati"
    motorcycles.remove(to_remove)
    print(motorcycles)

    new_mc = "BMW"
    # _ is a standard placeholder name for ignored members in a
    #for-loop and tuple assignment, 
    for _ in range(0, 5):
        motorcycles.append(new_mc)
    print(motorcycles)
    motorcycles.remove(new_mc)
    print(motorcycles)

main()
