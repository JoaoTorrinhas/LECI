def concatenacao(lista1, lista2):
	conc = lista2[:]
	conc[:0] = lista1
	return conc

lista1 = [1,2,3,4]
lista2 = [5,6,7,8]
print(concatenacao(lista1,lista2))
