import React from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import AdoptAnimal from "./AdoptAnimal/AdoptAnimal";
import Donate from "./Donate/Donate";
import FoundAnimal from "./FoundAnimal/FoundAnimal";
import Topbar from "./topbar/TopBar";
import Admin from "./Admin/Admin";
import Dogs from "./Dogs/Dogs"
import Dog1 from "./Components/Slider/Dog1"
import Dog2 from "./Components/Slider/Dog2"
import Dog3 from "./Components/Slider/Dog3"
import Dog4 from "./Components/Slider/Dog4"
import Dog5 from "./Components/Slider/Dog5"
import Dog6 from "./Components/Slider/Dog6"
import Filter3years from "./Dogs/Filter3years"
import FilterShort from "./Dogs/FilterShort"
import FilterMedium from "./Dogs/FilterMedium"
import FilterLarge from "./Dogs/FilterLarge"
import FilterMale from "./Dogs/FilterMale"
import FilterFemale from "./Dogs/FilterFemale"
import Validate from "./Validate/Validate"
import Cats from "./Cats/Cats"
import Cat1 from "./Components/Slider/Cat1"
import Cat2 from "./Components/Slider/Cat2"
import Cat3 from "./Components/Slider/Cat3"
import Cat4 from "./Components/Slider/Cat4"
import Cat5 from "./Components/Slider/Cat5"
import Cat6 from "./Components/Slider/Cat6"
import FilterCat3years from "./Cats/FilterCat3years"
import FilterCatShort from "./Cats/FilterCatShort"
import FilterCatMedium from "./Cats/FilterCatMedium"
import FilterCatLong from "./Cats/FilterCatLong"
import FilterCatMale from "./Cats/FilterCatMale"
import FilterCatFemale from "./Cats/FilterCatFemale"
import FoundAnimalTwo from "./FoundAnimalTwo/FoundAnimalTwo"
import Submited from "./Submited/Submited"
import Submited2 from "./Submited2/Submited2"


function App() {

	return (
		<>


			<Router>
				<Routes>
					<Route path="/" element={ <Topbar /> } />
					<Route path="/AdoptAnimal" element={ <AdoptAnimal /> } />
					<Route path="/Donate" element={ <Donate /> } />
					<Route path="/FoundAnimal" element={ <FoundAnimal /> } />
					<Route path="/FoundAnimalTwo" element={ <FoundAnimalTwo /> } />
                    <Route path="/Submited" element={ <Submited /> } />
                    <Route path="/Submited2" element={ <Submited2 /> } />
					<Route path="/Admin" element={ <Admin /> } />
					<Route path="/Validate" element={ <Validate /> } />
					<Route path="/AdoptAnimal/DOGS" element={ <Dogs /> } />
					<Route path="/AdoptAnimal/DOGS/Dog1" element={ <Dog1 /> } />
					<Route path="/AdoptAnimal/DOGS/Dog2" element={ <Dog2 /> } />
					<Route path="/AdoptAnimal/DOGS/Dog3" element={ <Dog3 /> } />
					<Route path="/AdoptAnimal/DOGS/Dog4" element={ <Dog4 /> } />
					<Route path="/AdoptAnimal/DOGS/Dog5" element={ <Dog5 /> } />
					<Route path="/AdoptAnimal/DOGS/Dog6" element={ <Dog6 /> } />
					<Route path="/AdoptAnimal/DOGS/until3years" element={ <Filter3years /> } />
					<Route path="/AdoptAnimal/DOGS/short" element={ <FilterShort /> } />
					<Route path="/AdoptAnimal/DOGS/medium" element={ <FilterMedium /> } />
					<Route path="/AdoptAnimal/DOGS/large" element={ <FilterLarge /> } />
					<Route path="/AdoptAnimal/DOGS/male" element={ <FilterMale /> } />
					<Route path="/AdoptAnimal/DOGS/female" element={ <FilterFemale /> } />
					<Route path="/AdoptAnimal/CATS" element={ <Cats /> } />
					<Route path="/AdoptAnimal/CATS/Cat1" element={ <Cat1 /> } />
					<Route path="/AdoptAnimal/CATS/Cat2" element={ <Cat2 /> } />
					<Route path="/AdoptAnimal/CATS/Cat3" element={ <Cat3 /> } />
					<Route path="/AdoptAnimal/CATS/Cat4" element={ <Cat4 /> } />
					<Route path="/AdoptAnimal/CATS/Cat5" element={ <Cat5 /> } />
					<Route path="/AdoptAnimal/CATS/Cat6" element={ <Cat6 /> } />
					<Route path="/AdoptAnimal/CATS/until3years" element={ <FilterCat3years /> } />
					<Route path="/AdoptAnimal/CATS/shortCoat" element={ <FilterCatShort /> } />
					<Route path="/AdoptAnimal/CATS/mediumCoat" element={ <FilterCatMedium /> } />
					<Route path="/AdoptAnimal/CATS/longCoat" element={ <FilterCatLong /> } />
					<Route path="/AdoptAnimal/CATS/male" element={ <FilterCatMale /> } />
					<Route path="/AdoptAnimal/CATS/female" element={ <FilterCatFemale /> } />
					
				</Routes>
			</Router>

		</>
	);
}

export default App;
