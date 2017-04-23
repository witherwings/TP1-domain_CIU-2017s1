package Game

import java.util.ArrayList

import People.*
import WorldMap.*
import WorldMap.Country
import java.util.List

/**
 * Created by lucasf on 4/12/17.
 */
class GameData {

    val acme_list = new ArrayList<Villain>()
    val mapamundi = new ArrayList<Country>()
    
    Villain v1
    Villain v2
	
	Country argentina = new Country("Argentina")
	Country brasil = new Country("Brasil")
	Country chile = new Country("Chile")
	
	Villain villanoResponsable
	Country paisDelRobo
	List<Country> listaEscape = new ArrayList<Country>()
	CaseFile caso
	
    new() {

		this.v1 = new Villain(
                "El Gato",
                "Masculino",
                #["Tiene pelo blanco"],//, "Vive en el asilo de ancianos"],
                #["Gatear"])//, "Robar saxofones"])
        
        v1.addDestination(this.brasil)
        
        this.v2 = new Villain(
                "R2D2",
                "Indefinido",
                #["Es robotico"],
                #["Vibrar (If you know what i mean)"])
                
        this.acme_list.add(v1)
        this.acme_list.add(v2)
    	
    	// mapamundi
    	this.argentina.addFeature("El mate")
    	this.argentina.addCountry(this.brasil)
    	this.argentina.addCountry(this.chile)
    	this.argentina.addPlace(new Bank(new Keeper))
    	this.argentina.addPlace(new Library(new Keeper))
    	this.argentina.addPlace(new Club(new Keeper))
    	
    	this.brasil.addFeature("Bandera verde")
    	this.brasil.addPlace(new Bank(new Keeper))
    	this.brasil.addPlace(new Library(new Keeper))
    	this.brasil.addPlace(new Embassy(new Keeper))
    	
    	this.chile.addFeature("Los carabineros")
    	this.chile.addCountry(this.brasil)
    	this.chile.addPlace(new Bank(new Keeper))
    	this.chile.addPlace(new Library(new Keeper))
    	this.chile.addPlace(new Club(new Keeper))
    	
    	this.mapamundi.add(this.argentina)
    	this.mapamundi.add(this.brasil)
    	this.mapamundi.add(this.chile)
    	
    	this.villanoResponsable = this.acme_list(0)
    	this.paisDelRobo = this.argentina
    	this.listaEscape.add(this.chile)
    	this.listaEscape.add(this.brasil)
    	
    	this.caso = new CaseFile(this.villanoResponsable, this.listaEscape, "Obelisco", this.paisDelRobo)
    }

    def acme_list(int index) {
        return this.acme_list.get(index)
    }
    
    def getCase(){
    	return this.caso
    }
	
	def getRobCountry() {
		return this.paisDelRobo
	}
	
	def getCountry(String nameCountry) {
		for(Country country : this.mapamundi){
			if(country.name == nameCountry){
				return country
			}
		}
	}
	
}