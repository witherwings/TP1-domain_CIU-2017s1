package WorldMap

import People.Occupant
import WorldMap.CommonPlace

class Library extends CommonPlace {

	new (Occupant occupant) {
		super(occupant)
	}
	
	override giveInformation() {
		if(this.occupant.isVillain()){
			return "ALTO! Detengase!" //Agregar lo de orden de arresto
		}else if(this.occupant.isInformant()){
			return "Vi a alguien que se fue a un lugar que tiene "+ this.occupant.getClueDestination()+
				" , ademas "+ this.occupant.getClue()+ this.occupant.getClueHobbies(50)
		}else if(this.occupant.isKeeper){
			return "Vuelva por donde vino"
		}else{
			return this.occupant.getClue()
		}
	}

	override getPlaceName() {
		return "Libreria"
	}
}