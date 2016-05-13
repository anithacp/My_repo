#Get a new string from a given string where "Is" has been added to the front. If the given string already begins with "Is" then return the unchanged string
def new_string(str):  
  if len(str) >= 2 and str[:2] == "Is":  
    return str  
  return "Is" + str  
  
print(new_string("Array"))  
print(new_string("IsEmpty"))
print(new_string("Is"))
print(new_string("I"))
print(new_string("Issssssssss"))
print(new_string("issssssssss"))


#Concatenating with multiple copies of same string
def larger_string(str, n):  
   result = ""  
   for i in range(n):  
      result = result + str  
   return result  
      
print(larger_string('abc', 6))  
print(larger_string('.py', 10))  

#Write a Python program to get the n (non-negative integer) copies of the first 2 characters of a given sting. Return the n copies of the whole string if the length is less than 2. 
def substring_copy(str, n):  
  flen = 2  
  if flen > len(str):  
    flen = len(str)  
  substr = str[:flen]  
    
  result = ""  
  for i in range(n):  
    result = result + substr  
  return result  

def partstring_copy(str):
    len1 = 2
    len2 = 5
    if len1 > len(str) or len2 > len(str):
        len1 = 0
        len2 = len(str)
    substr = str[len1:len2]
    return substr

print(substring_copy('abcdef', 4))  
print(substring_copy('p', 10)); 
print(partstring_copy('abcdef'))
print(partstring_copy('abc'))
