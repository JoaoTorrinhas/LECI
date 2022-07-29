def ocorrencias(lista,n):
	if lista == []:
		return 0
	if lista[0] == n:
		return 1 + ocorrencias(lista[1:],n)
	return ocorrencias(lista[1:],n)

#fazer com ciclos for em vez de ser recursivamente

lista = [2,2,3,5,6,6,6]
for i in lista:
	print((i,ocorrencias(lista,i)))
#ocorrencias lista newList[(2,2),(3,1),(5,1),(6,3)]
