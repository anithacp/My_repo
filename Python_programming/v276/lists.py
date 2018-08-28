""" Blah blah blah """
import random

def print_list_2d(new_list):
    """ Blah blah blah """
    for i in new_list:
        print "1st level element: %r" % i
        for j in i:
            print "2nd level element: %r" % j
    return new_list

def add_to_list_2d(new_list, num_inner_elem, num_outer_elem):
    """ Blah blah blah """
    for i in range(0, num_outer_elem):
        inner_elem = []
        for j in range(0, num_inner_elem):
            inner_elem.append(random.randint(1000, 2000))
        new_list.append(inner_elem)
    return new_list
 
def main_func():
    """ Blah blah blah """
    the_count = [1, 2, 3, 4, 5]
    list_2d = [[23, 78, 78], [45, 867, 98676], [567, 3545, 6598], \
        [53636, 634, 8597]]
    fruits = ['apples', 'oranges', 'pears', 'apricots']
    change = [1, 'pennies', 2, 'dimes', 3, 'quarters']

    # this first kind of for-loop goes through a list
    for number in the_count:
        print "This is count %d" % number

    # same as above
    for fruit in fruits:
        print "A fruit of type: %s" % fruit

    # also we can go through mixed lists too
    # notice we have to use %r since we don't know what's in it
    for i in change:
        print "I got %r" % i

    # we can also build lists, first start with an empty one
    elements = []
    # then use the range function to do 0 to 5 counts
    for i in range(0, 6):
        print "Adding %d to the list." % i
        # append is a function that lists understand
        elements.append(i)
        # now we can print them out too
        for i in elements:
            print "Element was: %d" % i

    print "Before:"
    print_list_2d(list_2d)

    add_to_list_2d(list_2d, 3, 2)

    print "After:"
    print_list_2d(list_2d)

main_func()


