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

    # Sort reverse in alphabetical order
    print("Reverse sorting using sort()")
    motorcycles.sort(reverse=True)
    print(motorcycles)

    # Sort in alphabetical order
    print("Sorting using sort()")
    motorcycles.sort()
    print(motorcycles)

    #Insert as 2nd element
    print("Insert")
    motorcycles.insert(1, 'ducati')
    print(motorcycles)

    #Delete 3rd element
    print("Delete")
    del motorcycles[2]
    print(motorcycles)

    #Remove the last element from list
    print("Remove last element using pop()")
    popped_motorcycle = motorcycles.pop()
    print(motorcycles)
    print(popped_motorcycle)

    #Include index in pop()
    print("Remove element using pop(index)")
    popped_motorcycle = motorcycles.pop(2)
    print(motorcycles)
    print(popped_motorcycle)

    #Use value to delete...but cant save the deleted element
    print("Remove any element using remove()")
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
    # insert 5 elements (0 to 4)
    for _ in range(0, 5):
        motorcycles.append(new_mc)
    print(motorcycles)
    motorcycles.remove(new_mc)
    print(motorcycles)

    #Printing a List in Alphabetical Order
    #The sorted() function lets you display your list in a particular
    #order but does not affect the actual order of the list
    print("Using sorted()")
    print(sorted(motorcycles))
    print(motorcycles)

    #In reverse alphabetical order without changing the original list
    print("Using sorted() with reverse")
    print(sorted(motorcycles, reverse=True))
    print(motorcycles)

    #Printing a List in Reverse Order - not reverse alphabetical!!
    print("Using reverse()")
    motorcycles.reverse()
    print(motorcycles)

    #Python counts the items in a list starting with one, so you
    #should not run into any off-by-one errors when determining the
    #length of a list.
    print(len(motorcycles))
    numbers = list(range(1,6))
    print(numbers)
    even_numbers = list(range(2,11,2))
    print(even_numbers)

main()
