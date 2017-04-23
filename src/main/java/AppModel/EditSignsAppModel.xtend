package AppModel

import People.Villain
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class EditSignsAppModel {
	
	Villain villain
	String currSign = "asd"
	String selectedSign
	List<String> newSigns
	
	new(Villain villain) {
		this.newSigns  = new ArrayList<String>
		this.villain = villain 
		this.villain.signs.forEach [ this.newSigns.add(it) ]
		this.selectedSign = this.newSigns.get(0)
	}
	
	def addSign() {
		this.newSigns.add(currSign)
	}
	
	def removeSign() {
		this.newSigns.remove(this.selectedSign)
	}
	
	def void accept() {
		this.villain.setSigns(this.newSigns)
	}
	
}