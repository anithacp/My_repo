""" Basic program """
from __future__ import print_function

def main():
    """ Main program """
    requested_toppings = ['mushrooms', 'onions', 'pineapple']
    req_top = input("Enter your desired topping: ")
    #top1 = "mushrooms"
    #top2 = "brocolli"
    #if [top1 in requested_toppings]:
    #    print("Toppings have %s" % (top1))
    #if [top2 not in requested_toppings]:
    #    print("Sorry, %s not present" % (top2))
    if req_top in requested_toppings:
        print("Toppings have %s" % (req_top))
    else:
        print("Sorry, %s not present" % (req_top))
    player_pts = 0
    user_input = True
    while user_input == True:
        alien_colour = input("Enter the colour: ")
        if alien_colour == "green":
            player_pts += 5
        elif  alien_colour == "yellow":
            player_pts += 10
        elif  alien_colour == "red":
            player_pts += 15
        u_input = input("Do you want to continue (y/n): ")
        if u_input == "y":
            user_input = True
        else:
            user_input = False
    print("You scored %d points" % (player_pts))

main()
