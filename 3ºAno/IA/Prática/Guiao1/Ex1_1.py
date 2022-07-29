from collections import Counter, namedtuple
import copy
ACTIONS = [[], ["a"], ["a", "a"], ["a", "a", "a"], ["d"],
           ["d", "d"], ["d", "d", "d"], ["d", "d", "d", "d"]]

def comprimento(lista):
    if lista == []:
        return 0
    return 1 + comprimento(lista[1:])

#########rascunho########
bottom = [(i, 30) for i in range(10)]  # bottom
lateral = [(0, i) for i in range(30)]  # left
lateral.extend([(10 - 1, i) for i in range(30)])

#grid = bottom + lateral

Dimensions = namedtuple("Dimensions", ["x", "y"])
S = Dimensions(5,5)
#print(S)

# position é a posição atual da peça, exemplo: [[2, 2], [3, 2], [3, 3], [4, 3]]
def last_Position(grid, position):	#FUNCIONA
    #grid = state['game']
    #game.game = grid
    Position = []  # posição final da peça
    lastPos = []
    #ymax = 0
    aux = []  # lista para armazenar os valores da peça com o y incrementado
    aux_y = []  # lista auxiliar para armazenar o y min da peça
    primeiro_quadrado = position[0]  # [2, 2]
    #print(primeiro_quadrado)
    segundo_quadrado = position[1]  # [3, 2]
    #print(segundo_quadrado)
    terceiro_quadrado = position[2]  # [3, 3]
    #print(terceiro_quadrado)
    quarto_quadrado = position[3]  # [4, 3]
    #print(quarto_quadrado)
    for x in range(len(position)):
        elemento = position[x]  # por exemplo [2,2]
        y_element = elemento[1]  # por exemplo 2
        aux_y.append(y_element)  # [2,2,3,3]
    #print(aux_y)
    y = max(aux_y)  # y = 4, ou seja, partimos dessa posição
    #print(y)
    aux1 = primeiro_quadrado[1]
    aux2 = segundo_quadrado[1]
    aux3 = terceiro_quadrado[1]
    aux4 = quarto_quadrado[1]
    #print(aux4)
    for j in range((y+1), 30):
        ##incrementar o y e adicionar a nova posiçao um array auxiliar
        #aux1 = primeiro_quadrado[1]
        aux1 = aux1 + 1
        #print(aux1)
        aux2 = aux2 + 1
        #print(aux2)
        aux3 = aux3 + 1
        #print(aux3)
        aux4 = aux4 + 1
        #print(aux4)
        # [4,7] dps [4,8] e assim sucessivamente. O msm acontece em baixo
        newPrimeiroQuadrado = [primeiro_quadrado[0], aux1]
        #print(newPrimeiroQuadrado)
        newSegundoQuadrado = [segundo_quadrado[0], aux2]
        #print(newSegundoQuadrado)
        newTerceiroQuadrado = [terceiro_quadrado[0], aux3]
        #print(newTerceiroQuadrado)
        newQuartoQuadrado = [quarto_quadrado[0], aux4]
        #print(newQuartoQuadrado)
        #aux.append(newPrimeiroQuadrado)
        #aux.append(newSegundoQuadrado)
        #aux.append(newTerceiroQuadrado)
        #aux.append(newQuartoQuadrado)
        pos = [newPrimeiroQuadrado] + [newSegundoQuadrado] + [newTerceiroQuadrado] + [newQuartoQuadrado]
        aux.append(pos)
        #print(aux) #não está a incrementar o y
    #print(aux)
    #print(grid)
    #print(len(aux))	#25
        #aux tem por exemplo aux = [[4,8],[4,9],[5,9],[4,10]] com o y incrementado um vez
    count = 0
        # percorrer o array com os valores com o y incrementado
    #lastPos = []
    verify_lastPos = False
    for arrayPosition in range(len(aux)):
      p = aux[arrayPosition]  # [[2, 3], [3, 3], [3, 4], [4, 4]]
      #print(p)
      for i in range(len(p)):
         if p[i] not in grid:
            #print(p[i])
            count += 1  # um quadrado da peça não está no grid
      #print(count)
      if count == 4:  # se os 4 quadrados não estiverem na grid, significa que a peça não está no grid
         #print(count)
         Position = p
         #print(Position)
      else:
         Position = lastPos  # caso esteja no grid, a posição final é igual à anterior
         verify_lastPos = True
      lastPos = Position  # [[4,7],[4,8],[5,8],[4,9]]
      count = 0
      if verify_lastPos:
         break
      #print(lastPos)
    #aux.clear()  # limpar o array auxiliar para meter lá os valores da peça com o novo valor de y incrementado

        #while self.valid(self.current_piece):
        #   self.current_piece.y += 1
        #current_piece.y -= 1
        #return current_piece   #retorna a shape e se quiser ver a lista dela faço .positions

    return Position

