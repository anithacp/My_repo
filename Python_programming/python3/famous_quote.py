""" 2.5 """
#Find a quote from a famous person you admire. Print the
#quote and the name of its author. Your output should look something
#like the following, including the quotation marks:
#Albert Einstein once said, "A person who never made a
#mistake never tried anything new."

from __future__ import print_function

def main():
    """ Main program"""
    names = ["Albert Einstein", "Tim Peters"]
    quotes = ["A person who never made a mistake never tried \
    anything new.", "Simple is better than complex"]

    #zip stops when the shorter of the lists stops.
    for i, j in zip(names, quotes):
        print("%s once said, '%s'" % (i, j))

main()
