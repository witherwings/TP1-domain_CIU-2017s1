package AppModel

import People.Villain
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.widgets.TextBox

@Observable
@Accessors
class VillainAppModel  {
	
	Villain villain
	String selectedSign
	String selectedHobbie
	
	new (Villain villain) {
		this.villain = villain 
		this.selectedSign = villain.signs.get(0)
		this.selectedHobbie = villain.hobbies.get(0)
	}
	
	def name() {
		this.villain.name 
	}
	
	def gender() {
		this.villain.gender 
	}
	
	def signs() {
		this.villain.signs
	}
	
	def hobbies() {
		this.villain.hobbies 
	}
	
	def addHobbie(String hobbie) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}