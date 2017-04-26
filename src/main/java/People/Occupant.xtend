package People

import Game.CaseFile
import WorldMap.CommonPlace

abstract class Occupant {
		
	def String getClue(CaseFile file, CommonPlace place)
	
	def boolean isVillain()
	
}