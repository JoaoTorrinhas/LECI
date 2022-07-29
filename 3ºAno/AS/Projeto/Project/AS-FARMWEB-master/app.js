/* app.js */

//SELECT ELEMENTS
const productsEl = document.querySelector(".products"); //select div class products
const cartItemsEl = document.querySelector(".cart-items"); //select div class cart-items
const subtotalEl = document.querySelector(".subtotal"); //select div class subtotal
const totalItemsInCartEl = document.querySelector(".total-items-in-cart"); //select div class total-items-in-cart

//Buscar a variável products, que contem os produtos, ao local storage
let products_ls = JSON.parse(localStorage.getItem("PRODUCTS")) || [];


//RENDER PRODUCTS
function renderProducts() {
	products_ls.forEach((product) => {
		productsEl.innerHTML += `
			<div class="item">
					<div class="item-container">
						<div class="item-img">
							<img src="${product.imgSrc}" alt="${product.name}">
						</div>
						<div class="desc">
							<h2>${product.name}</h2>
							<h2><small>$</small>${product.price}</h2>
							<p> ${product.description} </p>
						</div>
						<div class="add-to-wishlist">
							<img src="./icons/heart.png" alt="add to wish list">
						</div>
						<div class="add-to-cart" onclick="addToCart(${product.id})">
							<img src="./icons/bag-plus.png" alt="add to cart">
						</div>
					</div>
			</div>
		`
	});
}
renderProducts();

//cart array to save all the items add to the cart
//let cart = [];
//Para corrigir os problemas de quando eliminamos os itens e continuam no local storage temos de alterar a maneira de cima pelas de baixo
//let cart = localStorage.getItem("CART");
//Desta maneira (acima) dá erro pq como na linha 64 estamos a adicionar ao localstorage o cart to tipo JSON.stringify
//let cart = JSON.parse(localStorage.getItem("CART"));
//Da maneira de cima, se removermos o cart a partir do localStorage dá erro pq diz que o cart é null, então a maneira correta é de baixo
let cart = JSON.parse(localStorage.getItem("CART")) || [];
updateCart();

//ADD TO CART
function addToCart(id) {
	//check if product already exist in cart
	if (cart.some((item) => item.id === id)) {
		//alert("Product already in cart!");
		changeNumberOfUnits("plus", id);
	} else {
		const item = products_ls.find((product) => product.id === id);
		cart.push({
			...item,
			numberOfUnits : 1,
		});
	}
	updateCart();
}

//update cart
function updateCart() {
	renderCartItems();
	renderSubtotal();
	//save cart to local storage
	localStorage.setItem("CART", JSON.stringify(cart));
}

//calculate and render subtotal
function renderSubtotal() {
	let totalPrice = 0,
		totalItems = 0;
	cart.forEach((item) => {
		totalPrice += item.price * item.numberOfUnits;
		totalItems += item.numberOfUnits;
	});
	subtotalEl.innerHTML = `Subtotal (${totalItems} items): $${totalPrice.toFixed(2)}`;
	totalItemsInCartEl.innerHTML = totalItems;
}

//render car items
function renderCartItems() {
	cartItemsEl.innerHTML = ""; //clear cart element
	cart.forEach((item) => {
		cartItemsEl.innerHTML += `
				<div class="cart-item">
						<div class="item-info" onclick="removeItemFromCart(${item.id})">
							<img src="${item.imgSrc}" alt="${item.name}">
							<h4>${item.name}</h4>
						</div>
						<div class="unit-price">
							<small>$</small>${item.price}
						</div>
						<div class="units">
							<div class="btn minus" onclick="changeNumberOfUnits('minus', ${item.id})">-</div>
							<div class="number">${item.numberOfUnits}</div>
							<div class="btn plus" onclick="changeNumberOfUnits('plus', ${item.id})">+</div>
						</div>
				</div>
		`;
	});
}

//remove item from cart
function removeItemFromCart(id) {
	cart = cart.filter((item) => item.id !== id);
	updateCart();
}

function changeNumberOfUnits(action, id) {
	cart = cart.map((item) => {
		let NumberOfUnits = item.numberOfUnits;
		if (item.id === id) {
			if (action == "minus" && NumberOfUnits > 1) {
				NumberOfUnits--;
			} else if (action == "plus" && NumberOfUnits < item.instock) {
				NumberOfUnits++;
			}
		}
		return {
			...item,
			numberOfUnits: NumberOfUnits,
		};
	});
	updateCart();
}
