package WorldMap

import Game.CaseFile
import People.Occupant
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Embassy extends CommonPlace {

	new (Occupant occupant) {
		super(occupant)
	}
	
	override getPlaceName() {
		return "Embajada"
	}
	
	override getClue(CaseFile cf) {
		val nextCountry = cf.checkPossibleNextCountry		
			
		"Vi alguien como describe!. Recuerdo que en su proximo destino " 
			+ nextCountry.getRandomFeature + " y tambien que " + nextCountry.getRandomFeature
	}
	
}