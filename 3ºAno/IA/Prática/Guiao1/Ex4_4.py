import math
def main():
	print("Introduza um número (x):")
	x = int(input())
	print("Introduza outro número (y):")
	y = int(input())
	f1 = lambda x,y: (math.sqrt(x**2 + y**2), math.atan2(x, y))
	print(f1(x,y))

if __name__ == "__main__":
	main()
