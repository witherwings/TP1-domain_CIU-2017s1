package AppModel

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import Game.CaseFile
import java.util.List
import People.Villain
import WorldMap.Country

@Observable
@Accessors
class CaseFileAppModel {
	List<CaseFile> cases
	
	
	new(){
		val case1 = new CaseFile("Tumba Del Faraon") => [
            addVillain(new Villain("Carmen Sandiego"))
            addCountryRobbed(new Country("Egipto"))
            addCountryEscape(new Country("Marruecos"))
            addCountryEscape(new Country("España"))
            addCountryEscape(new Country("Francia"))
            addReport("A las 9 de la mañana en la ciudad del Cairo la comunidad científica fue conmovida al darse 
			cuenta del faltante de gran valor! El sarcófago del faraón Usermaatra-Meriamón Ramsés-Heqaiunu, mejor 
			conocido como Ramsés III. El criminal fue muy prolijo y la escena del crimen no contaba con pista alguna, 
			su misión como detective es desifrar el responsable de tal crímen y apresarlo.")
			addObjectRobbed("Tumba del faraón")
        ]
	}
}