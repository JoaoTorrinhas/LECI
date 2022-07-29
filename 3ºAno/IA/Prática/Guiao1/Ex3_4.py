
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

lista = [5,8,12,1,2]
#resultado- min = 1
#5<10000
#x1 = 5/x2 =
#5+
print(minimo(lista))

