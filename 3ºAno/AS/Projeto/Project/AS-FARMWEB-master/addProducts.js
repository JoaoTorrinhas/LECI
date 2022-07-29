//função para adicionar produtos ao website
function addProducts() {
	var newIdAux = document.getElementById("addProdId").value;
	var newName = document.getElementById("addName").value;
	var newPriceAux = document.getElementById("addPrice").value;
	var newInstockAux = document.getElementById("addInstock").value;
	var newDescription = document.getElementById("addDescription").value;
	var newImgSrc = document.getElementById("addImgSrc").value;
	//array com os produtos que estão armazenados no local storage
	let productsLS = JSON.parse(localStorage.getItem("PRODUCTS")) || [];

	var newId = parseFloat(newIdAux);
	var newPrice = parseFloat(newPriceAux);
	var newInstock = parseFloat(newInstockAux);

	//criar o produto de acordo com os parametros adicionados
	let newProduct = {
		id: newId,
		name: newName,
		price: newPrice,
		instock: newInstock,
		description: newDescription,
		imgSrc: newImgSrc
	}
	//ver se o id do produto já está no localstorage
	if (productsLS.some((item) => item.id === newId)) {
		alert("ID of a product already exists!!");
	} else {
		//adicionar o produto ao productsLS
		productsLS.push(newProduct);
	}
	//update local storage com o productsLS
	updateShopAfterAdd(productsLS);
	//alert(productsLS);
}

function updateShopAfterAdd(listProducts) {
	//update ao local storage com os produtos que foram adicionados
	localStorage.setItem("PRODUCTS", JSON.stringify(listProducts));
}
