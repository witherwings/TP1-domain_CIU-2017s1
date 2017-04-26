package Game

import People.Keeper
import People.Villain
import WorldMap.Bank
import WorldMap.Club
import WorldMap.Country
import WorldMap.Embassy
import WorldMap.Library
import WorldMap.WorldMap
import java.util.ArrayList

class GameData {

	val acme_list = new ArrayList<Villain>()

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
		val egt = new Country("Egipto", worldMap) => [
			addFeature("Hace calor")
			addFeature("Mucha arena")
			addFeature("Hay una edificacion muy conocida alli")
			addPlace(new Bank(new Keeper))
			addPlace(new Embassy(new Keeper))
			addPlace(new Library(new Keeper))
		]
		
		val ita = new Country("Italia", worldMap) => [
			addFeature("Sus calles son angostas")
			addFeature("Hogar de la pizza")
			addFeature("Hay una edificacion muy conocida alli")
			addFeature("No querras que erupcione su volcan")
			addPlace(new Embassy(new Keeper))
			addPlace(new Club(new Keeper))
			addPlace(new Bank(new Keeper))
		]
		
		val fra = new Country("Francia", worldMap) => [
			addFeature("Usan mucho perfume")
			addFeature("Hay una edificacion muy conocida alli")
			addFeature("Lugar perfecto para comer baguettes")
			addPlace(new Embassy(new Keeper))
			addPlace(new Bank(new Keeper))
			addPlace(new Library(new Keeper))
		]
		
		val chi = new Country("China", worldMap) => [
			addFeature("Inmensa cultura")
			addFeature("Mucha poblacion")
			addFeature("Hay una edificacion muy conocida alli")
			addFeature("Muy tradicionales")
			addPlace(new Library(new Keeper))
			addPlace(new Bank(new Keeper))
			addPlace(new Club(new Keeper))
		]
		
		val mex = new Country("Mexico", worldMap) => [
			addFeature("Comidas sabrosas")
			addFeature("Gente amable")
			addFeature("Lugar perfecto para tomar aguas frescas")
			addPlace(new Library(new Keeper))
			addPlace(new Embassy(new Keeper))
			addPlace(new Club(new Keeper))
		]
		
		val usa = new Country("Estados Unidos", worldMap) => [
			addFeature("Comidas grasosas")
			addFeature("Lugar perfecto para conseguir armas")
			addFeature("Libertad al alcance de la mano")
			addFeature("Cuna de la obesidad")
			addPlace(new Bank(new Keeper))
			addPlace(new Library(new Keeper))
			addPlace(new Embassy(new Keeper))
		]
		val mar = new Country("Marruecos", worldMap) => [
			addFeature("Hermosas telas")
			addFeature("Gente amable")
			addFeature("Hace calor")
			addFeature("Muy tradicionales")
			addPlace(new Club(new Keeper))
			addPlace(new Embassy(new Keeper))
			addPlace(new Bank(new Keeper))
		]
		val jap = new Country("Japon", worldMap) => [
			addFeature("Muy tradiconales")
			addFeature("Grandes edificaciones")
			addFeature("Mucha poblacion")
			addPlace(new Library(new Keeper))
			addPlace(new Bank(new Keeper))
			addPlace(new Club(new Keeper))
		]
		val ale = new Country("Alemania", worldMap) => [
			addFeature("Gente amable")
			addFeature("Idioma dificil de aprender")
			addFeature("Grandes edificaciones")
			addPlace(new Embassy(new Keeper))
			addPlace(new Bank(new Keeper))
			addPlace(new Library(new Keeper))
		]
		val bul = new Country("Bulgaria", worldMap) => [
			addFeature("Comidas sabrosas")
			addFeature("Gente amable")
			addFeature("Lugar perfecto para comer chocolate")
			addFeature("Hermosos paisajes")
			addPlace(new Bank(new Keeper))
			addPlace(new Library(new Keeper))
			addPlace(new Club(new Keeper))
		]
		val per = new Country("Peru", worldMap) => [
			addFeature("Hay una edificacion muy conocida alli")
			addFeature("Hermosos paisajes")
			addFeature("Gente amable")
			addFeature("Sus calles son angostas")
			addPlace(new Embassy(new Keeper))
			addPlace(new Bank(new Keeper))
			addPlace(new Library(new Keeper))
		]
		
		egt.addCountry(mar)
		egt.addCountry(ita)
		egt.addCountry(chi)
		ita.addCountry(fra)
		ita.addCountry(ale)
		ita.addCountry(usa)
		fra.addCountry(chi)
		fra.addCountry(bul)
		fra.addCountry(ale)
		chi.addCountry(jap)
		chi.addCountry(per)
		chi.addCountry(mex)
		mex.addCountry(usa)
		mex.addCountry(jap)
		mex.addCountry(per)
		
		usa.addCountry(per)
		usa.addCountry(mar)
		usa.addCountry(ale)
		mar.addCountry(fra)
		mar.addCountry(mex)
		mar.addCountry(per)
		jap.addCountry(usa)
		jap.addCountry(bul)
		jap.addCountry(ita)
		ale.addCountry(mex)
		ale.addCountry(egt)
		ale.addCountry(mar)
		bul.addCountry(usa)
		bul.addCountry(per)
		bul.addCountry(egt)
		per.addCountry(chi)
		per.addCountry(jap)
		per.addCountry(ale)

		return new ArrayList<Country>() => [
			add(egt)
			add(ita)
			add(fra)
			add(chi)
			add(mex)
			add(usa)
			add(mar)
			add(jap)
			add(ale)
			add(bul)
			add(per)
			
		]
	}
}
