package WorldMap

import People.Occupant
import People.Villain
import People.Keeper
import People.Informant

abstract class CommonPlace {
	String information;
	public Occupant occupant;
	
	new (Occupant occupant) {
		this.occupant = new Keeper()
	}
	
	def String giveInformation()
	
	def void setInfoOccupant(Villain villano)

	def String getPlaceName()
	
	def void setOccupant(Occupant occ)
	{
		this.occupant = occ
	}
	
}