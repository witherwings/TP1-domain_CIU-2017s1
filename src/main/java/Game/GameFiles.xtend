package Game

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.List
import People.Villain
import WorldMap.Country
import WorldMap.WorldMap
import java.util.ArrayList
import People.ArchiveVillain

@Observable
@Accessors
class GameFiles {
	
	List<CaseFile> caseFiles
	WorldMap map = WorldMap.instance
	
	private static GameFiles instance = null
	
	new(){
		val case1 = new CaseFile("Tumba Del Faraon") => [
            addCountryRobbed(new Country("Egipto", map))
            addCountryEscape(new Country("Marruecos", map))
            addCountryEscape(new Country("España", map))
            addCountryEscape(new Country("Francia", map))
            addReport("A las 9 de la mañana en la ciudad del Cairo la comunidad científica fue conmovida al darse 
			cuenta del faltante de gran valor! El sarcófago del faraón Usermaatra-Meriamón Ramsés-Heqaiunu, mejor 
			conocido como Ramsés III. El criminal fue muy prolijo y la escena del crimen no contaba con pista alguna, 
			su misión como detective es desifrar el responsable de tal crímen y apresarlo.")
			addObjectRobbed("Tumba del faraón")
			
			addVillain(ArchiveVillain.instance.getRandomVillain)
			]
			
		val case2 = new CaseFile("Tumba Del Faraon") => [
            addCountryRobbed(new Country("Egipto", map))
            addCountryEscape(new Country("Marruecos", map))
            addCountryEscape(new Country("España", map))
            addCountryEscape(new Country("Francia", map))
            addReport("A las 9 de la mañana en la ciudad del Cairo la comunidad científica fue conmovida al darse 
			cuenta del faltante de gran valor! El sarcófago del faraón Usermaatra-Meriamón Ramsés-Heqaiunu, mejor 
			conocido como Ramsés III. El criminal fue muy prolijo y la escena del crimen no contaba con pista alguna, 
			su misión como detective es desifrar el responsable de tal crímen y apresarlo.")
			addObjectRobbed("Tumba del faraón")
			
			addVillain(ArchiveVillain.instance.getRandomVillain)
			]
			
		val case3 = new CaseFile("Tumba Del Faraon") => [
            addCountryRobbed(new Country("Egipto", map))
            addCountryEscape(new Country("Marruecos", map))
            addCountryEscape(new Country("España", map))
            addCountryEscape(new Country("Francia", map))
            addReport("A las 9 de la mañana en la ciudad del Cairo la comunidad científica fue conmovida al darse 
			cuenta del faltante de gran valor! El sarcófago del faraón Usermaatra-Meriamón Ramsés-Heqaiunu, mejor 
			conocido como Ramsés III. El criminal fue muy prolijo y la escena del crimen no contaba con pista alguna, 
			su misión como detective es desifrar el responsable de tal crímen y apresarlo.")
			addObjectRobbed("Tumba del faraón")
			
			addVillain(ArchiveVillain.instance.getRandomVillain)
			]
			
		val case4 = new CaseFile("Tumba Del Faraon") => [
            addCountryRobbed(new Country("Egipto", map))
            addCountryEscape(new Country("Marruecos", map))
            addCountryEscape(new Country("España", map))
            addCountryEscape(new Country("Francia", map))
            addReport("A las 9 de la mañana en la ciudad del Cairo la comunidad científica fue conmovida al darse 
			cuenta del faltante de gran valor! El sarcófago del faraón Usermaatra-Meriamón Ramsés-Heqaiunu, mejor 
			conocido como Ramsés III. El criminal fue muy prolijo y la escena del crimen no contaba con pista alguna, 
			su misión como detective es desifrar el responsable de tal crímen y apresarlo.")
			addObjectRobbed("Tumba del faraón")
			
			addVillain(ArchiveVillain.instance.getRandomVillain)
			]
			
		val case5 = new CaseFile("Tumba Del Faraon") => [
            addCountryRobbed(new Country("Egipto", map))
            addCountryEscape(new Country("Marruecos", map))
            addCountryEscape(new Country("España", map))
            addCountryEscape(new Country("Francia", map))
            addReport("A las 9 de la mañana en la ciudad del Cairo la comunidad científica fue conmovida al darse 
			cuenta del faltante de gran valor! El sarcófago del faraón Usermaatra-Meriamón Ramsés-Heqaiunu, mejor 
			conocido como Ramsés III. El criminal fue muy prolijo y la escena del crimen no contaba con pista alguna, 
			su misión como detective es desifrar el responsable de tal crímen y apresarlo.")
			addObjectRobbed("Tumba del faraón")
			
			addVillain(ArchiveVillain.instance.getRandomVillain)
			]
		
		this.caseFiles = new ArrayList<CaseFile>() => [
			add(case1)
			add(case2)
			add(case3)
			add(case4)
			add(case5)
		]
		
	}
	
	static def getInstance() {
		if (instance == null) {
			instance = new GameFiles
		}
		instance
	}
	
	def List<CaseFile> getCaseFiles(){
		this.caseFiles
	}
}