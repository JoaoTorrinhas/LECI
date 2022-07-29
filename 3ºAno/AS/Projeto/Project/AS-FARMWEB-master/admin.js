//select elements
const navBarEl = document.querySelector(".collapse navbar-collapse");	//select div class collapse navbar-collapse

//Em último recurso , fazer isto hardcoded e depois fazer a parte de adicionar e remover produtos

//função para dar render consoante o login do cliente ou do fornecedor
function renderHomePageClientProvider() {
	//retirar os valores da checkbox's para
	var fornecedor = document.getElementById("fornecedor");	//dá null e não sei porque
	var cliente = document.getElementById("cliente");	//dá null e não sei porque

	console.log(fornecedor);
	if (fornecedor != null && cliente != null) {
		//se for fornecedor dar render à home page apenas com dois links na home page senão é cliente e tem tds os links
		if (fornecedor.checked == true) {
			navBarEl.innerHTML += `
				<ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
					<li class="nav-item active"><a class="nav-link" href="index.html">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="shop.html">Shop</a></li>

					<li class="nav-item"><a class="nav-link" href="my-account.html">Add Product</a></li>
					<li class="nav-item"><a class="nav-link" href="login.html">Logout</a></li>
				</ul>
			`;
		} else if (cliente.checked == true) {
			navBarEl.innerHTML += `
				<ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
					<li class="nav-item active"><a class="nav-link" href="index.html">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="about.html">About Us</a></li>
					<li class="nav-item"><a class="nav-link" href="shop.html">Shop</a></li>

					<li class="nav-item"><a class="nav-link" href="my-account.html">My Account</a></li>
					<li class="nav-item"><a class="nav-link" href="contact-us.html">Contact Us</a></li>
					<li class="nav-item"><a class="nav-link" href="login.html">Logout</a></li>
				</ul>
			`;
		} else if (fornecedor.checked == true && cliente.checked == true) {
			alert("Please mark only one checkbox!");
		}
	}
}
