def is_prime(x):
    if x <= 1:
        return False;        
    for n in range(2,x-1):
        if x % n == 0:
            return False
    return True
    
print (is_prime(5))
print (is_prime(5111))
print (is_prime(532))   
print (is_prime(0))
print (is_prime(1))
print (is_prime(-10))
print (is_prime(-11))
