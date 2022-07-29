def selection_sort(lista,f):
	if lista == []:
		return []
	sizeLista = len(lista)
	for i in range(sizeLista):
		minValueIndice = i
		for j in range(i+1, sizeLista):
			if f(lista[i],lista[j]):
				aux = lista[j]
				lista[j] = lista[i]
				lista[i] = aux
	return lista

def main():
	#lista = [2, 4, 1, 6, 5]
	print(selection_sort([2, 9, 1, 4, 7], lambda x, y: x > y))

if __name__ == "__main__":
	main()
