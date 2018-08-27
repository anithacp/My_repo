"""
Write a Python program to remove duplicates from a list.
def remove_duplicate(lst):
	new_lst = []
	for i in lst:
		new_lst.append(i)
		for j in new_lst:
			print (i,j)
			if j == i:
				continue
			new_lst.append(j)
	return new_lst
"""

def remove_duplicate(lst):
	dup_items = set()  
	uniq_items = []  
	for x in lst:  
   		if x not in dup_items:  
        		uniq_items.append(x)  
        		dup_items.add(x)  
	return uniq_items

print(remove_duplicate([1,2,36,9,3,4,7,6,9,3,4]))
		

