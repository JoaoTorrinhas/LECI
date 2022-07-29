//Não vai ser necessário

//function createList() {
	//let list = JSON.parse(localStorage.getItem("PRODUCTS")) || [];
	//localStorage.setItem("PRODUCTS", JSON.stringify(list));
//}

function addFromDB() {
	//ver o caso onde é adicionado um produto só e dps pretende adicionar estes produtos do products.js
	//caso não haja podutos no localStorage, basta adicionar, se houver, temos de ver se já existem produtos
	//na lista com os id's que vamos adicionar
	localStorage.setItem("PRODUCTS", JSON.stringify(products));
}

function setListEmpty() {
	let list = [];
	localStorage.setItem("PRODUCTS", JSON.stringify(list));
}
