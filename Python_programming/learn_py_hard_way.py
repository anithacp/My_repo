"""This module does blah blah."""

print ("7/4 =", 7/4)
print ("7.0/4.0 =", 7.0/4.0)
print ("Roosters = ", 100 - 25 * 3 % 4)
print (3 + 2 < 5 + 7)
print ("180/2.2 = ", 180/2.2)
print ("Hey %s there." % "you")

def eyes():
    """Function does blah blah blah"""
    my_eyes = "blue"
    my_hair = 'black'
    print ("He's got %s eyes and %s hair." % (my_eyes, my_hair))
    print ("He's got", my_eyes, "eyes and", my_hair, "hair.")
    print ("He's got %r eyes and %r hair." % (my_eyes, my_hair))
    my_num = 17.58098765
    print ("Rounded value of %f is %f" %(my_num, round(my_num)))
    return

eyes()

print ("-" * 50)

def formatting():
    """Function does blah blah blah"""
    x = "There are %d types of people." % 10
    binary = "binary"
    do_not = "don't"
    y = "Those who know %s and those who %s." % (binary, do_not)
    print (x)
    print (y)
    print ("I said: %r." % x)
    print ("I also said: '%s'." % y)
    hilarious = False
    joke_evaluation = "Isn't that joke so funny?! %r"
    print (joke_evaluation % hilarious)
    w = "This is the left side of..."
    e = "a string with a right side."
    print (w + e)
    print ("-" * 50)

    print ("-" * 50)
    formatter = "%r %r %r %r"
    print (formatter % (1, 2, 3, 4))
    print (formatter % ("one", "two", "three", "four"))
    print (formatter % (True, False, False, True))
    print (formatter % (formatter, formatter, formatter, formatter))
    print (formatter % (
    "I had this thing.",
    "That you could type up right.",
    "But it didn't sing.",
    "So I said g'night."
    ))
    print ("""
    There's something going on here.
    With the three double-quotes.
    We'll be able to type as much as we like.
    Even 4 lines if we want, or 5, or 6.
    """)
    print ("-" * 50)
    return

def func_1():
    """Function does blah blah blah"""
    end1 = "C"
    end2 = "h"
    end3 = "e"
    end4 = "e"
    end5 = "s"
    end6 = "e"
    end7 = "B"
    end8 = "u"
    end9 = "r"
    end10 = "g"
    end11 = "e"
    end12 = "r"
    # watch that comma at the end. try removing it to see what happens
    print (end1 + end2 + end3 + end4 + end5 + end6)
    print (end7 + end8 + end9 + end10 + end11 + end12)
    return

def func_2():
    """Function does blah blah blah"""
    age = int(input("Enter your age:"))
    print ("Entered age is %d" % (age))

    print ("How tall are you?")
    height = input()
    print ("Entered height is %r" % (height))
    return

formatting()
func_1()
func_2()
