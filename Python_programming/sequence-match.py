def count(sequence, item):
    cnt = 0
    for i in sequence:
        if i == item:
            cnt += 1
    return cnt

print (count([1,2,1,1], 1))
print (count([1,2,3,4,5,1,2,3,4,5], [1,2,3]))
