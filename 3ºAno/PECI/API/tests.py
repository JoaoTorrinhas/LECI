import csv
import json
from operator import delitem

id = 3
result=None
with open('C:\\Users\\jptor\\OneDrive\\Ambiente de Trabalho\\UA-3ºAno\\PECI\\API\\Lista_Arvores_UA.csv', 'r', newline='') as file_obj:
	csv_reader = csv.DictReader(file_obj, delimiter=';', fieldnames=['Especie', 'Nome', 'Status', 'X', 'Y'])
	number_row = 1
	for row in csv_reader:
		#print(row)
		#print("X-",row['X'])
		#print(number_row)
		if id == number_row:
			result = row
			break
		number_row = number_row + 1
#print("result:", result)
boas =json.dumps(result, indent=4)
print("\n", boas)
