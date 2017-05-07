package XtRest

import org.uqbar.xtrest.api.XTRest
import Game.GameFiles

class CarmenSandiegoApp {
	
	def static void main(String[] args) {
		var gameFiles = new GameFiles

        XTRest.startInstance(new CarmenSandiegoRestAPI(gameFiles), 9000)
    }
	
}