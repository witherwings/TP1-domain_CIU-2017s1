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
	
	override isInformant(){
		return false
	}
	
	override isKeeper() {
		return true
	}
	
	override getClueDestination() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override getClueHobbies(int porcentaje) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}