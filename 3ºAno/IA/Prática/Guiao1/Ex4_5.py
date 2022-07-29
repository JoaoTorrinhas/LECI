def f(x,y):
	return x+y

def g(x,y):
	return x-y

def h(x,y):
	return x*y

def F(x,y,z):
	res = lambda x,y,z: h(f(x,y),g(y,z))
	return res(x,y,z)

def main():
	print("Introduza um número (x):")
	x = int(input())
	print("Introduza outro número (y):")
	y = int(input())
	print("Introduza outro número (z):")
	z = int(input())

	print(F(x,y,z))

if __name__ == "__main__":
	main()
