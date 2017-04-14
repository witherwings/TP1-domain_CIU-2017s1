package People

import People.Occupant

class Keeper extends Occupant {
	
	override takeAction() {
		//Wrong country, pal
	}
	
	override void setClue(Villain villano){
		// hacer algo
	}
	
	override getClue() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}