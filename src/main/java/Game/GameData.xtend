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
			addFeature("hace calor")
			addFeature("hay mucha arena")
			addFeature("hay una edificacion muy conocida alli")
			addPlace(new Bank(new Keeper))
			addPlace(new Embassy(new Keeper))
			addPlace(new Library(new Keeper))
		]
		
		val ita = new Country("Italia", worldMap) => [
			addFeature("tiene calles que son muy angostas")
			addFeature("es el hogar de la pizza")
			addFeature("hay una edificacion muy conocida alli")
			addFeature("no querras que erupcione su volcan")
			addPlace(new Embassy(new Keeper))
			addPlace(new Club(new Keeper))
			addPlace(new Bank(new Keeper))
		]
		
		val fra = new Country("Francia", worldMap) => [
			addFeature("las personas usan mucho perfume")
			addFeature("hay una edificacion muy conocida alli")
			addFeature("es el lugar perfecto para comer baguettes")
			addPlace(new Embassy(new Keeper))
			addPlace(new Bank(new Keeper))
			addPlace(new Library(new Keeper))
		]
		
		val chi = new Country("China", worldMap) => [
			addFeature("posee una inmensa cultura")
			addFeature("tiene mucha poblacion")
			addFeature("hay una edificacion muy conocida alli")
			addFeature("son personas muy tradicionales")
			addPlace(new Library(new Keeper))
			addPlace(new Bank(new Keeper))
			addPlace(new Club(new Keeper))
		]
		
		val mex = new Country("Mexico", worldMap) => [
			addFeature("tienen comidas sabrosas")
			addFeature("hay gente amable")
			addFeature("es el lugar perfecto para tomar aguas frescas")
			addPlace(new Library(new Keeper))
			addPlace(new Embassy(new Keeper))
			addPlace(new Club(new Keeper))
		]
		
		val usa = new Country("Estados Unidos", worldMap) => [
			addFeature("tienen comidas grasosas")
			addFeature("es el lugar perfecto para conseguir armas")
			addFeature("podes conseguir libertad al alcance de la mano")
			addFeature("es la cuna de la obesidad")
			addPlace(new Bank(new Keeper))
			addPlace(new Library(new Keeper))
			addPlace(new Embassy(new Keeper))
		]
		val mar = new Country("Marruecos", worldMap) => [
			addFeature("hacen hermosas telas")
			addFeature("hay gente amable")
			addFeature("hace calor")
			addFeature("son personas muy tradicionales")
			addPlace(new Club(new Keeper))
			addPlace(new Embassy(new Keeper))
			addPlace(new Bank(new Keeper))
		]
		val jap = new Country("Japon", worldMap) => [
			addFeature("son perosnas muy tradiconales")
			addFeature("posee grandes edificaciones")
			addFeature("tiene mucha poblacion")
			addPlace(new Library(new Keeper))
			addPlace(new Bank(new Keeper))
			addPlace(new Club(new Keeper))
		]
		val ale = new Country("Alemania", worldMap) => [
			addFeature("hay gente amable")
			addFeature("su idioma dificil de aprender")
			addFeature("posee grandes edificaciones")
			addPlace(new Embassy(new Keeper))
			addPlace(new Bank(new Keeper))
			addPlace(new Library(new Keeper))
		]
		val bul = new Country("Bulgaria", worldMap) => [
			addFeature("tienen comidas sabrosas")
			addFeature("hay gente amable")
			addFeature("es el lugar perfecto para comer chocolate")
			addFeature("cuenta con hermosos paisajes")
			addPlace(new Bank(new Keeper))
			addPlace(new Library(new Keeper))
			addPlace(new Club(new Keeper))
		]
		val per = new Country("Peru", worldMap) => [
			addFeature("hay una edificacion muy conocida alli")
			addFeature("cuenta con hermosos paisajes")
			addFeature("hay gente amable")
			addFeature("tiene calles que son muy angostas")
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
