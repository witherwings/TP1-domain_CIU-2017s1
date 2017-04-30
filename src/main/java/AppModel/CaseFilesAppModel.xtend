package AppModel

import Game.CaseFile
import Game.GameFiles
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import utils.Randoms
import WorldMap.Country
import org.uqbar.commons.model.ObservableUtils

@Observable
@Accessors
class CaseFilesAppModel {

	List<CaseFile> cases
	CaseFile caseF

	new() {
		this.cases = new ArrayList
	}

	def initializeCaseFiles() {
		this.cases = GameFiles.instance.getCaseFiles()
		this.randomNewCase
	}

	def randomNewCase() {
		caseF = cases.get(Randoms.randomBetween(0, 4))
	}
	
	 def updateList(){
    	ObservableUtils.firePropertyChanged(this, "currentCountry")
    	ObservableUtils.firePropertyChanged(this, "lastCountry")
    	ObservableUtils.firePropertyChanged(this, "nextCountry")
    }
    
    def getCurrentCountry(){
    	caseF.getCurrentCountry()
    }
    
    def getLastCountry(){
    	caseF.getLastCountry()
    }
    
    def getNextCountry(){
    	caseF.getNextCountry()
    }
}
