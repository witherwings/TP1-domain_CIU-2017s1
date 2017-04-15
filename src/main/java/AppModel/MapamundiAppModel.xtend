package AppModel

/**
 * Created by lucasf on 4/15/17.
 * Mapamundi con datos de prueba para la vista
 */

import java.util.List
import java.util.ArrayList

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

import WorldMap.*
import People.Informant

@Observable
@Accessors
class MapamundiAppModel {

    List<Country> countries
    Country selectedCountry

    new () {
        val arg = new Country("Argentina") => [
            addFeature("Toman mate")
            addFeature("Hogar de Messi")
            addPlace(new Bank(new Informant("una pista")))
            addPlace(new Embassy(new Informant("una pista")))
            addPlace(new Library(new Informant("una pista")))
        ]
        val usa = new Country("Estados Unidos") => [
            addFeature("Esta Donald Trump")
            addFeature("Super bowl")
            addPlace(new Bank(new Informant("una pista")))
            addPlace(new Embassy(new Informant("una pista")))
            addPlace(new Library(new Informant("una pista")))

        ]
        val nor = new Country("Noruega") => [
            addFeature("Hace frio")
            addFeature("Altas rubias")
            addPlace(new Bank(new Informant("una pista")))
            addPlace(new Embassy(new Informant("una pista")))
            addPlace(new Club(new Informant("una pista")))

        ]

        arg.addCountry(usa)
        usa.addCountry(nor)
        nor.addCountry(arg)

        this.countries = new ArrayList<Country>() => [
            add(arg)
            add(usa)
            add(nor)
        ]

        this.selectedCountry = arg
    }
}