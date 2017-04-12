package Game

import WorldMap.CommonPlace
import WorldMap.Country
import People.Villain

class Player {
	CaseFile game;
	CommonPlace place
	Country country

	new (CaseFile game, Country startCountry) {
		this.game = game
		this.country = startCountry
	}
	
	def void warrant(Villain suspect){
		var check = this.game.checkSuspect(suspect);
		
		//Luego del check tenemos que ver como devolvemos si gano o no
	}

	def visit(CommonPlace place) {
		this.place = place
	}

	def getCountryPlaces() {
		return this.country.getPlaces()
	}

	def travelTo(Country c) {
		if (this.country.isConnectedTo(c)) {
			this.country = c
			this.place = null
		} else {
			// tirrar esesion!
		}
	}
}