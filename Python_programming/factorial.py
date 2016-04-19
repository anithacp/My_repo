def factorial(x):
    if x-int(x) != 0:
        print ("Enter an interger")
        return
    if x == 0:
        return 0
    if x < 0:
        print ("Enter a positive number")
        return
    answer = 1
    while x > 0:
        answer *= x
        x -= 1
    return answer
    
print (factorial(4))
print (factorial(5))
print (factorial(-5))
print (factorial(0))
print (factorial(1.5))
