def selection_sort(lista):
	if lista == []:
		return []
	sizeLista = len(lista)
	for i in range(sizeLista):
		minValueIndice = i
		for j in range(i+1,sizeLista):
			if lista[i] > lista[j]:
				aux = lista[j]
				lista[j] = lista[i]
				lista[i] = aux
	return lista

def bubble_sort(lista):
	if lista == []:
		return []
	for i in range(len(lista)):
		for j in range(len(lista)-1):
		 if lista[j] > lista[j+1]:
		  lista[j], lista[j+1] = lista[j+1], lista[j]
	return lista

def main():
	lista = [2,4,1,6,5]
	print("Ordenção usando selection sort:")
	print(selection_sort(lista))
	print("Ordenção usando bubble sort:")
	print(bubble_sort(lista))

	#lista2 = [4,3,10,6,4]
	#lista2[1],lista2[2] = lista2[2],lista2[1]
	#print(lista2)


if __name__ == "__main__":
	main()
