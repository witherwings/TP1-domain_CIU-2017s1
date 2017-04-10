package People;

import People.Occupant;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("all")
public class Villain extends Occupant {
  private String name;
  
  private String gender;
  
  private List<String> signs;
  
  private List<String> hobbies;
  
  public Villain(final String name, final String gender) {
    this.name = name;
    this.gender = gender;
    ArrayList<String> _arrayList = new ArrayList<String>();
    this.signs = _arrayList;
    ArrayList<String> _arrayList_1 = new ArrayList<String>();
    this.hobbies = _arrayList_1;
  }
  
  public void addSign(final String newSign) {
    this.signs.add(newSign);
  }
  
  public void addHobbie(final String newHobbie) {
    this.hobbies.add(newHobbie);
  }
  
  @Override
  public void takeAction() {
  }
}
