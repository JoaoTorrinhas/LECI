import React, { useState } from "react";
import { Link } from 'react-router-dom';
/*import Popup from 'reactjs-popup';*/
/*import 'reactjs-popup/dist/index.css';*/
import "./foundAnimalTwo.css";

export default function FoundAnimalTwo()  {
	const [ animal, setAnimal ] = useState('');
	const [ breed, setBreed ] = useState('');
	const [ stateAnimmal, setAnimalState ] = useState('');
	const [ sexAnimal, setAnimalSex ] = useState('');
	const [ institution, setInstitution ] = useState('');
	const [ moreInformationAnimal, setmoreInfoAnimal ] = useState('');

	const dataAnimal = { Animal: animal, Breed: breed, StateAnimal: stateAnimmal, AnimalSex: sexAnimal, Institution: institution, MoreInfoAnimal: moreInformationAnimal };
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

			<bodydFoundAnimalTwo>
				<div class="containerFoundAnimalTwo">
					<div class="card">
						<div class="imgBx">
							<center><h3><b>Thank you for helping the animals!</b></h3></center>
							<center><h3>Fill in the form below with the animal information!</h3></center>
							<center><h3>And wait for the admin's validation.</h3></center>
						</div>
					</div>

				</div>
			</bodydFoundAnimalTwo>



			<bodySubmited>
				<form>
					<div>
						<h1 id="titulo2"><center>The animal's information</center></h1>
						<p id="subtitulo2"><center>Fill in the blanks</center></p>
						<br />
					</div>
					<fieldsetFA2 class="grupo">
						<div class="campo">
							<label for="animal"><strong>Animal </strong></label>
							<select id="animal" value={ animal } onChange={ (e) => { setAnimal(e.target.value); } }>
								<option selected disabled value="">Select...</option>
								<option>Cat</option>
								<option>Dog</option>
							</select>
						</div>

						<div class="campo">
							<label for="breed"><strong>Breed </strong></label>
							<input type="text" name="breed" id="breed" value={ breed } onChange={ (e) => { setBreed(e.target.value); } } required />
						</div>
					</fieldsetFA2>

					<div class="campo">
						<label for="state"><strong>State of the animal </strong></label>
						<select id="state" value={ stateAnimmal } onChange={ (e) => { setAnimalState(e.target.value); } }>
							<option selected disabled value="">Select...</option>
							<option>Looks healthy</option>
							<option>Injured</option>
							<option>Malnourished</option>
						</select>
					</div>

					<div class="campo">
						<label for="sex"><strong>Sex: </strong></label>
						<select id="sex" value={ sexAnimal } onChange={ (e) => { setAnimalSex(e.target.value); } }>
							<option selected disabled value="">Select...</option>
							<option>Male</option>
							<option>Female</option>
						</select>
					</div>

					<div class="campo">
						<label for="instituicao"><strong>Intends to deliver the animal to the institution? </strong></label>
						<select id="instituicao" value={ institution } onChange={ (e) => { setInstitution(e.target.value); } }>
							<option selected disabled value="">Select...</option>
							<option>Yes</option>
							<option>No</option>
						</select>
					</div>

					<fieldsetFA2 class="grupo">
						<div class="campo">
							<label for="morada"><strong>Photography </strong></label>
							<input type="button" class="textbox" value="Computer Files"></input>
						</div>
					</fieldsetFA2>

					<div class="campo">
						<br />
						<label><strong>More information: </strong></label>
						<textarea rows="4" cols="50" id="informacao2" name="informacao2" value={moreInformationAnimal} onChange={(e)=>{setmoreInfoAnimal(e.target.value);}}></textarea>
					</div>
					<button class="botaofoundanimal" type="button"><Link to="/Submited2" state={dataAnimal}> Next </Link></button>
					{/*<a href="http://localhost:3000/Submited"><button class="botao" type="button">Submit</button></a>*/ }

					{/*<Popup trigger={ <button class="botao" type="submit">Submit</button> } position="right center">
						<div>Submitted successfully</div>
					</Popup*/}

				</form>
			</bodySubmited>
		</body>

	);
}
