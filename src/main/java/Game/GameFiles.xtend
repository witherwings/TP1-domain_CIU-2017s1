package Game

import People.ArchiveVillain
import WorldMap.WorldMap
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.apache.commons.lang.StringUtils
import People.Villain
import org.uqbar.commons.model.UserException

@Observable
@Accessors
class GameFiles {

	List<CaseFile> caseFiles
	WorldMap map = WorldMap.instance
	

	private static GameFiles instance = null

	new() {
		val case1 = new CaseFile("Tumba Del Faraon") => [
			addCountryRobbed(map.getCountryByName("Egipto"))
			addReport("A las 9 de la mañana en la ciudad del Cairo la comunidad científica fue conmovida al darse 
			cuenta del faltante de gran valor! El sarcófago del faraón Usermaatra-Meriamón Ramsés-Heqaiunu, mejor 
			conocido como Ramsés III. El criminal fue muy prolijo y la escena del crimen no contaba con pista alguna, 
			su misión como detective es desifrar el responsable de tal crímen y apresarlo.")
			addObjectRobbed("Tumba del faraón")

			addVillain(ArchiveVillain.instance.getRandomVillain)
			setEscapeRoute()
		]

		val case2 = new CaseFile("La Pantera Rosa") => [
			addCountryRobbed(map.getCountryByName("Italia"))
			addReport("En el dia de ayer, cercano a la medianoche, se produjo uno de los robos mas grandes de los 
			ultimos tiempos: el robo del gran diamante Pantera Rosa directamente de las vitrinas del salon de trofeos
			de Vicenzo Santorini. No se encontraron huellas ni residuos en la escena. Necesitamos tu ayuda para 
			apresar al responsable")
			addObjectRobbed("Diamante Pantera Rosa")

			addVillain(ArchiveVillain.instance.getRandomVillain)
			setEscapeRoute()
			
		]

		val case3 = new CaseFile("Framed") => [
			addCountryRobbed(map.getCountryByName("Francia"))
			addReport("Luego de un supuesto incendio en el museo de Louvre esta mañana, 15 pinturas de extremado
			valor han desaparecido de su lugares de reposo, entre ellas obras como la Mona Lisa de Leonardo Da Vinci.
			En la escena se encontro a Francois Tolouse, quien clama no haber tenido que ver absolutamente nada con
			el robo; que fue secuestrado de su mansion la semana pasada, y desperto esta mañana en el museo luego del
			robo. Tu trabajo sera determinar si Tolouse esta diciendo la verdad y hay alguien mas detras de este crimen.")
			addObjectRobbed("15 pinturas de valor")

			addVillain(ArchiveVillain.instance.getRandomVillain)
			setEscapeRoute()
		]

		val case4 = new CaseFile("Buda no estara contento") => [
			addCountryRobbed(map.getCountryByName("China"))
			addReport("La Interpol se ha puesto en contacto con nosotros para que les demos soporte con un caso que
			sucedio esta semana. La Guardia Imperial de Jade ha desaparecido por completo!. La coleccion contaba con mas
			de 250 estatuas de tamaño real, esculpidas en jade puro. La misma se encontraba dentro de un sitio protegido
			en las afueras de Shanghai, el cual fue atacado el pasado Miercoles. Nadie recuerda nada del ataque, ni
			cuantos captores fueron, pero debemos imaginar que quien sea, no trabajo solo. Sin embargo, la Interpol 
			tiene la sospecha que solo una persona esta detras de esto, manejando todo desde las sombras. Debemos
			averiguar quien fue.")
			addObjectRobbed("La Guardia Imperial de Jade")

			addVillain(ArchiveVillain.instance.getRandomVillain)
			setEscapeRoute()
		]

		val case5 = new CaseFile("Quetzacoatl") => [
			addCountryRobbed(map.getCountryByName("Mexico"))
			addReport("El gran papiro de Quetzacoatl ha desaparecido!. El papiro contenia informacion privilegiada
			acerca de la vida de los escribas y sacerdotes del gran dios Azteca. Se cree que incluso contenia escondido
			un mapa para acceder a la Ciudad Oculta, un lugar que segun las leyendas, esta repleta de tesoros. 
			Debemos averiguar quien robo el papiro de las manos de Guadalupe Valdez, encargada del sitio arqueologico
			del lugar. Segun ella, el papiro se encontraba en la mesa de su carpa, pero al despertar el dia de ayer,
			el mismo habia desaparecido. Nadie de su equipo vio nada, asi que no contamos con pistas al respecto.")
			addObjectRobbed("El Papiro de Quetzacoatl")

			addVillain(ArchiveVillain.instance.getRandomVillain)
			setEscapeRoute()
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

	def List<CaseFile> getCaseFiles() {
		this.caseFiles
	}
	
	def searchVillains(String substring) {
		if (StringUtils.isBlank(substring)) {
			this.caseFiles.get(0).archives.getVillains()
		} else {
			this.caseFiles.get(0).archives.getVillains().filter[ it.name.toLowerCase.contains(substring.toLowerCase) ].toList			
		}
	}
	
	def getVillainByID(Integer id) {
		caseFiles.get(0).archives.getVillains().findFirst[ it.id == id ]
	}
	
	def deleteVillain(Integer id) {
		caseFiles.get(0).archives.getVillains().removeIf[ it.id == id ]
	}
	
	def setNewVillain(Villain villain) {
		if (!villain.completeData()) {
			throw new UserException("El villano debe estar completo respecto a sus datos");
		}
		caseFiles.get(0).archives.getVillains().add(villain)
	}
	
	def updateVillainByID(Integer id, Villain villain) {
		this.getVillainByID(id).updateV(villain)
	}
	
}
