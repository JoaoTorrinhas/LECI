import React from "react";
import { useLocation, Link } from 'react-router-dom';
import "./submited2.css";

export default function Submited2() {
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

			<bodySubmited2>
				<div class="containerSubmited2">
					<div class="card">
						<div class="imgBx">
							<center><h3>Are you sure you want to submit this information?</h3></center>
							<center><h3>If you want press done otherwise press previous </h3></center>
						</div>
					</div>
				</div>
			</bodySubmited2>

			<bodySubmited2>
				<form>
					<fieldsetSubmited class="grupoSubmitedAnimal">
						<div class="campoSubmitedAnimal">
							<label ><strong>Animal: </strong></label> {state.Animal}

						</div>

						<div class="campoSubmitedAnimal">
							<label ><strong>Breed: </strong></label> { state.Breed }
						</div>

						<div class="campoSubmitedAnimal">
							<label ><strong>State of the animal: </strong></label> { state.StateAnimal }
						</div>

						<div class="campoSubmitedAnimal">
							<label ><strong>Sex: </strong></label> { state.AnimalSex }
						</div>

						<div class="campoSubmitedAnimal">
							<label ><strong>Intends to deliver the animal to the institution?: </strong></label> { state.Institution }
						</div>

						<div class="campoSubmitedAnimal">
							<label ><strong>More information: </strong></label> { state.MoreInfoAnimal }
						</div>
					</fieldsetSubmited>

					<a href="http://localhost:3000/FoundAnimaltwo"><button class="botaoSubmited" type="button">Previous</button></a>
					<a href="http://localhost:3000"><button class="botaoSubmited" type="button">Done</button></a>

				</form>
			</bodySubmited2>

		</body>

	);


}