grid = [[1,29],[2,29],[3,29],[4,29],[3,28],[4,28],[5,28],[6,28],[5,25],[5,26],[6,26],[5,27]]
#for i in range(len(grid)):
	#print(grid)
#peca = [[4, 2], [4, 3], [5, 3], [4, 4]]  # [[4, 2], [4, 3], [5, 3], [4, 4]] T |	[[4, 2], [4, 3], [4, 4], [5, 4]] L

#x = last_Position(grid,peca)
#print(x)

print("------------------")

def moveLeft(piece):	#FUNCIONA
    #peca = []   # lista com o x incrementado
    #por exemplo piece = [[4,6],[4,7],[5,7],[4,8]]
    primeiro_quadrado = piece[0]  # [4,6]
    segundo_quadrado = piece[1]  # [4,7]
    terceiro_quadrado = piece[2]  # [5,7]
    quarto_quadrado = piece[3]  # [4,8]
    new_x1 = primeiro_quadrado[0]-1  # 3
    new_x2 = segundo_quadrado[0]-1  # 3
    new_x3 = terceiro_quadrado[0]-1  # 4
    new_x4 = quarto_quadrado[0]-1  # 3

    for i in range(len(piece)):
        elemento = piece[i]
        if i == 0:
            elemento[0] = new_x1
        elif i == 1:
            elemento[0] = new_x2
        elif i == 2:
            elemento[0] = new_x3
        elif i == 3:
            elemento[0] = new_x4
    return piece

def moveRight(piece):
    #peca = []   # lista com o x incrementado
    #por exemplo piece = [[4,6],[4,7],[5,7],[4,8]]
    primeiro_quadrado = piece[0]  # [4,6]
    segundo_quadrado = piece[1]  # [4,7]
    terceiro_quadrado = piece[2]  # [5,7]
    quarto_quadrado = piece[3]  # [4,8]
    new_x1 = primeiro_quadrado[0]+1  # 5
    new_x2 = segundo_quadrado[0]+1  # 5
    new_x3 = terceiro_quadrado[0]+1  # 6
    new_x4 = quarto_quadrado[0]+1  # 5

    for i in range(len(piece)):
        elemento = piece[i]
        if i == 0:
            elemento[0] = new_x1
        elif i == 1:
            elemento[0] = new_x2
        elif i == 2:
            elemento[0] = new_x3
        elif i == 3:
            elemento[0] = new_x4
    #piece.translate(-1,0)  #andar uma vez para a direita
    return piece
#x = moveLeft(x)
#x = moveLeft(x)
#print(x)


