package XtRest

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import People.Villain

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