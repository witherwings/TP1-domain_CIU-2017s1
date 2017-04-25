package WorldMap

import People.Occupant
import WorldMap.CommonPlace
import People.Villain
import java.util.List
import java.util.Random

class Club extends CommonPlace {

	static val random = new Random
	
	new (Occupant occupant) {
		super(occupant)
	}
		
	override String giveInformation() {
		if(this.occupant.isInformant()){
			return "Vi una persona que "+ 
				this.occupant.getClue()+", y "+
				this.occupant.getClue()+ this.occupant.getClueHobbies(70)
		}else if(this.occupant.isKeeper){
			return "Vuelva por donde vino"
		}
	}

	override getPlaceName() {
		return "Club"
	}
	
}