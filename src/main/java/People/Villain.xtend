package People

import java.util.List
import java.util.ArrayList
import java.util.Random
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import WorldMap.Country

@Observable
@Accessors
class Villain extends Occupant{
	String name;
	String gender;
	List<String> signs;
	List<String> hobbies;
	
	Country destination
	static val random = new Random
	
	new (String name, String gender, List<String> signs, List<String> hobbies)
	{
		this.name = name;
		this.gender = gender;
		this.signs = signs
		this.hobbies = hobbies
	}
	
	new(String name) {
		this.name = name
		this.gender = "None"
		this.signs = new ArrayList()
		this.hobbies = new ArrayList()
	}
	
	def void setGender(String gender)
	{
		this.gender = gender
	}
	
	def void addASign(String newSign)
	{
		this.signs.add(newSign);
	}
	
	def void addAHobbie(String newHobbie)
	{
		this.hobbies.add(newHobbie);
	}
	
	override takeAction() {
		//Shoots detective
	}
	
	def String getRandomSign() {
		return randomIn(this.signs)
	}
	
	def signsInfo() {
		val result = new ArrayList<String>()
		this.signs.forEach [
			result.add(it)
		]
		return result
	}

	def hobbiesInfo() {
		val result = new ArrayList<String>()
		this.hobbies.forEach [
			result.add(it)
		]
		return result
	}
	
	def static String randomIn(List<String> lista) {
		lista.get(random.nextInt(lista.size))
	}
	
	def addDestination(WorldMap.Country country) {
		this.destination = country
	}
	
	// Fijarse bien esto
	override setClue(Villain villano) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override String getClue() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override isInformant() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override isKeeper() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override getClueDestination() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override getClueHobbies(int porcentaje) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}