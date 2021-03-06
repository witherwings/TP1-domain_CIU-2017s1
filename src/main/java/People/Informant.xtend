package People

import Game.CaseFile
import WorldMap.CommonPlace

class Informant extends Occupant {

	override getClue(CaseFile file, CommonPlace place) {

		if (file.currentCountry == file.escapePlanFinalCountry())
			"CUIDADO DETECTIVE!! Ha estado a punto de caer en una trampa. La persona que busca esta en la ciudad."
		else
			place.getClue(file)
	}

	override isVillain() { false }

}
