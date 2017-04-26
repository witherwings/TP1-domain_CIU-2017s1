package People

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import utils.Randoms

@Observable
@Accessors
class ArchiveVillain {

	List<Villain> villains

	private static ArchiveVillain instance = null

	new() {
		val carmen = new Villain("Carmen Sandiego") => [
			setGender("Femenino")
			addASign("Pelo rojo")
			addASign("Maneja un convertible")
			addASign("Posee un collar de rubies")
			addASign("Comida favorita: Tacos")
			addAHobbie("Juega tennis")
			addAHobbie("Eludir a la policia")
		]
		val igor = new Villain("Igor Igorovich") => [
			setGender("Masculino")
			addASign("Pelo rubio")
			addASign("Maneja limosina")
			addASign("Tatuaje en el brazo")
			addASign("Habla ucraniano")
			addAHobbie("Juega croquet")
			addAHobbie("Le gusta cocinar")
		]
<<<<<<< Updated upstream

		val alcapone = new Villain("Al Capone") => []
		val betty = new Villain("Betty Chiars") => []
		val vic = new Villain("Vic La Mancha") => []

		this.villains = new ArrayList<Villain>() => [
=======
		
		val alcapone = new Villain("Al Capone") =>[
			setGender("Masculino")
			addASign("Cicatriz en el lado izquierdo")
			addASign("Maneja un auto negro")
			addASign("Tiene secuaces")
			addAHobbie("Tirar personas al rio atadas a bloques de cemento")
			addAHobbie("Practicas de tiro")
		]
		val betty = new Villain("Betty Chiars") =>[
			setGender("Femenino")
			addASign("Pelo rubio")
			addASign("Le gusta el deporte")
			addASign("Atractiva")
			addAHobbie("Hace yoga")
			addAHobbie("Practica artes marciales")
		]
		val vic = new Villain("Vic La Mancha") =>[
			setGender("Masculino")
			addASign("Tiene olor a aceite de autos")
			addASign("Siempre lleva un cuchillo en su cinturon")
			addASign("Alto y flaco")
			addAHobbie("Tallar arboles")
			addAHobbie("Juega tennis")
		]
		
		this.villains = new ArrayList<Villain>() =>[
>>>>>>> Stashed changes
			add(carmen)
			add(igor)
			add(alcapone)
			add(betty)
			add(vic)
		]
	}

	static def getInstance() {
		if (instance == null) {
			instance = new ArchiveVillain
		}
		instance
	}

	def List<Villain> getVillains() {
		this.villains
	}

	def addNewVillain(Villain villain) {
		this.villains.add(villain)
	}

	def getRandomVillain() {
		this.villains.get(Randoms.randomBetween(0, 4))
	}

}
