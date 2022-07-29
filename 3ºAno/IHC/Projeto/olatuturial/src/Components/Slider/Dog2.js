import React, {useState} from 'react'
import './Slider.css'
import BtnSlider from './BtnSlider'
import dataSlider from './dataSlider'

export default function Slider2() {

    const [slideIndex, setSlideIndex] = useState(1)

    const nextSlide = () => {
        if(slideIndex !== dataSlider.length){
            setSlideIndex(slideIndex + 1)
        } 
        else if (slideIndex === dataSlider.length){
            setSlideIndex(1)
        }
    }

    const prevSlide = () => {
        if(slideIndex !== 1){
            setSlideIndex(slideIndex - 1)
        }
        else if (slideIndex === 1){
            setSlideIndex(dataSlider.length)
        }
    }

    const moveDot = index => {
        setSlideIndex(index)
    }

    return (
    <body>
      <header>
      <h1><a href="http://localhost:3000"><button>WebApp</button></a></h1>
        <nav>
          <ul class="nav_links">
            <li><a href="http://localhost:3000/AdoptAnimal">Adopt Animal</a></li>
            <li><a href="http://localhost:3000/Donate">Donate</a></li>
            <li><a href="http://localhost:3000/FoundAnimal">Found Animal</a></li>
          </ul>
        </nav>
        <a class="cta" href="http://localhost:3000/Admin"><button>Admin</button></a>
      </header>
      <bodydDonate>
        <div class="containerDonate">

            <div class="card">
                <div class="imgBx">
                    <center><h3><b>Hi, I'm Luna!</b></h3></center>
                    <center><h3><b>Below are my photos and information!</b></h3></center>
                    <center><h3><b>If you want to adopt me, contact my Holder!</b></h3></center>
                    <center><h3><b>Please, Adopt Me! :(</b></h3></center>
                </div>
            </div>


        </div>
        </bodydDonate>
        <div className="container-slider">
            {dataSlider.map((obj, index) => {
                return (
                    <div
                    key={obj.id}
                    className={slideIndex === index + 1 ? "slide active-anim" : "slide"}
                    >
                        <img 
                        src={process.env.PUBLIC_URL + `/Imgs/ImgsDog2/img${index + 1}.jpg`} 
                        />
                    </div>
                )
            })}

            
            <BtnSlider moveSlide={nextSlide} direction={"next"} />
            <BtnSlider moveSlide={prevSlide} direction={"prev"}/>

            <div className="container-dots">
                {Array.from({length: 5}).map((item, index) => (
                    <div 
                    onClick={() => moveDot(index + 1)}
                    className={slideIndex === index + 1 ? "dot active" : "dot"}
                    ></div>
                ))}
            </div>
        </div>
        
        
        <bodydSlider>
        <div class="containerSlider">

            <div>
                <input type="radio" name="sushi-lunch" id="happy-radio"/>
                <input type="radio" name="sushi-lunch" id="lovers-radio" checked/>

                <div class="selector">
                    <label for="happy-radio" class="happy-card">
                    <h1>Name: Luna</h1>
                    <ul>
                        <li><b>Breed:</b>Cane Corso</li>
                        <li><b>Sex:</b>Male</li>
                        <li><b>Age:</b>2 Years</li>
                        <li><b>Size:</b>Large</li>
                        <li><b>Vaccines:</b>Vaccinated and Sterilized</li>
                        <li><b>More Information:</b>Playful, Hyperactive, Loves to walk</li>
                        

                    </ul>
                    </label>

                    <label for="lovers-radio" class="lovers-card">
                    <h1>Holder: Person</h1>
                    <ul>
                        <li><b>Name:</b>Rodrigo</li>
                        <li><b>Email:</b> rodrigo123@gmail.com</li>
                        <li><b>Telefone:</b>914363296</li>
                        <li><b>Morada:</b>Rua do Brasil 320, 3030-243 Coimbra</li>
                    </ul>
                    </label>
                    
                    <label for="happy-radio" class="happy-pick">Switch to Animal information!</label>
                    <label for="lovers-radio" class="lovers-pick">Switch to Holder Information!</label>
                </div>
            </div>


        </div>
        </bodydSlider>
    </body>
    )
}