package AppModel

import People.ArchiveVillain
import People.Villain
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.ArrayList

@Observable
@Accessors
class ArchiveVillainsAppModel {
	
	List<Villain> villains
	Villain selectedVillain
	
	new(){
		this.villains = new ArrayList
	}
	
	def addVillain(Villain villain) {
		ArchiveVillain.instance.addNewVillain(villain)
	}
	
	def getArchiveVillain(){
		ArchiveVillain.instance
	}
	
	def updateList(){
		this.villains = ArchiveVillain.instance.getVillains()
	}
	
}