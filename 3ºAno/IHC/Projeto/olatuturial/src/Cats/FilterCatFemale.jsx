import "./cats.css";
import React from "react";


export default function FilterCatFemale() {
  return (

    

    <body>
      <header>
      <h1><a href="http://localhost:3000"><button>WebApp</button></a></h1>
        <nav>
          <ul class="nav_links">
            <li><a href="http://localhost:3000/AdoptAnimal">  <hcorvermelha>Adopt Animal</hcorvermelha></a></li>
            <li><a href="http://localhost:3000/Donate">  Donate</a></li>
            <li><a href="http://localhost:3000/FoundAnimal">  Found Animal</a></li>
          </ul>
        </nav>
        <a class="cta" href="http://localhost:3000/Admin"><button>Admin</button></a>
      </header>

    

      <bodydDogs>
        <div class="containerDonate">

            <div class="card">
                <div class="imgBx">
                    <center><h3><b>If you are interested in finding an animal to adopt,  </b></h3></center>
                    <center><h3><b>you are in the right place.</b></h3></center>
                    <center><h3><b>Never forget an adoption has to be responsible!</b></h3></center>
                    <center><h3><b>If you are going to abandon him or treat him badly, don't adopt!</b></h3></center>
                </div>
            </div>


        </div>
        </bodydDogs>
        <bodydDogs>
        <div class= "containerdif">
          <a href="http://localhost:3000/AdoptAnimal/CATS"><button class="btn-2">All</button></a>
          <a href="/AdoptAnimal/CATS/male"><button class="btn-2">Male</button></a>
          <a href="/AdoptAnimal/CATS/female"><button class="btn-2">Female</button></a>
          <a href="/AdoptAnimal/CATS/shortCoat"><button class="btn-2">Short Coat</button></a>
          <a href="/AdoptAnimal/CATS/mediumCoat"><button class="btn-2">Medium Coat</button></a>
          <a href="/AdoptAnimal/CATS/longCoat"><button class="btn-2">Long Coat</button></a>
          <a href="/AdoptAnimal/CATS/until3years"><button class="btn-2">Until 3 years</button></a>
        </div>
        </bodydDogs>

        <section class="containerAnimalBox">
          <div class="cardAnimalBox">
            <div class="cardAnimalBox-image cardcat-1"></div>
              <h2>Garfield</h2>
              <p><b>Name:</b> Garfield</p>
              <p><b>Sex:</b> Male</p>
              <p><b>Age:</b> 4 Weeks</p>
              <p><b>Coat Type:</b> Medium</p>
            <a href="http://localhost:3000/AdoptAnimal/CATS/Cat1"><h3>More Informations</h3></a>
          </div>
          <div class="cardAnimalBox">
            <div class="cardAnimalBox-image cardcat-2"></div>
              <h2>Kitty</h2>
              <p><b>Name:</b> Kitty</p>
              <p><b>Sex:</b> Female</p>
              <p><b>Age:</b> 2 Years</p>
              <p><b>Coat Type:</b> Medium</p>
              <a href="http://localhost:3000/AdoptAnimal/CATS/Cat2"><h3>More Informations</h3></a>
          </div>
          <div class="cardAnimalBox">
            <div class="cardAnimalBox-image cardcat-4"></div>
              <h2>Amora</h2>
              <p><b>Name:</b> Amora</p>
              <p><b>Sex:</b> Female</p>
              <p><b>Age:</b> 2 Years</p>
              <p><b>Coat Type:</b> Short</p>
              <a href="http://localhost:3000/AdoptAnimal/CATS/Cat4"><h3>More Informations</h3></a>
          </div>
          <div class="cardAnimalBox">
            <div class="cardAnimalBox-image cardcat-5"></div>
              <h2>Baunilha</h2>
              <p><b>Name:</b> Baunilha</p>
              <p><b>Sex:</b> Female</p>
              <p><b>Age:</b> 7 Years</p>
              <p><b>Size:</b> Medium</p>
              <a href="http://localhost:3000/AdoptAnimal/CATS/Cat5"><h3>More Informations</h3></a>
          </div>
        </section>
    </body>
  );
}