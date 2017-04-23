package WorldMap

import People.Occupant
import WorldMap.CommonPlace

class Library extends CommonPlace {

	new (Occupant occupant) {
		super(occupant)
	}
	
	override giveInformation() {
		return "Vi a alguien que se fue a un lugar que tiene "+ this.occupant.getClueDestination()+
			" , ademas con "+ this.occupant.getClue()+ this.occupant.getClueHobbies(50)
	}

	override getPlaceName() {
		return "Libreria"
	}
}