def main():
	print("Introduza um número (x):")
	x = int(input())
	print("Introduza outro número (y):")
	y = int(input())
	f1 = lambda x,y: abs(x) < abs(y)		#|x| < |y|
	print(f1(x,y))

if __name__ == "__main__":
	main()
