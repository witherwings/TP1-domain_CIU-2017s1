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
		return this.occupant.getClue()
		//"2 clues about villain signs. 70% 1 clue about hobbies."
	}

	override getPlaceName() {
		return "Club"
	}
	
}