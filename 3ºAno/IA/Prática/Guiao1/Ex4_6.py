def verify(lista,f):
	if lista == []:
		return False
	#sizeLista = len(lista)
	#for i in range(sizeLista):
	return f(lista[0]) + verify(f,lista[:1])

def main():
	#lista = [2,4,3,6,5]
	print(verify([2, 4, 3, 6, 5], lambda x: 2*x > 2+x))
#terminar de ver
if __name__ == "__main__":
	main()
