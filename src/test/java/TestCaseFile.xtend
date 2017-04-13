import junit.framework.TestCase

import java.util.ArrayList

import Game.CaseFile
import Game.Player
import WorldMap.*
import People.*

class TestCaseFile extends TestCase {

    def test_runACase() {

        val v1 = new Villain("El gato", "indefinido")
        val v2 = new Villain("Otro gato", "transexual")

        val arg = new Country("Argentina")

        arg.addPlace(new Bank(new Informant("se fue para peru")))
        arg.addPlace(new Club(new Informant("")))
        arg.addPlace(new Embassy(new Informant("")))

        val per = new Country("Peru")

        per.addPlace(new Bank(new Informant("se fue para el congo")))
        per.addPlace(new Club(new Informant("")))
        per.addPlace(new Embassy(new Informant("")))

        val escapePlan = new ArrayList<Country>();
        escapePlan.add(arg)
        escapePlan.add(per)

        val caso = new CaseFile(v1, escapePlan, "tu vieja", arg)

        val player = new Player(caso, arg)

        player.visit(player.getCountryPlaces().get(0))

        player.travelTo(per)

        assertFalse(caso.checkSuspect(v2))
        assertTrue(caso.checkSuspect(v1))
    }
}