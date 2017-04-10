package WorldMap;

import WorldMap.CommonPlace;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("all")
public class Country {
  private String name;
  
  private List<String> features;
  
  private List<Country> connectedCountries;
  
  private List<CommonPlace> places;
  
  public Country(final String name) {
    this.name = name;
    ArrayList<Country> _arrayList = new ArrayList<Country>();
    this.connectedCountries = _arrayList;
    ArrayList<CommonPlace> _arrayList_1 = new ArrayList<CommonPlace>();
    this.places = _arrayList_1;
  }
  
  public void addCountry(final Country newConnection) {
    this.connectedCountries.add(newConnection);
  }
  
  public void addPlace(final CommonPlace newPlace) {
    int _size = this.places.size();
    boolean _lessThan = (_size < 3);
    if (_lessThan) {
      this.places.add(newPlace);
    } else {
    }
  }
}
