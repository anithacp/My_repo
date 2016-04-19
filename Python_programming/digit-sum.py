def digit_sum(x):
    str_x = str(x)
    total = 0
    for i in str_x:
        if i == "-":
            continue
        total += int(i)
    return total
    
print (digit_sum(1234))
print (digit_sum(-1234))
