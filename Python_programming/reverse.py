'''
This is extended slice syntax. It works by doing [begin:end:step] - by leaving begin and end off and specifying a step of -1, it reverses a string.
'''
print ('hello world'[::-1])
print (''.join(reversed('hello world')))

'''
text = 'hello world'
print (text[1:])
'''

def reverse(text):
    if len(text) <= 1:
        return text

    return reverse(text[1:]) + text[0]
    
print (reverse('hello world'))
print (reverse('@5^7%#$%^&'))
