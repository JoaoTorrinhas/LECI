import "./topbar.css";
import React from "react";
import {useHistory} from "react-router-dom";



export default function Topbar() {
  return (

    <body>
      <header>
      <h1><a href="http://localhost:3000"><button>WebApp</button></a></h1>
        <nav>
          <ul class="nav_links">
            <li><a href="http://localhost:3000/AdoptAnimal">  Adopt Animal</a></li>
            <li><a href="http://localhost:3000/Donate">  Donate</a></li>
            <li><a href="http://localhost:3000/FoundAnimal">  Found Animal</a></li>
          </ul>
        </nav>
        <a class="cta" href="http://localhost:3000/Admin"><button>Admin</button></a>
      </header>

      <div class="redesbaixoHomePage">
        <i className="redesidonHomePage fab fa-facebook"> <a href="https://www.facebook.com/">facebook</a></i>
        <i className="redesidonHomePage fab fa-instagram"> <a href="https://www.instagram.com/">instagram</a></i>
        <i className="redesidonHomePage fab fa-twitter"> <a href="https://twitter.com/">twitter</a></i>
        <i className="redesidonAdoptAnimal"> <a href="">+351 924759488</a></i>
      
      </div>


      <center><h2>Welcome to Our Institution!</h2></center>

    <bodyHomePage>
      <div class="containerHomePage">
					
			<div class="card">
				<div class="imgBx">
					
					<a href="http://localhost:3000/AdoptAnimal"><img src="https://dm6g3jbka53hp.cloudfront.net/static-images/adopt-me-pet-02032021.jpg"
					alt=""/></a>
          <h3><b>Adopt an Animal!</b></h3>
          <p><center>Adopt an Animal!</center>
					</p>
          <p><center>Never forget an adoption has to be responsible!</center>
					</p>
					
				</div>
			</div>
		
			<div class="card">
				<div class="imgBx">
					
					<a href="http://localhost:3000/Donate"><img src="https://static.vecteezy.com/system/resources/previews/001/843/828/non_2x/donate-money-for-charity-design-illustration-isolated-on-white-background-free-vector.jpg"
					alt=""/></a>
          <h3><b>Donation!</b></h3>
					<p><center>Help the animals! Donate to Us! </center>
					</p>
          <p><center>All the money will go entirely to the animals.</center>
					</p>

				</div>	
			</div>	
			
			<div class="card">
				<div class="imgBx2">
					
					<a href="http://localhost:3000/FoundAnimal"><img src="https://thumbs.dreamstime.com/b/boston-terrier-puppy-holding-adopt-me-sign-cute-seven-week-old-standing-cardboard-says-please-rescue-54649223.jpg"
					alt=""/></a>
          <h3><b>Rescue an Animal!</b></h3>
					<p><center>If you find an abandoned animal, rescue it and put it on our website!</center>
					</p>
          
				</div>	
			</div>	
			
		</div>	
    </bodyHomePage>

    </body>
  );
}