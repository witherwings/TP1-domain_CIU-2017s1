package XtRest

import People.Villain
import WorldMap.Country
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class MiniObject {
	
	int id
	String name
	
	new(){}
	
	new(Villain v) {
		this.id = v.id
		this.name = v.name
	}
	
	new(Country c) {
		this.id = c.id
		this.name = c.name
	}
}