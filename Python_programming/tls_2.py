# Print log tables
import math
import tls_utils

def log_table(base = None):
	x = 1.0
	if base == None:
		print("Val", "\t", "Log(Val) base e")
	else:
		print("Val", "\t", "Log(Val) base", base)
	print("===", "\t", "================")
	while x <= 10.0:
		if base == None:
			print(x,"\t",math.log(x))
		else:
			print(x,"\t",math.log(x)/math.log(base))
		x = x + 1.0
log_table(10)
log_table(2)
log_table()
tls_utils.newline()
