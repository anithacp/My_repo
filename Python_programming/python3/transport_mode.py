""" 3.3 program"""
from __future__ import print_function
from random import randint

def main():
    """ Main program"""
    transport_modes = ["bus", "train", "cycle", "tram", "skateboard",
    "skates", "my legs", "car", "van"]
    mode = randint(0, (len(transport_modes) - 1))
    print("Today I plan to use %s to go to work" % (transport_modes[mode]))

main()
