package AppModel

import People.Villain
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class NewVillainAppModel {
	
	Villain villain 
	
	new (Villain villain) {
		this.villain = villain 
	}
	
}