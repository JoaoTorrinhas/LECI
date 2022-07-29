def verify(x,lista):
	if lista == []:
		return False
	return (lista[0] == x) or verify(x,lista[1:])
