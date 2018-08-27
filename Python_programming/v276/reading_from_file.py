""" Blah blah blah """
from sys import argv

def read_file():
    """ Blah Blah Blah """
    script, filename = argv
    txt = open(filename)
    print "Here's your file %r:" % filename
    print txt.read()
    txt.close()
    print "Type the filename again:"
    file_again = raw_input("> ")
    txt_again = open(file_again)
    print txt_again.read()
    txt_again.close()
    return

read_file()

