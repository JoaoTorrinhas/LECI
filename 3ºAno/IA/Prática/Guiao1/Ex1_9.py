def Uniao(lista1,lista2):
	if lista1 == []:
		return []
	if lista2 == []:
		return []
	#res = []
	#res = sorted(list(set(lista1)) + list(set(lista2)))
	res = sorted(lista1 + lista2)
	return res

lista1 = [1,2,3,4,5]
lista2 = [4,5,9,10,11]

#t = 'python'
#print(list(t))
print(Uniao(lista1,lista2))
#print(list(set(lista1)))
print(lista1[:0])
