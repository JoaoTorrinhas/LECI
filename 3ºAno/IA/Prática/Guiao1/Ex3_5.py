def minimo(lista):
	if lista == []:
		return 0
	menorValor = 10000
	sizeLista = len(lista)
	for i in range(sizeLista):
		if lista[i] < menorValor:
			menorValor = lista[i]
	return menorValor
	#ou fazer só esta linha
	#return min(lista)

def newLista(lista,minimo):
	if lista == []:
		return []
	if lista[0] == minimo:
		return newLista(lista[1:],minimo)
	return [lista[0]] + newLista(lista[1:],minimo)

lista = [5,8,12,1,2]
print((newLista(lista,minimo(lista)), minimo(lista)))
