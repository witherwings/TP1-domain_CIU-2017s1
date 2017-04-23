package WorldMap

import WorldMap.CommonPlace
import People.Occupant
import People.Villain
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Embassy extends CommonPlace {

	new (Occupant occupant) {
		super(occupant)
	}
	
	override giveInformation() {
		return "2 clues about villain destination"
	}
	
	override setInfoOccupant(Villain villano) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}


	override getPlaceName() {
		return "Embajada"
	}
	
}