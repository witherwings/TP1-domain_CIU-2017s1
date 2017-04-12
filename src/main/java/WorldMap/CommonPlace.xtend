package WorldMap

import People.Occupant

abstract class CommonPlace {
	String information;
	Occupant occupant;

	new (Occupant occupant) {
		this.occupant = occupant
	}
	
	def String giveInformation();
}