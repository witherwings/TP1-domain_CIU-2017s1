package XtRest

import People.Villain
import WorldMap.Country
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class MiniObject {
	
	int id
	String name
	
	new(Villain v) {
		this.id = v.id
		this.name = v.name
	}
	
	new(Country c) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
}

@Accessors
class StandardVillain{
	int id
	String name
	String gender
	List<String> signs
	List<String> hobbies
	
	new(Villain v){
		this.id = v.id
		this.name = v.name
		this.gender = v.gender
		this.signs = v.signs
		this.hobbies = v.hobbies
	}
}