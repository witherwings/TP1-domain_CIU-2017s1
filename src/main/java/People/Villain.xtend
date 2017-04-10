package People

import java.util.List
import java.util.ArrayList

class Villain extends Occupant{
	String name;
	String gender;
	List<String> signs;
	List<String> hobbies;
	
	new (String name, String gender)
	{
		this.name = name;
		this.gender = gender;
		this.signs = new ArrayList();
		this.hobbies = new ArrayList();
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