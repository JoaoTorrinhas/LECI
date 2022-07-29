class Node:
	def __init__(self,data):
		self.data = data
		self.left = None
		self.right = None

class BSTNode:
	def __init__(self,rootdata):
		self.root = Node(rootdata)

	def search(self,value):
		if value < self.root.data:
			if self.root.left:
				return BSTNode(self.root.left.data).search(value)
			else:
				return False		#não consegue pesquisar mais, acabou a arvore
		elif value > self.root.data:
			if self.root.right:
				return BSTNode(self.root.right.data).search(value)
			else:
				return False  # não consegue pesquisar mais, acabou a arvore
		else:
			return True

def main():
	#criar a arvore
	Tree = BSTNode(24)
	Tree.root.left = Node(11)
	Tree.root.left.left = Node(8)
	Tree.root.left.right = Node(167)
	Tree.root.right = Node(30)
	Tree.root.right.right = Node(40)

	#testar os metodos
	print(Tree.search(11))
	print(Tree.search(6))

if __name__ == "__main__":
	main()
