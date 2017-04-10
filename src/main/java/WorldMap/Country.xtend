package WorldMap

import java.util.List
import java.util.ArrayList

class Country {
	String name;
	List<String> features;
	List<Country> connectedCountries;
	//There are only 3 places per country
	List<CommonPlace> places;
	
	new (String name)
	{
		this.name = name;
		this.connectedCountries = new ArrayList();
		this.places = new ArrayList();
	}
	
	def void addCountry(Country newConnection)
	{
		this.connectedCountries.add(newConnection);
	}
	
	def void addPlace(CommonPlace newPlace)
	{
		if(places.size < 3)
		{
			this.places.add(newPlace);
		}
		else
		{
			//throw ("No more places allowed");
		}
	}
}