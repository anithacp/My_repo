evens_to_50 = [i for i in range(51) if i % 2 == 0]
print (evens_to_50)

doubles_by_3 = [x*2 for x in range(1,7) if (x*2) % 3 == 0]
print (doubles_by_3)

# Complete the following line. Use the line above for help.
even_squares = [x**2 for x in range(2,11) if (x) % 2 == 0]
print (even_squares)


l = [i ** 2 for i in range(1, 11)]
# Should be [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
'''
[start:end:stride]

Where start describes where the slice starts (inclusive), end is where it ends (exclusive), and stride describes the space between items in the sliced list. For example, a stride of 2 would select every other item from the original list to place in the sliced list.
'''
print (l[2:9:2])

to_five = ['A', 'B', 'C', 'D', 'E']

print (to_five[3:])
# prints ['D', 'E'] 

print (to_five[:2])
# prints ['A', 'B']

print (to_five[::2])
# print ['A', 'C', 'E']

my_list = [x for x in range(1, 11)]
print ("Orig list: ", my_list)
backwards = my_list[::-1]
print ("Reversed list: ", backwards)
to_100_list = [x for x in range(1, 101)]
rev_100_list_by_10 = to_100_list[::-10]
print (rev_100_list_by_10)

threes_and_fives=[i for i in range(1,16) if i % 3 == 0 or i % 5 == 0]
print (threes_and_fives)

garbled = "!XeXgXaXsXsXeXmX XtXeXrXcXeXsX XeXhXtX XmXaX XI"

reverse_garbled = garbled[::-1]
print (reverse_garbled)

message = reverse_garbled[::2]
print (message)

