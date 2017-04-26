package WorldMap

import Game.CaseFile
import People.Occupant
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.Random

@Observable
@Accessors
class Club extends CommonPlace {
	
	static val random = new Random
	
	new (Occupant occupant) {
		super(occupant)
	}

	override getPlaceName() {
		return "Club"
	}
	
	override getClue(CaseFile cf) {
		val villain = cf.responsible
		var chance = randomBetween(1,10)
		var lastClue = "."
	
		if(chance <= 7)
			lastClue = " y ademas " + villain.getRandomHobbie + "."
			
		"Vi alguien como describe!" + villain.getRandomSign + ". Recuerdo tambien que " + villain.getRandomSign + lastClue
	}
	
	def static randomBetween(Integer min, Integer max) {
		val difference = max - min + 1
		random.nextInt(difference) + min
	}
	
}