package WorldMap

import Game.CaseFile
import People.Keeper
import People.Occupant

abstract class CommonPlace {
	public Occupant occupant;
	
	new (Occupant occupant) {
		this.occupant = new Keeper()
	}
	
	def void setOccupant(Occupant occ)
	{
		this.occupant = occ
	}
	
	def String getPlaceName()
	
	def String getClue(CaseFile cf)
	
	def Occupant getOccupant()
	{
		return this.occupant
	}
	
}