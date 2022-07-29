import React, { useState } from "react";
import { Link } from 'react-router-dom';
import "./foundAnimal.css";

export default function FoundAnimal() {
	const [ name, setname ] = useState('');
	const [ lastName, setlastName ] = useState('');
	const [ email, setEmail ] = useState('');
	const [ phoneNumber, setphoneNumber ] = useState('');
	const [ sex, setsex ] = useState('');
	const [ address, setaddress ] = useState('');
	const [ moreInformation, setmoreInformation ] = useState('');

	const dataUser = {Name: name, Last_Name: lastName, Email: email, Phone_Number: phoneNumber, Sex: sex, Address: address, More_Information: moreInformation};

	return (
		<body>
			{/* Link para fazer o path para a página submited (página a confirmar que o formulário foi submetido com sucesso e onde vai mostrar as informações introduzidas pelo utilizador) onde vai receber os dados introduzidos nesta página*/}
			{/* <link to={ { pathname: './Submited/Submited', data: dataUser } } />*/ }
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

			<bodydFoundAnimal>
				<div class="containerFoundAnimal">
					<div class="card">
						<div class="imgBx">
							<center><h3><b>Thank you for helping the animals!</b></h3></center>
							<center><h3>Fill in the form below with your information!</h3></center>
							<center><h3>And wait for the admin's validation.</h3></center>
						</div>
					</div>

				</div>
			</bodydFoundAnimal>



			<bodySubmited>
				<form>
					<div>
						<h1 id="titulo"><center>Your Personal information</center></h1>
						<p id="subtitulo"><center>Fill in the blanks</center></p>
						<br />
					</div>
					<fieldsetFA class="grupo">
						<div class="campo">
							<label for="nome"><strong>Name </strong></label>
							<input type="text" name="nome" id="nome" value={ name } onChange={(e) => {setname(e.target.value);}} required/>
						</div>

						<div class="campo">
							<label for="sobrenome"><strong>Last Name </strong></label>
							<input type="text" name="sobrenome" id="sobrenome" value={ lastName } onChange={(e) => {setlastName(e.target.value);}} required/>
						</div>
					</fieldsetFA>

					<div class="campo">
						<label for="email"><strong>Email </strong></label>
						<input type="email" name="email" id="email" value={ email } onChange={(e) => {setEmail(e.target.value);}} required/>
					</div>

					<div class="campo">
						<label for="numero"><strong>Phone number </strong></label>
						<input type="text" name="numero" id="numero" value={ phoneNumber } onChange={(e) => {setphoneNumber(e.target.value);}} required />
					</div>

					<div class="campo">
						<label for="sex"><strong>Sex: </strong></label>
						<select id="sex" value={ sex } onChange={(e) => {setsex(e.target.value);}}>
							<option selected disabled value="">Select...</option>
							<option>Male</option>
							<option>Female</option>
						</select>
					</div>

					<fieldsetFA class="grupo">
						<div class="campo">
							<label for="morada"><strong>Address </strong></label>
							<input type="text" name="morada" id="morada" value={ address } onChange={(e) => {setaddress(e.target.value);}} required />
						</div>
					</fieldsetFA>

					<div class="campo">
						<br />
						<label><strong>More information: </strong></label>
						<textarea rows="4" cols="50" id="informacao" name="informacao" value={ moreInformation } onChange={(e) => {setmoreInformation(e.target.value);}}></textarea>
						
					</div>
					
					<button class="botaofoundanimal" type="button"><Link to="/Submited" state={ dataUser }> Next </Link></button>
					
				</form>
			</bodySubmited>
		</body>

	);
}
