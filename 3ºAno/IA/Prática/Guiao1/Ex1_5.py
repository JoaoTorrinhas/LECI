def inverte(lista):
	if lista == []:
		return []
	#res = inverte(lista[1:])
	#res[len(lista):] = [lista[0]]
	#return res
	#Dá das duas maneiras
	aux = lista[-1]
	return [aux] + inverte(lista[:-1])

lista = [1,2,3,4,5]
print(inverte(lista))
print(lista[:-1])