def best_position_with_second_piece(grid):
    #grid é o grid + posição peça atual
    #nextPiece0 ->  next_pieces[0], onde através da função next_actions achamos as jogadas possíveis para cada rotação
    scores = []
    aux = []
    keys = []
    max_scores = []
    positions_actualPiece = [[[3, 3], [4, 3], [3, 4], [4, 4]], [[2, 3], [3, 3], [2, 4], [3, 4]], [[1, 3], [2, 3], [1, 4], [2, 4]], [[4, 3], [5, 3], [
        4, 4], [5, 4]], [[5, 3], [6, 3], [5, 4], [6, 4]], [[6, 3], [7, 3], [6, 4], [7, 4]], [[7, 3], [8, 3], [7, 4], [8, 4]]]  # Quadrado
    actions_actualPiece = [[], ['a'], ['a', 'a'], ['d'], ['d', 'd'], ['d', 'd', 'd'], ['d', 'd', 'd', 'd']]	#quadrado
    #print(positions_actualPiece)
    for position in positions_actualPiece:
        actual_piece_position = position
        #print(actual_piece_position)
        last_position = last_Position(grid, actual_piece_position)
        new_grid = grid + last_position
        #ATÉ AQUI ESTÁ BEM
        positions_nextPiece = [[[2, 2], [3, 2], [4, 2], [5, 2]], [[1, 2], [2, 2], [3, 2], [4, 2]], [[3, 2], [4, 2], [5, 2], [6, 2]], [[4, 2], [5, 2], [6, 2], [7, 2]], [[5, 2], [6, 2], [7, 2], [8, 2]], [[4, 2], [4, 3], [4, 4], [4, 5]], [
            [3, 2], [3, 3], [3, 4], [3, 5]], [[2, 2], [2, 3], [2, 4], [2, 5]], [[1, 2], [1, 3], [1, 4], [1, 5]], [[5, 2], [5, 3], [5, 4], [5, 5]], [[6, 2], [6, 3], [6, 4], [6, 5]], [[7, 2], [7, 3], [7, 4], [7, 5]], [[8, 2], [8, 3], [8, 4], [8, 5]]]	#Rectangulo
        #COMO ESTÁ A FAZER O FOR POSITION QND APLICO A FUNÇAO DO AUX, O AUX RECEBE VALORES A DOBRAR... (TENTAR CORRIGIR)
        #print(positions_nextPiece)
        aux = calculate_score2(positions_nextPiece, new_grid)
        #print(aux)
        scores.append(aux)
        #aux.clear()
    print("scores:", scores)
    for score in scores:
        #print(score)
        maxScore = max(score)
        #print("maxScore:", maxScore)
        max_scores.append(maxScore)
    print("max-scores:", max_scores)
    index_max = max(range(len(max_scores)), key=max_scores.__getitem__)
    print(index_max)
    keys = actions_actualPiece[index_max]
    #print(keys)

    return keys




# retorna a soma de tds as colunas / lastposition é a posição final da peça q vamos juntar ao grid do tabuleiro
def Column_heights(grid_map, lastposition):
    aux = grid_map + lastposition
    heights = []

    matriz = [[0 for i in range(8)] for j in range(30)]
    for x, y in aux:
        matriz[y][x-1] = 1

    for row in range(8):
        tempHeight = []
        for col in range(30):
            #print(col)
            if matriz[col][row] > 0:
               tempHeight.append(30 - col)
        if len(tempHeight) > 0:
            heights.append(max(tempHeight))
        else:
            heights.append(0)

    return heights


def Aggregate_Height(ColumnHeights):  # passar como argumento a função Collumn_Heights
    return sum(ColumnHeights)


def complete_lines(grid, lastPosition):  # voltar a ver melhor esta função
    numero_linhas_completas = 0  # linhas completas
    #print(len(grid))
    numerodelementos = 0
    array = []
    arraytest = []
    aux_grid = grid + lastPosition

    for ola in range(len(aux_grid)):
        elementotest = aux_grid[ola]
        linhaola = elementotest[1]
        arraytest.append(linhaola)

    yminimo = min(arraytest)

    #print(arraytest)
    for x in range(29, yminimo, -1):
        for j in range(len(aux_grid)):
            #aux = grid[position]
            #aux_row = aux[1]            #ver se a linha é
            # vai dar por exemplo [5,28], temos de procurar se existe a coluna na linha e count++
            element = aux_grid[j]
            actual_row = element[1]  # por exemplo actual_row = 28
            if actual_row == x:
                array.append(element)
        numerodelementos = len(array)
        if(numerodelementos == 8):
            numero_linhas_completas = numero_linhas_completas + 1
        array.clear()

    return numero_linhas_completas


def calculate_smotheness(ColumnHeights):  # variation of its column heights
    smoothness = 0
    for i in range(len(ColumnHeights)-1):
        smoothness += abs(ColumnHeights[i] - ColumnHeights[i+1])
    return smoothness


