""" Basic program"""
from __future__ import print_function

def main():
    """ Main program"""
    print("Hello Python world!")
    name = "ada lovelace"
    print(name.title())
    print(name.upper())
    print(name.lower())

    #Python can look for extra whitespace on the right and left sides of a
    #string. To ensure that no whitespace exists at the right end of a
    #string, use the rstrip() method.
    #You can also strip whitespace from the left side of a string using the
    #lstrip() method or strip whitespace from both sides at once using strip()
    favorite_language = '"python "'
    print(favorite_language)
    print(favorite_language.rstrip())

main()
