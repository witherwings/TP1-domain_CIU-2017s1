package WorldMap

import People.Occupant
import WorldMap.CommonPlace
import People.Villain
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Library extends CommonPlace {

	new (Occupant occupant) {
		super(occupant)
	}
	
	override giveInformation() {
		return "1 clue about villain destination and 1 clue about villain signs. 
				50% 1 clue about hobbies."
	}
	
	override setInfoOccupant(Villain villano) {
		occupant.setClue(villano)
	}

	override getPlaceName() {
		return "Libreria"
	}
	
}