package Game

import People.Villain

class Player {
	CaseFile newGame = new CaseFile();
	Villain suspect;
	
	def void warrant(Villain suspect){
		this.suspect  = suspect;
		var check = this.newGame.checkSuspect(suspect);
		
		//Luego del check tenemos que ver como devolvemos si gano o no
	} 
}