package WorldMap

import Game.CaseFile
import People.Occupant
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Bank extends CommonPlace {

	new (Occupant occupant) {
		super(occupant)
	}
	
	override getPlaceName() {
		return "Banco"
	}

	override getClue(CaseFile cf) {
		val villain = cf.responsible
		val nextCountry = cf.checkPossibleNextCountry		
			
		"Vi alguien como describe! " + villain.getRandomSign 
			+ ". Recuerdo tambien que en su proximo destino " 
			+ nextCountry.getRandomFeature
	}
	
}