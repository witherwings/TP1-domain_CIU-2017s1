package AppModel

import People.Villain
import java.util.ArrayList
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
@Observable
class EditHobbiesAppModel {
	
	Villain villain
	String currHobbie = "asd"
	String selectedHobbie
	List<String> newHobbies
	
	new(Villain villain) {
		this.newHobbies  = new ArrayList<String>
		this.villain = villain 
		this.villain.hobbies.forEach [ this.newHobbies.add(it) ]
		if (this.newHobbies.size > 0) {
			this.selectedHobbie = this.newHobbies.get(0)
		}
	}
	
	def addHobbie() {
		this.newHobbies.add(currHobbie)
		if (this.newHobbies.size == 1) {
			this.selectedHobbie = this.newHobbies.get(0)
		}
	}
	
	def removeHobbie() {
		this.newHobbies.remove(this.selectedHobbie)
	}
	
	def void accept() {
		this.villain.setHobbies(this.newHobbies)
	}
	
}