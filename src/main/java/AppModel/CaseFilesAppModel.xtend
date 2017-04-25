package AppModel

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import Game.CaseFile
import java.util.List
import java.util.ArrayList
import java.util.Random
import Game.GameFiles

@Observable
@Accessors
class CaseFilesAppModel {
	
	List<CaseFile> cases
	CaseFile selectedCase
	static val random = new Random
	
	new(){
		this.cases = new ArrayList
	}
	
	def updateList(){
		this.cases = GameFiles.instance.getCaseFiles()
	}
	
	def CaseFile randomNewCase(){
		cases.get(randomBetween(0,4))
	}
	
	def static randomBetween(Integer min, Integer max) {
		val difference = max - min + 1
		random.nextInt(difference) + min
	}
}