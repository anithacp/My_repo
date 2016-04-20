def median(num):
    result = sorted(num)
    #print (result)
    val = 0.0
    i = len(result)
    #print (i)
    if i % 2 == 0:
        #print (result[i/2])
        #print (result[i/2 - 1])
        val = (result[i/2] + result[(i/2) - 1])/2.0
    else:
        val = result[abs(i/2)]
    return val

print (median([7,3,1,4]))
print ()
print (median([1,1,2]))
print ()
print (median([7,12,3,1,6]))
