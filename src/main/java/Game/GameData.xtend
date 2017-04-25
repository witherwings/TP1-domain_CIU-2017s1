package Game

import java.util.ArrayList

import People.*
import WorldMap.*

class GameData {

	val acme_list = new ArrayList<Villain>()
	val mapamundi = new ArrayList<Country>()

	new() {
		// acme_list
		this.acme_list.add(new Villain("El Gato", "Masculino", #["Tiene pelo blanco", "Vive en el asilo de ancianos"],
			#["Gatear", "Robar saxofones"]))

		this.acme_list.add(new Villain("R2D2", "Indefinido", #["Es robotico"], #["Vibrar (If you know what i mean)"]))

	// mapamundi
	// COMPLETAR
	}

	def acme_list(int index) {
		return this.acme_list.get(index)
	}

	def static buildCountries(WorldMap worldMap) {
		val arg = new Country("Argentina", worldMap) => [
			addFeature("Toman mate")
			addFeature("Hogar de Messi")
			addPlace(new Bank(new Informant("una pista")))
			addPlace(new Embassy(new Informant("una pista")))
			addPlace(new Library(new Informant("una pista")))
		]
		val usa = new Country("Estados Unidos", worldMap) => [
			addFeature("Esta Donald Trump")
			addFeature("Super bowl")
			addPlace(new Bank(new Informant("una pista")))
			addPlace(new Embassy(new Informant("una pista")))
			addPlace(new Library(new Informant("una pista")))

		]
		val nor = new Country("Noruega", worldMap) => [
			addFeature("Hace frio")
			addFeature("Altas rubias")
			addPlace(new Bank(new Informant("una pista")))
			addPlace(new Embassy(new Informant("una pista")))
			addPlace(new Club(new Informant("una pista")))
		]
		val egt = new Country("Egipto", worldMap) => [
			addFeature("Toman mate")
			addFeature("Hogar de Messi")
			addPlace(new Bank(new Informant("una pista")))
			addPlace(new Embassy(new Informant("una pista")))
			addPlace(new Library(new Informant("una pista")))
		]

		arg.addCountry(usa)
		usa.addCountry(nor)
		nor.addCountry(arg)

		return new ArrayList<Country>() => [
			add(arg)
			add(usa)
			add(nor)
			add(egt)
		]
	}
}
