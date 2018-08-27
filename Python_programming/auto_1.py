class struct():
	def __init__(self,a,b,c):
		self.a = a
		self.b = b
		self.c = c

class myClass():
	def __init__(self):
		self.num = 5
		self.string = 'hello'
		self.mystruct = struct(10, 'inside', 5.5)

	def display(self):
		print('Members of myClass are', self.num, self.string, self.mystruct.a, self.mystruct.b, self.mystruct.c)

class myDerived(myClass):
	def __init__(self):
		super(myDerived, self).__init__()
		self.derVar = 100;
		self.num = 5;

	def display(self):
		print('Members of myDerived are', self.derVar, self.num)
		super(myDerived,self).display()

myClass().display()
print
myDerived().display()

