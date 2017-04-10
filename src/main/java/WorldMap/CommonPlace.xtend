package WorldMap

import People.Occupant

abstract class CommonPlace {
	String information;
	Occupant occupant;
	
	def String giveInformation();
}