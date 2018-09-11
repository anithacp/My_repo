""" Basic program """
from __future__ import print_function

def main():
    """ Main program """
    # A dictionary in Python is a collection of key-value pairs.
    # Every key is connected to its value by a colon, and individual
    # key-value pairs are separated by commas.
    alien_0 = {'color': 'green', 'points': 5}
    print(alien_0["color"])
    print(alien_0)
    alien_0["x_position"] = 5
    alien_0["y_position"] = 11
    alien_0["z_position"] = 20
    # Notice that the order of the key-value pairs does not match the
    # order in which we added them. Python doesn't care about the order
    # in which you store each key-value pair; it cares only about the
    # connection between each key and its value. It changes each time
    # we execute
    print(alien_0)
    del alien_0["points"]
    print(alien_0)

    # It is good practice to include a comma after the last key-value
    # pair as well, so you're ready to add a new key-value pair on the
    # next line.
    favorite_languages = {
        'jen': 'python',
        'sarah': 'c',
        'edward': 'ruby',
        'phil': 'python',
        }
    print("Sarah's favorite language is " +
        favorite_languages['sarah'].title() + ".")

main()
