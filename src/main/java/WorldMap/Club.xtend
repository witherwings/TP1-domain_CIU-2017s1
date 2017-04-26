package WorldMap

import Game.CaseFile
import People.Occupant
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import utils.Randoms

@Observable
@Accessors
class Club extends CommonPlace {

	new(Occupant occupant) {
		super(occupant)
	}

	override getPlaceName() {
		return "Club"
	}

	override getClue(CaseFile cf) {
		val villain = cf.responsible
		var chance = Randoms.randomBetween(1, 10)
		var lastClue = "."

		if (chance <= 7)
			lastClue = " y ademas " + villain.getRandomHobbie + "."

		"Vi alguien como describe!  Creo que " + villain.getRandomSign + ". Recuerdo tambien que " + villain.getRandomSign +
			lastClue
	}

}
