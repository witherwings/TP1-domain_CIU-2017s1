package Game;

import Game.CaseFile;
import People.Villain;

@SuppressWarnings("all")
public class Player {
  private CaseFile newGame = new CaseFile();
  
  private Villain suspect;
  
  public void warrant(final Villain suspect) {
    this.suspect = suspect;
    boolean check = this.newGame.checkSuspect(suspect);
  }
}
