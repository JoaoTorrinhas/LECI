def convert(lista1, lista2):
	if lista1 == []:
		return []
	if lista2 == []:
		return []
	newlist = [(lista1[0],lista2[0])] + convert(lista1[1:],lista2[1:])
	return newlist

lista1 = [1,5,4,8]
lista2 = [2,6,3,9]
#resultado res = [(1,2),(5,6),(4,3),(8,9)]
print(convert(lista1,lista2))
