package Game

import WorldMap.CommonPlace
import WorldMap.Country
import People.Villain
import java.util.ArrayList
import java.util.List

class Player {
	CaseFile game;
	CommonPlace place
	Country country
	
	Country prevCountry = null
	List<Country> routePlayer = new ArrayList<Country>()

	new (CaseFile game, Country startCountry) {
		this.game = game
		this.country = startCountry
	}
	
	def String getPlaceName(){
		return this.place.getPlaceName()
	}
	
	def String getCountryName() {
		return this.country.name
	}
	
	def void warrant(Villain suspect){
		var check = this.game.checkSuspect(suspect);
		
		//Luego del check tenemos que ver como devolvemos si gano o no
	}

	def visit(int place) {
		this.place = this.country.getPlace(place)
	}

	def getCountryPlaces() {
		return this.country.getPlaces()
	}

	def travelTo(Country c) {
		if(this.country.isConnectedTo(c)) {
			this.prevCountry = this.country
			this.routePlayer.add(this.prevCountry)
			this.country = c
			this.place = null
		} else {
			println("Este pais no tiene conexion con el actual, elige otro!")
			// tirrar esesion!
		}	
	}
	
	def getInfo() {
		if(this.country.getThisTheVillain()){
			this.game.responsible.takeAction()
			return this.place.giveInformation()
		}else{
			return this.place.giveInformation()
		}
	}
	
}