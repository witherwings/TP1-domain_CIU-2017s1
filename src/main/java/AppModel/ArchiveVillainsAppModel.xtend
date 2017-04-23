package AppModel

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import People.Villain
import java.util.List
import java.util.ArrayList

@Observable
@Accessors
class ArchiveVillainsAppModel {
	
	List<Villain> villains
	Villain selectedVillain
	
	
	new(){
		val carmen = new Villain("Carmen Sandiego") =>[
			setGender("Femenino")
			addASign("Pelo rojo")
			addASign("Maneja un convertible")
			addASign("Posee un collar de rubies")
			addASign("Comida favorita: Tacos")
			addAHobbie("Juega tennis")
		]
		val ihor = new Villain("Ihor Ihorovich") =>[
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
			add(ihor)
		]
		
		this.selectedVillain = carmen
	}
	
	def addVillain(People.Villain villain) {
		this.villains.add(villain)
	}
	
}