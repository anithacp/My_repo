def remove_duplicates(num):
    result = []
    '''
    occurence = occurence.fromkeys(num,0)
    for i in num:
        occurance[i] += 1
    '''
    for i in num:
        if i not in result:
            result.append(i)
    return result
    
print (remove_duplicates([1,1,2,2]))
print (remove_duplicates([1,1,2,2,5,6,2,9,6,5,4,3,2]))
