def cauda(lista):
	if lista == []:
		return None
	return lista[1:]

lista = [1,2,3,4,5]
print(cauda(lista))
