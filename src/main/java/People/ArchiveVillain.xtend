package People

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.List
import java.util.ArrayList

@Observable
@Accessors
class ArchiveVillain {
	
	List<Villain> villains
	
	private static ArchiveVillain instance = null
	
	new(){
		val carmen = new Villain("Carmen Sandiego") =>[
			setGender("Femenino")
			addASign("Pelo rojo")
			addASign("Maneja un convertible")
			addASign("Posee un collar de rubies")
			addASign("Comida favorita: Tacos")
			addAHobbie("Juega tennis")
		]
		val igor = new Villain("Igor Igorovich") =>[
			setGender("Masculino")
			addASign("Pelo rubio")
			addASign("Maneja limosina")
			addASign("Tatuaje en el brazo")
			addASign("Habla ucraniano")
			addAHobbie("Juega croquet")
			addAHobbie("Le gusta cocinar")
		]
		
		this.villains = new ArrayList<Villain>() =>[
			add(carmen)
			add(igor)
		]
		
	}
	
	static def getInstance() {
		if (instance == null) {
			instance = new ArchiveVillain
		}
		instance
	}
	
	def List<Villain> getVillains(){
		this.villains
	}
	
	def addNewVillain(Villain villain) {
		this.villains.add(villain)
	}
	
}