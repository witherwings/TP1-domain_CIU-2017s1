package WorldMap

import People.Occupant
import People.Villain

abstract class CommonPlace {
	String information;
	public Occupant occupant;

	new (Occupant occupant) {
		this.occupant = occupant
	}
	
	def String giveInformation()
	
	def void setInfoOccupant(Villain villano)
	
}