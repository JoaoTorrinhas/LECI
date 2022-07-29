def capicua(lista):
	if lista == []:
		return True
	return lista[0] == lista[len(lista)-1] and capicua(lista[1:len(lista)-1])


lista1 = [1,2,3,4,3,2,1]
lista2 = [1,2,3,4]
#lista2 =[4,3,2,1] se ler da esq-dir
print(capicua(lista1))
