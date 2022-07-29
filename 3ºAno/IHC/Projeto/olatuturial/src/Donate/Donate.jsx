import "./donate.css";
import React from "react";

export default function Donate() {

    return(
        <body>
        <header>
        <h1><a href="http://localhost:3000"><button>WebApp</button></a></h1>
          <nav>
            <ul class="nav_links">
              <li><a href="http://localhost:3000/AdoptAnimal">  Adopt Animal</a></li>
              <li><a href="http://localhost:3000/Donate">  <hcorvermelha>Donate</hcorvermelha></a></li>
              <li><a href="http://localhost:3000/FoundAnimal">  Found Animal</a></li>
            </ul>
          </nav>
          <a class="cta" href="http://localhost:3000/Admin"><button>Admin</button></a>
        </header>

        <div class="redesbaixoDonate">
        <i className="redesidonDonate fab fa-facebook"> <a href="https://www.facebook.com/">facebook</a></i>
        <i className="redesidonDonate fab fa-instagram"> <a href="https://www.instagram.com/">instagram</a></i>
        <i className="redesidonDonate fab fa-twitter"> <a href="https://twitter.com/">twitter</a></i>
        <i className="redesidonDonate"> <a href="">+351 924759488</a></i>
      
      </div>

        <bodydDonate>
        <div class="containerDonate">

            <div class="card">
                <div class="imgBx">
                    <center><h3><b>Welcome to the Donation Page!</b></h3></center>
                    <center><h3>Help The Animals!</h3></center>
                    <center><h3>All the money will be used only for Animal Care!</h3></center>
                    <center><h3>You can donate by the methods shown below!</h3></center>
                </div>
            </div>


        </div>
        </bodydDonate>

        <bodydDonate>
        <div class="containerDonate2">

            <div class="card">
                <div class="imgBx">
                <img src="https://static.vecteezy.com/ti/vetor-gratis/t2/4974857-donation-for-pets-flat-design-long-shadow-glyph-icon-animals-bem-estar-coracao-com-gato-e-cachorro-focinho-dentro-de-silhueta-ilustracao-vetor.jpg" class="cao"
                    alt=""/>
                </div>
                <div class="txtBx">
                <h3><b>MBWAY:</b> 924759488</h3>
                <h3><b>IBAN:</b> PT50 0010 0000 5209 0190 0019 1</h3>
                </div>
                
            </div>


        </div>
        </bodydDonate>



        </body>

    );
}