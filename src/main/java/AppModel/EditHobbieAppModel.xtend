package AppModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import People.Villain

@Observable
@Accessors
class EditHobbieAppModel {
	
	Villain villain
	
	new(Villain villain) {
		this.villain = villain
	}
	
}