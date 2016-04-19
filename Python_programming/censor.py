def censor(text, word):
    result = ''
    censored_word = ''
    count = 0
    for x in range(len(word)):
        censored_word += '*'
    words = text.split()
    for i in words:
        if count != 0:
            result += " "
        if i == word:
            i = censored_word
        result += i
        count += 1
    return result

print (censor("this hack is wack hack", "hack"))
print (censor("hey hey You hey", "hey"))
