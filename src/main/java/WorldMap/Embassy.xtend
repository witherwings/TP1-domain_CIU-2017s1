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
			return "Se fue para un pais que tiene "+ this.occupant.getClueDestination()+
				" y "+this.occupant.getClueDestination()
		}else if(this.occupant.isKeeper){
			return "Siga su camino"
		}
	}

	override getPlaceName() {
		return "Embajada"
	}
	
}