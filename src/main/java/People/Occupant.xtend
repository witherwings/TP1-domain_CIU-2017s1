package People

import Game.CaseFile
import WorldMap.CommonPlace
import org.uqbar.commons.utils.Observable

@Observable
abstract class Occupant {
		
	public int id;	
		
	def String getClue(CaseFile file, CommonPlace place)
	
	def boolean isVillain()
	
}