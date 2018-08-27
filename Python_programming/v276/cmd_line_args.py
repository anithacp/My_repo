""" Blah blah blah """

from sys import argv

def cmd_line_parse():
    """ Blah blah blah """
    script, first, second, third = argv
    print "The script is called: %s" % (script)
    print "Your first variable is:", first
    print "Your second variable is:", second
    print "Your third variable is:", third
    phrase = raw_input("Enter whatever you want: ")
    print "You entered - %r" % (phrase)
    return

cmd_line_parse()

