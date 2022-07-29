import React from "react";
import "./admin.css";

export default function Admin() {

	return (
		<body>

		<header>
      <h1><a href="http://localhost:3000"><button>WebApp</button></a></h1>
        <nav>
          <ul class="nav_links">
          </ul>
        </nav>
      </header>

		<bodyadmin>
			<div class="containeradmin">
				<form action='http://localhost:3000/Validate'>
						<h1><center>Login</center></h1>
					<div class='form-group'>
						<label for="">Email</label>
						<input type="text" class="form-control" required/>
					</div>
					<div class='form-group'>
						<label for="">Password</label>
						<input type="password" class="form-control" required />
					</div>
						<button class="btnadmin" href="">Login</button>
				</form>
			</div>
		</bodyadmin>
		</body>
	);
}
