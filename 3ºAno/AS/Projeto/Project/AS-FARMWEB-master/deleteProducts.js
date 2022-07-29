//receber a lista dos produtos guardados no local storage

function delProducts() {
	let listProducts = JSON.parse(localStorage.getItem("PRODUCTS")) || [];
	var IdToRemoveAux = document.getElementById("removeId").value;
	var IdToRemove = parseFloat(IdToRemoveAux);

	if (listProducts != []) {
		if (listProducts.some((item) => item.id === IdToRemove)) {
			//alert("Id of the product EXIST!!");
			//eliminar o produto com este id
			listProducts = listProducts.filter((item) => item.id !== IdToRemove); //guardar todos os itens que têm o id diferente do id a remover
			updateShopAfterDelete(listProducts);
		} else {
			alert("Id of the product DONT EXIST!!");
		}
	}
	//alert(IdToRemoveAux);

}

function updateShopAfterDelete(productsList) {
	localStorage.setItem("PRODUCTS", JSON.stringify(productsList));
}
