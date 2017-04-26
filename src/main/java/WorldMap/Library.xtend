package WorldMap

import Game.CaseFile
import People.Occupant
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.Random

@Observable
@Accessors
class Library extends CommonPlace {

	static val random = new Random
	
	new (Occupant occupant) {
		super(occupant)
	}
	
	override getPlaceName() {
		return "Libreria"
	}
	
	override getClue(CaseFile cf) {
		val villain = cf.responsible
		var chance = randomBetween(1,10)
		var lastClue = "."
		val nextCountry = cf.checkPossibleNextCountry		
		
		if(chance < 5)
			lastClue = " y ademas " villain.getRandomHobbie + "."
			
		"Vi alguien como describe!. Recuerdo que en su proximo destino " 
			+ nextCountry.getRandomFeature + ". Tambien recuerdo que " + villain.getRandomSign + lastClue
	}
	
	def static randomBetween(Integer min, Integer max) {
		val difference = max - min + 1
		random.nextInt(difference) + min
	}
	
}