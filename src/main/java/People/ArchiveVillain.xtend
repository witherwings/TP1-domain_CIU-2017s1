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
			setID(1)
			setGender("Femenino")
			addASign("tiene pelo rojo")
			addASign("maneja un convertible")
			addASign("posee un collar de rubies")
			addASign("su comida favorita son los tacos")
			addAHobbie("juega tennis")
			addAHobbie("le gusta eludir a la policia")
		]
		val igor = new Villain("Igor Igorovich") => [
			setID(2)
			setGender("Masculino")
			addASign("tiene pelo rubio")
			addASign("maneja limosina")
			addASign("tiene un tatuaje en el brazo")
			addASign("creo que habla ucraniano")
			addAHobbie("le gusta jugar croquet")
			addAHobbie("le gusta cocinar")
		]		
		val alcapone = new Villain("Al Capone") =>[
			setID(3)
			setGender("Masculino")
			addASign("tiene una cicatriz en el lado izquierdo de la cara")
			addASign("maneja un auto negro")
			addASign("tiene secuaces")
			addAHobbie("ama tirar personas al rio atadas a bloques de cemento")
			addAHobbie("realiza regulares practicas de tiro")
		]
		val betty = new Villain("Betty Chiars") =>[
			setID(4)
			setGender("Femenino")
			addASign("tiene pelo rubio")
			addASign("le gusta el deporte")
			addASign("es atractiva")
			addAHobbie("hace yoga")
			addAHobbie("practica artes marciales")
		]
		val vic = new Villain("Vic La Mancha") =>[
			setID(5)
			setGender("Masculino")
			addASign("tiene olor a aceite de autos")
			addASign("siempre lleva un cuchillo en su cinturon")
			addASign("es alto y flaco")
			addAHobbie("le gusta tallar arboles")
			addAHobbie("juega tennis")
		]
		
		this.villains = new ArrayList<Villain>() =>[
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
