import React from "react";
import { useLocation, Link } from 'react-router-dom';
import "./submited.css";

{/*página a confirmar que o formulário foi submetido com sucesso e onde vai mostrar as informações introduzidas pelo utilizador na página foundAnimal*/ }
{/* Existem duas páginas foundAnimal (foundAnimal e foundAnimaltwo) pq uma é para as informações do utilizador e outra é para as informações do animal encontrado */ }

{/* Daí eu querer que esta página recebesse dados dessas duas páginas */ }

{/*Nesta página ainda só está a mostrar, numa espécie de container, os dados introduzidos pelo utilizador (name, lastname, email, phone number, sex e address)*/}


{/* export default function Submited()  */}
export default function Submited(){

	const location = useLocation();
	const state = location.state;
	console.log(state);


	return (
		<body>
			<header>
				<h1><a href="http://localhost:3000"><button>WebApp</button></a></h1>
				<nav>
					<ul class="nav_links">
						<li><a href="http://localhost:3000/AdoptAnimal">  Adopt Animal</a></li>
						<li><a href="http://localhost:3000/Donate">  Donate</a></li>
						<li><a href="http://localhost:3000/FoundAnimal">  <hcorvermelha>Found Animal</hcorvermelha></a></li>
					</ul>
				</nav>
				<a class="cta" href="http://localhost:3000/Admin"><button>Admin</button></a>
			</header>

			<bodySubmited>
				<div class="containerSubmited">
					<div class="card">
						<div class="imgBx">
							<center><h3>Are you sure you want to submit this information?</h3></center>
							<center><h3>If you want press next otherwise press previous </h3></center>
						</div>
					</div>
				</div>
			</bodySubmited>

			<bodySubmited>
				<form>
					<fieldsetSubmited class="grupoSubmitedUser">
						<div class="campoSubmitedUser">
							<label ><strong>Name: </strong></label> {state.Name}

						</div>

						<div class="campoSubmitedUser">
							<label ><strong>Last Name: </strong></label> { state.Last_Name }
						</div>

						<div class="campoSubmitedUser">
							<label ><strong>Email: </strong></label> { state.Email }
						</div>

						<div class="campoSubmitedUser">
							<label ><strong>Phone Number: </strong></label> { state.Phone_Number }
						</div>

						<div class="campoSubmitedUser">
							<label ><strong>Sex: </strong></label> { state.Sex }
						</div>

						<div class="campoSubmitedUser">
							<label ><strong>Address: </strong></label> { state.Address }
						</div>

						<div class="campoSubmitedUser">
							<label ><strong>More Information: </strong></label> { state.More_Information }
						</div>
					</fieldsetSubmited>

					<a href="http://localhost:3000/FoundAnimal"><button class="botaoSubmited" type="button">Previous</button></a>
					<a href="http://localhost:3000/FoundAnimalTwo"><button class="botaoSubmited" type="button">Next</button></a>

				</form>
			</bodySubmited>

		</body>

		);


}
