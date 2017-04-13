package People

import java.util.List
import java.util.ArrayList

class Villain extends Occupant{
	String name;
	String gender;
	List<String> signs;
	List<String> hobbies;
	
	new (String name, String gender, List<String> signs, List<String> hobbies)
	{
		this.name = name;
		this.gender = gender;
		this.signs = signs
		this.hobbies = hobbies
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
	
}