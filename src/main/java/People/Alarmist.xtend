package People

class Alarmist extends Occupant {
	
	override getClue() {
		return "CUIDADOOO! El villano esta en la ciudad!"
	}
	
	override isInformant() {
		return false
	}
	
	override isKeeper() {
		return false
	}
	
	override isVillain() {
		return false
	}
	
	override takeAction() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override setClue(Villain villano) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override getClueDestination() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override getClueHobbies(int porcentaje) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}