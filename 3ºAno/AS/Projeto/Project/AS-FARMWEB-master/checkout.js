//Não está a funcionar não sei pq
const cartProductsEl = document.querySelector(".cart-items"); //select div class rounded p-2 bg-light
let orders2=[];
function renderCartProductsCheckout() {
	let cartProducts = JSON.parse(localStorage.getItem("CART")) || [];
	
	//alert(cartProducts); //cartProducts tem os produtos
	cartProducts.forEach((p) => {

		cartProductsEl.innerHTML += `
			<div class="media mb-2 border-bottom">
				<div class="media-body"> <a href="">${p.name}</a>
					<div class="small text-muted"> Price: ${new Intl.NumberFormat('en-IN', { maximumFractionDigits:3}).format(p.price*p.numberOfUnits)} <span class="mx-2">|</span> Qty: ${p.numberOfUnits} </div>
				</div>
			</div>
		`
	});
}

function makeorder() {
	let orders = JSON.parse(localStorage.getItem("ORDERS"))||[];
	let cartProducts = JSON.parse(localStorage.getItem("CART"));

	orders.forEach((p)=>{
		orders2.push(p);
	});
	orders2.push(cartProducts);
	

	//Limpar o carrinho, uma vez que a order foi feita com sucesso
	const freeCart = [];
	localStorage.setItem("CART", JSON.stringify(freeCart));
	
	localStorage.setItem("ORDERS", JSON.stringify(orders2));
}
renderCartProductsCheckout();
