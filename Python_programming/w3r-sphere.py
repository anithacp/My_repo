pi = 3.1415926535897931  
r = int(input("Enter the radius: "))
V= 4.0/3.0*pi* r**3  
print('The volume of the sphere is: ',V)

#Write a Python program to test whether a number is within 100 of 1000 or 2000
def near_thousand(n):  
      return ((abs(1000 - n) <= 100) or (abs(2000 - n) <= 100))  
print(near_thousand(1000))  
print(near_thousand(900))  
print(near_thousand(800))     
print(near_thousand(2200))
