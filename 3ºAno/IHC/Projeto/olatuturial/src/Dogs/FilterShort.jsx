import "./dogs.css";
import React from "react";


export default function FilterShort() {
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
          <a href="http://localhost:3000/AdoptAnimal/DOGS"><button class="btn-2">All</button></a>
          <a href="/AdoptAnimal/DOGS/male"><button class="btn-2">Male</button></a>
          <a href="/AdoptAnimal/DOGS/female"><button class="btn-2">Female</button></a>
          <a href="/AdoptAnimal/DOGS/short"><button class="btn-2">Small Size</button></a>
          <a href="/AdoptAnimal/DOGS/medium"><button class="btn-2">Medium Size</button></a>
          <a href="/AdoptAnimal/DOGS/large"><button class="btn-2">Large Size</button></a>
          <a href="/AdoptAnimal/DOGS/until3years"><button class="btn-2">Until 3 years</button></a>
        </div>
        </bodydDogs>

        <section class="containerAnimalBox">
          <div class="cardAnimalBox">
            <div class="cardAnimalBox-image card-4"></div>
              <h2>Benji</h2>
              <p><b>Name:</b> Benji</p>
              <p><b>Sex:</b> Male</p>
              <p><b>Age:</b> 2 Years</p>
              <p><b>Size:</b> Short</p>
              <a href="http://localhost:3000/AdoptAnimal/DOGS/Dog4"><h3>More Informations</h3></a>
          </div>
          <div class="cardAnimalBox">
            <div class="cardAnimalBox-image card-6"></div>
              <h2>Nancy</h2>
              <p><b>Name:</b>Nancy </p>
              <p><b>Sex:</b> Female</p>
              <p><b>Age:</b> 7 Weeks</p>
              <p><b>Size:</b> Short</p>
              <a href="http://localhost:3000/AdoptAnimal/DOGS/Dog6"><h3>More Informations</h3></a>
          </div>
        </section>
    </body>
  );
}