def main():
	print("Introduza um número inteiro:")
	number = int(input())
	res = lambda x: x%2 != 0
	print(res(number))


