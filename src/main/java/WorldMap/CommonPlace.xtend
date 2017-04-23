package WorldMap

import People.Occupant
import People.Villain
import People.Informant

abstract class CommonPlace {
	String information;
	public Occupant occupant;

	new (Occupant occupant) {
		this.occupant = occupant
	}
	
	def String giveInformation()
	
	def setInfoOccupant(Villain villano) {
		this.occupant = new Informant(villano)
	}

	def String getPlaceName()
	
}