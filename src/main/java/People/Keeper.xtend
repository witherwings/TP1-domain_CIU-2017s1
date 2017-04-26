package People

import Game.CaseFile
import WorldMap.CommonPlace

class Keeper extends Occupant {
	
	override getClue(CaseFile file, CommonPlace place) {
		"Lo siento, creo que se ha equivocado de Ciudad; no hay nadie con esas caracteristicas"
	}
	
	override isVillain() {false}
	
}