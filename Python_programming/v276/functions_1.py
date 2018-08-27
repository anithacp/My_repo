""" Blah blah blah """
from sys import argv

def print_all(file_name):
    """ Blah blah blah """
    print file_name.read()

def rewind(file_name):
    """ Blah blah blah """
    file_name.seek(0)

def print_a_line(line_count, file_name):
    """ Blah blah blah """
    print line_count, file_name.readline(),

def main_pgm():
    """ Blah blah blah """
    script, input_file = argv
    print "Executing script %s" % (script)
    current_file = open(input_file)

    print "First let's print the whole file:\n"
    print_all(current_file)

    print "Now let's rewind, kind of like a tape."
    rewind(current_file)

    print "Let's print three lines:"
    current_line = 1
    print_a_line(current_line, current_file)

    current_line += 1
    print_a_line(current_line, current_file)

    current_line += 1
    print_a_line(current_line, current_file)

main_pgm()
