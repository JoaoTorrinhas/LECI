class soma:
	def __init__(self,x,y):
		self.var1 = x
		self.var2 = y

	def __str__(self) -> str:
		return str(self.var1) + "+" + str(self.var2)


	def somar(self):
		result = self.var1 + self.var2
		return result

class produto:
	def __init__(self, x, y):
		self.var1 = x
		self.var2 = y

	def __str__(self) -> str:
		return str(self.var1) + "*" + str(self.var2)

	def somar(self):
		result = self.var1 * self.var2
		return result

class constante:
	def __init__(self, x):
		self.var1 = x

	def __str__(self) -> str:
		return str(self.var1)


class variable:
	def __init__(self, x):
		self.var1 = x

	def __str__(self) -> str:
		return self.var1

def main():
	var1 = constante(73)
	var2 = variable('x')
	var3 = soma(3,4)
	var4 = produto(2,'x')
	var5 = produto(var3,7)
	var6 = soma(var4,1)
	var7 = soma(2,'x')
	var8 = soma('x',1)
	var9 = produto(var7,var8)

	print(var1.__str__())
	print(var2.__str__())
	print(var5.__str__())
	print(var6.__str__())
	print(var9.__str__())

	#print(var1.__str__())
	#print(var3.somar())		#está a funcionar

if __name__ == "__main__":
	main()
