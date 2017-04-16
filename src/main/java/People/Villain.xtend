package People

import java.util.List
import java.util.ArrayList
import java.util.Random

class Villain extends Occupant{
	String name;
	String gender;
	List<String> signs;
	List<String> hobbies;
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
		this.signs = new ArrayList()
		this.hobbies = new ArrayList()
	}
	
	def void addSign(String newSign)
	{
		this.signs.add(newSign);
	}
	
	def void addHobbie(String newHobbie)
	{
		this.hobbies.add(newHobbie);
	}
	
	override takeAction() {
		//Shoots detective
	}
	
	def String getSigns() {
		return randomIn(this.signs)
	}
	
	def static String randomIn(List<String> lista) {
		lista.get(random.nextInt(lista.size))
	}
	
	// Fijarse bien esto
	override setClue(Villain villano) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override String getClue() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}