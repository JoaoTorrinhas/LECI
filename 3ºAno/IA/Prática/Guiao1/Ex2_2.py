def remove(lista,numero):
	if lista == []:
		return []
	#if lista[0] == numero:
		#lista.pop(numero)
	#	lista[0] = []
	#	return remove(lista[1:], numero)
	#return [lista[0]] + remove(lista[1:],numero)
	#Dá das duas maneiras
	sizeLista = len(lista)
	newLista = []
	for i in range(sizeLista):
		if lista[i] != numero:
			newLista += [lista[i]]
	return newLista

def contar(lista,numero):
	sizeLista = len(lista)
	nova_lista = remove(lista,numero)
	newSize = len(nova_lista)
	return sizeLista-newSize

lista = [1,6,2,5,5,2,5,2]
print(remove(lista,2),contar(lista,2))
#print('(' + remove(lista,2), + ', ' + contar(lista,2) + ')')
