package AppModel

import Game.CaseFile
import Game.GameFiles
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import utils.Randoms

@Observable
@Accessors
class CaseFilesAppModel {

	List<CaseFile> cases
	CaseFile selectedCase

	new() {
		this.cases = new ArrayList
	}

	def updateList() {
		this.cases = GameFiles.instance.getCaseFiles()
	}

	def CaseFile randomNewCase() {
		cases.get(Randoms.randomBetween(0, 4))
	}
}
