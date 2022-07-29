import "./validate.css";
import React from "react";
import {useHistory} from "react-router-dom";
import Popup from 'reactjs-popup';
import 'reactjs-popup/dist/index.css';



export default function Validate() {
  return (

    <body>


    <header>
      <h1><a href="http://localhost:3000"><button>WebApp</button></a></h1>
        <nav>
          <ul class="nav_links">
          </ul>
        </nav>
      </header>

        <sectionvalidate>
            <figure class="cardvalidate">
                <div class="cardvalidate_hero">
                    <img class ="cardvalidate_img" src="https://blog.barkyn.com/wp-content/uploads/2020/05/labrador.jpg"/>
                </div>
                <div class="cardvalidate_content">
                    <div class="cardvalidate_info">
                        <hvalidateanimal class="cardvalidate_raca"><b>Animal</b> </hvalidateanimal>
                        <hvalidate class="cardvalidate_raca"><b>Type:</b>Dog</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Breed:</b>Labrador retriever</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Sex:</b>Male</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>State:</b>Looks Healthy</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Keep:</b>No</hvalidate> 
                    </div>
                </div>
                <div class="cardvalidate_content2">
                    <div class="cardvalidate_info">
                        <hvalidateperson class="cardvalidate_raca"><b>Person</b> </hvalidateperson>
                        <hvalidate class="cardvalidate_raca"><b>First Name:</b>Cristiano</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Last Name:</b>Ronaldo</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Email:</b>cristianoronaldo@gmail.com</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Number:</b>927482728</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Sex:</b>Masculine</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Address:</b>Viseu</hvalidate>
                    </div>
                    <div>
                        <Popup trigger={<button class="cardvalidate_buttonaccept">Accept</button>} 
                        position="top">
                        <center>Validated</center>
                        </Popup>
                    </div>
                    <div>
                        <Popup trigger={<button class="cardvalidate_buttonreject">Reject</button>} 
                        position="top">
                        <center>Not validated</center>
                        </Popup>
                    </div>
                </div>
            </figure>
        </sectionvalidate>

        <sectionvalidate>
            <figure class="cardvalidate">
                <div class="cardvalidate_hero">
                    <img class ="cardvalidate_img" src="https://www.guildinsurance.com.au/images/librariesprovider3/breed-images/500x500/cat_sphynx.jpg?sfvrsn=1716600b_2"/>
                </div>
                <div class="cardvalidate_content">
                    <div class="cardvalidate_info">
                        <hvalidateanimal class="cardvalidate_raca"><b>Animal</b> </hvalidateanimal>
                        <hvalidate class="cardvalidate_raca"><b>Type:</b>Cat</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Breed:</b>Sphynx</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Sex:</b>Male</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>State:</b>Looks Healthy</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Keep:</b>Yes</hvalidate> 
                    </div>
                </div>
                <div class="cardvalidate_content2">
                    <div class="cardvalidate_info">
                        <hvalidateperson class="cardvalidate_raca"><b>Person</b> </hvalidateperson>
                        <hvalidate class="cardvalidate_raca"><b>First Name:</b>John</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Last Name:</b>Carper</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Email:</b>johncarper@gmail.com</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Number:</b>932847888</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Sex:</b>Masculine</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Address:</b>Algarve</hvalidate>
                    </div>
                    <div>
                        <Popup trigger={<button class="cardvalidate_buttonaccept">Accept</button>} 
                        position="top">
                        <center>Validated</center>
                        </Popup>
                    </div>
                    <div>
                        <Popup trigger={<button class="cardvalidate_buttonreject">Reject</button>} 
                        position="top">
                        <center>Not validated</center>
                        </Popup>
                    </div>
                </div>
            </figure>
        </sectionvalidate>


        <sectionvalidate>
            <figure class="cardvalidate">
                <div class="cardvalidate_hero">
                    <img class ="cardvalidate_img" src="https://www.portaldosanimais.com.br/wp-content/uploads/2019/10/Pastor-Alem%C3%A3o-5.jpeg"/>
                </div>
                <div class="cardvalidate_content">
                    <div class="cardvalidate_info">
                        <hvalidateanimal class="cardvalidate_raca"><b>Animal</b> </hvalidateanimal>
                        <hvalidate class="cardvalidate_raca"><b>Type:</b>Dog</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Breed:</b>German Shepherd</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Sex:</b>Female</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>State:</b>Looks Healthy</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Keep:</b>No</hvalidate> 
                    </div>
                </div>
                <div class="cardvalidate_content2">
                    <div class="cardvalidate_info">
                        <hvalidateperson class="cardvalidate_raca"><b>Person</b> </hvalidateperson>
                        <hvalidate class="cardvalidate_raca"><b>First Name:</b>Dua</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Last Name:</b>Lipa</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Email:</b>dualipa@gmail.com</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Number:</b>962837281</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Sex:</b>Feminine</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Address:</b>Lisboa</hvalidate>
                    </div>
                    <div>
                        <Popup trigger={<button class="cardvalidate_buttonaccept">Accept</button>} 
                        position="top">
                        <center>Validated</center>
                        </Popup>
                    </div>
                    <div>
                        <Popup trigger={<button class="cardvalidate_buttonreject">Reject</button>} 
                        position="top">
                        <center>Not validated</center>
                        </Popup>
                    </div>
                </div>
            </figure>
        </sectionvalidate>



        <sectionvalidate>
            <figure class="cardvalidate">
                <div class="cardvalidate_hero">
                    <img class ="cardvalidate_img" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLNyIkqqFq_EfODL3_ABIsCYjonwOcsCnvSg&usqp=CAU"/>
                </div>
                <div class="cardvalidate_content">
                    <div class="cardvalidate_info">
                        <hvalidateanimal class="cardvalidate_raca"><b>Animal</b> </hvalidateanimal>
                        <hvalidate class="cardvalidate_raca"><b>Type:</b>Dog</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Breed:</b>Mongrel</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Sex:</b>Male</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>State:</b>Injured</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Keep:</b>Yes</hvalidate> 
                    </div>
                </div>
                <div class="cardvalidate_content2">
                    <div class="cardvalidate_info">
                        <hvalidateperson class="cardvalidate_raca"><b>Person</b> </hvalidateperson>
                        <hvalidate class="cardvalidate_raca"><b>First Name:</b>Mike</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Last Name:</b>Brown</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Email:</b>mikebrown@gmail.com</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Number:</b>921029100</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Sex:</b>Masculine</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Address:</b>Porto</hvalidate>
                    </div>
                    <div>
                        <Popup trigger={<button class="cardvalidate_buttonaccept">Accept</button>} 
                        position="top">
                        <center>Validated</center>
                        </Popup>
                    </div>
                    <div>
                        <Popup trigger={<button class="cardvalidate_buttonreject">Reject</button>} 
                        position="top">
                        <center>Not validated</center>
                        </Popup>
                    </div>
                </div>
            </figure>
        </sectionvalidate>

        <sectionvalidate>
            <figure class="cardvalidate">
                <div class="cardvalidate_hero">
                    <img class ="cardvalidate_img" src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a3e46a02-5625-4c45-a3d4-480407fa4475/dcl8a4q-1197d86c-0d06-4a0a-b1bf-1d8b7bdb240d.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2EzZTQ2YTAyLTU2MjUtNGM0NS1hM2Q0LTQ4MDQwN2ZhNDQ3NVwvZGNsOGE0cS0xMTk3ZDg2Yy0wZDA2LTRhMGEtYjFiZi0xZDhiN2JkYjI0MGQuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.vHtO8Rtev5NmQSzYwIJMbZlhj3OGI550BDaIkQAFtig"/>
                </div>
                <div class="cardvalidate_content">
                    <div class="cardvalidate_info">
                        <hvalidateanimal class="cardvalidate_raca"><b>Animal</b> </hvalidateanimal>
                        <hvalidate class="cardvalidate_raca"><b>Type:</b>Cat</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Breed:</b>Siberian</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Sex:</b>Female</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>State:</b>Looks Healthy</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Keep:</b>Yes</hvalidate> 
                    </div>
                </div>
                <div class="cardvalidate_content2">
                    <div class="cardvalidate_info">
                        <hvalidateperson class="cardvalidate_raca"><b>Person</b> </hvalidateperson>
                        <hvalidate class="cardvalidate_raca"><b>First Name:</b>Emilly</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Last Name:</b>Holmes</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Email:</b>emillyholmes@gmail.com</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Number:</b>912998281</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Sex:</b>Female</hvalidate>
                        <hvalidate class="cardvalidate_raca"><b>Address:</b>Alentejo</hvalidate>
                    </div>
                    <div>
                        <Popup trigger={<button class="cardvalidate_buttonaccept">Accept</button>} 
                        position="top">
                        <center>Validated</center>
                        </Popup>
                    </div>
                    <div>
                        <Popup trigger={<button class="cardvalidate_buttonreject">Reject</button>} 
                        position="top">
                        <center>Not validated</center>
                        </Popup>
                    </div>
                </div>
            </figure>
        </sectionvalidate>

        <a href="http://localhost:3000/"> <center><button class="buttonconcuido">Done</button></center> </a>

    </body>
  );
}