# state é a grid + lastP
def calculate_heuristics_and_Score(grid, lastPosition):
    lines_completed = complete_lines(grid, lastPosition)
    holes_grid = calculate_holes(grid, lastPosition)
    listOfCollumnHeights = Column_heights(
    grid, lastPosition)  # lista com a soma de cada coluna
    AggregateHeight = Aggregate_Height(listOfCollumnHeights)
    Bumpinees = calculate_smotheness(listOfCollumnHeights)


    a = -0.695545
    b = 0.608533
    c = -0.38905
    d = -0.201254

    result = (a*AggregateHeight) + (b*lines_completed) + \
        (c*holes_grid) + (d*Bumpinees)
    return result

def calculate_score2(possible_positions, grid):
    scores = []
    #print(possible_positions)
    for i in range(len(possible_positions)):
        #grid = [ p.copy() for p in original_grid ]
        position = possible_positions[i]
        lastPosition = last_Position(grid, position)
        score = calculate_heuristics_and_Score(grid, lastPosition)
        scores.append(score)

    #index_max = max(range(len(scores)), key=scores.__getitem__)

    return scores

def calculate_holes(grid, lastposition):
   #eventualmente passar o grid como argumento
   #grid = state['game']    #é um array e não um array de duas dimensões
   #game.game = grid
   holes = 0
   aux_array = []  # array auxiliar para adicionar os elementos com a msm row
   #last_row = 0
   aux_grid = grid + lastposition

   for j in range(len(aux_grid)):
        #aux = grid[position]
        #aux_row = aux[1]            #ver se a linha é
        # vai dar por exemplo [5,28], temos de procurar se existe a coluna na linha e count++
      element = aux_grid[j]
      #actual_row = element[1]  # por exemplo actual_row = 28
      aux_array.append(element)
           #print(aux_array)

      if element[1] == 29:
         aux_array.remove(element)

      for index in range(len(aux_array)):  # search for an hole
         actualElement = aux_array[index]  # por exemplo [3,28]
               # print(actualElement)
         col = actualElement[0]  # 3
         row = actualElement[1]  # 28
               # print(actualElement)
         for new_row in range(row+1,30):
            if [col, new_row] not in aux_grid:  # se [3,29] não estiver no grid,há um buraco
               holes += 1
            else:
               break
         aux_array.clear()  # limpar o array auxliar para voltarmos a usa-lo

   return holes

def calculate_holes2(grid, lastposition):  # OTIMIZAR ESTA FUNÇÃO
    aux = grid + lastposition
    holes = 0

    matriz = [[0 for i in range(8)] for j in range(30)]
    for x, y in aux:
        matriz[y][x-1] = 1

    for row in range(30):
        for col in range(8):
            if row < 29 and matriz[row][col] != 0 and matriz[row + 1][col] == 0:
                holes += 1
    return holes

grid1 = [[1,29],[2,29],[3,29],[4,29],[3,28],[4,28],[5,28],[6,28],[5,25],[5,26],[6,26],[5,27]]
keys = best_position_with_second_piece(grid1)
#print(keys)

grelha = [[1,29],[1,27],[2,27],[2,28],[2,29],[3,26],[3,27],[3,28],[3,29],[4,25],[4,26],[4,27],[4,28],[4,29],[5,25],[5,26],[5,27],[5,28],[6,25],[6,26],[6,27],[6,28],[6,29],[7,25],[7,29],[8,27],[8,28],[8,29]]

lastP = [[7,22],[7,23],[7,24],[8,22]]

buracos1 = calculate_holes(grelha,lastP)
#print("buracos1")
#print(buracos1)
[4, 26]
peca_bugada = [[2, 2], [3, 2], [3, 3], [4, 3]]
tabuleiro1 = [[1, 29], [2, 28], [2, 29], [3, 29], [4, 29], [5, 29], [6, 29], [3, 28], [8, 28], [7, 29], [6, 28], [
    7, 28], [5, 28], [1, 28], [6, 27], [4, 26], [5, 26], [5, 27], [1, 26], [1, 27]]

result = last_Position(tabuleiro1, peca_bugada)
#print("result:", result)


###################################

#print(counts)
#print(count)  # Counter({0: 3, 1: 1, 4: 1, 6: 1})

#print(lateral)
##print("bottom:")
#print(bottom)
#print("grid")
#print(grid)
#print(grid[4][6])
#########rascunho########
