package WorldMap;

import People.Occupant;

@SuppressWarnings("all")
public abstract class CommonPlace {
  private String information;
  
  private Occupant occupant;
  
  public abstract String giveInformation();
}
