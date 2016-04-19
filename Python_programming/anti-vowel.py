def anti_vowel(text):
    result = ''
    for i in text:
        ch = i.lower()
        if ch == 'a' or ch == 'e' or ch == 'i' or ch == 'o' or ch == 'u':
            continue
        else:
            result += i
    return result
    
print (anti_vowel("Hey You!"))
print (anti_vowel("AEI Super Time"))
