def is_int(x):
    if (x-int(x)) != 0:
        return False
    else:
        return True
        
print (is_int(7.5))
print (is_int(7.0))
print (is_int(-1))
print (is_int(-1.5))
