def concatenar(lista):
	if lista == []:
		return 0
	res = concatenar(lista[:len(lista)-1])
	res = [res] + lista[len(lista)-1]
	return res

lista = [[1,2],[3,4]]
lista2 = [[1, 2],[3, 4],[5,6]]
print(concatenar(lista2))
print(lista2[:len(lista2)-1])
print(len(lista)-1)
