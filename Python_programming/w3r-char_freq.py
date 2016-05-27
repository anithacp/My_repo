def char_freq(str):
	dict = {}
	for c in str:
		key = dict.keys()
		if c in key:
			dict[c] += 1
		else:
			dict[c] = 1
	return dict

print(char_freq("www.google.com"))
