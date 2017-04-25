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
	Country estadosUnidos = new Country("Estados Unidos")
	Country francia = new Country("Francia")
	
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
    	this.argentina.addCountry(this.estadosUnidos)
    	this.argentina.addPlace(new Bank(new Keeper))
    	this.argentina.addPlace(new Library(new Keeper))
    	this.argentina.addPlace(new Club(new Keeper))
    	
    	this.brasil.addFeature("Bandera verde")
    	this.brasil.addCountry(this.argentina)
    	this.brasil.addCountry(this.chile)
    	this.brasil.addPlace(new Bank(new Keeper))
    	this.brasil.addPlace(new Library(new Keeper))
    	this.brasil.addPlace(new Embassy(new Keeper))
    	
    	this.chile.addFeature("Los carabineros")
    	this.chile.addCountry(this.argentina)
    	this.chile.addCountry(this.brasil)
    	this.chile.addCountry(this.estadosUnidos)
    	this.chile.addPlace(new Bank(new Keeper))
    	this.chile.addPlace(new Library(new Keeper))
    	this.chile.addPlace(new Club(new Keeper))
    	
    	this.estadosUnidos.addFeature("La casa blanca")
    	this.estadosUnidos.addCountry(this.francia)
    	this.estadosUnidos.addCountry(this.argentina)
    	this.estadosUnidos.addCountry(this.chile)
    	this.estadosUnidos.addPlace(new Bank(new Keeper))
    	this.estadosUnidos.addPlace(new Library(new Keeper))
    	this.estadosUnidos.addPlace(new Club(new Keeper))
    	
    	this.francia.addFeature("La Torre Eifel")
    	this.francia.addCountry(this.estadosUnidos)
    	this.francia.addPlace(new Bank(new Keeper))
    	this.francia.addPlace(new Library(new Keeper))
    	this.francia.addPlace(new Club(new Keeper))
    	
    	this.mapamundi.add(this.argentina)
    	this.mapamundi.add(this.brasil)
    	this.mapamundi.add(this.chile)
    	this.mapamundi.add(this.estadosUnidos)
    	this.mapamundi.add(this.francia)
    	
    	this.villanoResponsable = this.acme_list(0)// el villano el gato
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