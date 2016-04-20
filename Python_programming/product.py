def product(num):
    if len(num) == 0:
        return 0
    result = 1
    for i in num:
        result *= i
    return result
    
print (product([4, 5, 5]))
