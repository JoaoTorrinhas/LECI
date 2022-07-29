from urllib import response
from flask import Flask, request, jsonify
import csv
import json

app = Flask(__name__)

@app.route('/', methods=['GET'])
def get_plants():
	if "id" in request.args:
		id = int(request.args.get("id"))
		result = get_plant(id)
		plants = jsonify(result)
		return plants
	if "X" and "Y" in request.args:	#não está a funcionar bem
		X = float(request.args.get("X"))
		Y = float(request.args.get("Y"))
		result = get_plantXY(X,Y)
		plants = jsonify(result)
		return plants
	#response = json.dumps(result, indent=4)
	return ""

def get_plant(id):
	with open('C:\\Users\\jptor\\OneDrive\\Ambiente de Trabalho\\UA-3ºAno\\PECI\\API\\Lista_Arvores_UA.csv', 'r', newline='') as file_obj:
		csv_reader = csv.DictReader(file_obj, delimiter=';', fieldnames=['Especie', 'Nome', 'Status', 'X', 'Y'])
		number_row = 1
		for row in csv_reader:
			if id == number_row:
				result = row
				return result
			number_row = number_row + 1
	return {'error':'Id not found'}

def get_plantXY(X,Y):
	with open('C:\\Users\\jptor\\OneDrive\\Ambiente de Trabalho\\UA-3ºAno\\PECI\\API\\Lista_Arvores_UA.csv', 'r', newline='') as file_obj:
		csv_reader = csv.DictReader(file_obj, delimiter=';', fieldnames=['Especie', 'Nome', 'Status', 'X', 'Y'])
		for row in csv_reader:
			if X == row['X'] and Y == row['Y']:
				result = row
				return result
	return {'error':'Id not found'}

if __name__ == '__main__':
	app.run(debug = True)
