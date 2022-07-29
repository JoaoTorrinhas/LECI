def converter(lista,indice):
	if lista == []:
		return []
	res = [lista[0][indice]]
	return res + converter(lista[1:],indice)

# res = [0]
#1 chamada - res + converter([(2,5),(3,2)],indice) [0] + [2] = [0,2]
#2 chamada - res + converter([3,2)],indice) [0,2] + [3] = [0,2,3]
#3 chamada - res + converter([],indice) - [0,2,3] + [] = [0,2,3]

lista = [(0,1),(2,5),(3,2)]	#resultado res = [(0,2,3),(1,5,2)]
res = [converter(lista,0), converter(lista,1)]
print(res)
#print(lista[1][0]) #2
