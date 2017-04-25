package People

import java.util.List

abstract class Occupant {
	def void takeAction()
	
	def void setClue(Villain villano)
	
	def String getClue()
	
	def boolean isInformant()
	
	def boolean isKeeper()
	
	def String getClueDestination()
	
	def String getClueHobbies(int porcentaje)
	
	def boolean isVillain()
	
}