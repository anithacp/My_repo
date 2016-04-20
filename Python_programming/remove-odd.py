def purify(num):
    result = []
    for i in num:
        if i % 2 == 0:
            result.append(i)
    return result
print (purify([1,2,3,4,5,6,7,8,9]) )
