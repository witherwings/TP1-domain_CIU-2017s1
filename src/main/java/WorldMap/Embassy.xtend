package WorldMap

import WorldMap.CommonPlace
import People.Occupant
import People.Villain
import People.Informant

class Embassy extends CommonPlace {

	new (Occupant occupant) {
		super(occupant)
	}
	
	override giveInformation() {
		if(this.occupant.isVillain()){
			return "ALTO! Detengase!" //Agregar lo de orden de arresto
		}else if(this.occupant.isInformant()){
			return "Se fue para un pais que tiene "+ this.occupant.getClueDestination()+
				" y "+this.occupant.getClueDestination()
		}else if(this.occupant.isKeeper){
			return "Vuelva por donde vino"
		}else{
			return this.occupant.getClue()
		}
	}

	override getPlaceName() {
		return "Embajada"
	}
	
}