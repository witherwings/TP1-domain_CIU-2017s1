import Game.CaseFile
import Game.GameData
import Game.Player
import People.Informant
import WorldMap.Bank
import WorldMap.Club
import WorldMap.Country
import WorldMap.Embassy
import java.util.ArrayList
import junit.framework.TestCase
import WorldMap.WorldMap

class TestCaseFile extends TestCase {

    def test_runACase() {

        val data = new GameData()
        val map = new WorldMap()

        val v1 = data.acme_list(0)
        val v2 = data.acme_list(1)

        val arg = new Country("Argentina", map)

        arg.addPlace(new Bank(new Informant("se fue para peru")))
        arg.addPlace(new Club(new Informant("")))
        arg.addPlace(new Embassy(new Informant("")))

        val per = new Country("Peru", map)

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