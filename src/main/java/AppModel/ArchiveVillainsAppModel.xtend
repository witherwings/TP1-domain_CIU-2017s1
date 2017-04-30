package AppModel

import People.ArchiveVillain
import People.Villain
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class ArchiveVillainsAppModel {
	
	Villain selectedVillain
	String warrant = "Orden aun no emitida"
	Villain responsible
	
	def addVillain(Villain villain) {
		ArchiveVillain.instance.addNewVillain(villain)
	}
	
	def getArchiveVillain(){
		ArchiveVillain.instance
	}
	
	def getVillains(){
		ArchiveVillain.instance.getVillains()
	}
	
	def updateList(){
		ObservableUtils.firePropertyChanged(this, "selectedVillain")
		ObservableUtils.firePropertyChanged(this, "villains")
	}
	
}