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
		if(this.occupant.isInformant()){
			// Ver como hacer para devolver dos pistas sobre el destino
			return "Se fue para un pais que tiene "+ this.occupant.getClueDestination()
		}
	}
	
	override setInfoOccupant(Villain villano) {
		this.occupant = new Informant(villano)
	}


	override getPlaceName() {
		return "Embajada"
	}
	
}