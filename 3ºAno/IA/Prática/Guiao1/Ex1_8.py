def substituir(lista, x, y):
	if lista == []:
		return []
	rec = substituir(lista[1:], x, y)
	if lista[0] == x:
		return [y] + rec
	return [lista[0]] + rec


lista = [1, 2, 3, 4, 7, 8, 2, 4, 2]
# se x = 2 e y = 0
#lista = [1,0,3,4,7,8,0,4,0]
print(substituir(lista, 2, 0))
print(lista[1:])
