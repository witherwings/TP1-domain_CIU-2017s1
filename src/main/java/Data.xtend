import java.util.ArrayList

import People.*
import WorldMap.*

/**
 * Created by lucasf on 4/12/17.
 */
class Data {

    val acme_list = new ArrayList<Villain>()
    val mapamundi = new ArrayList<Country>()

    new() {
        // acme_list
        this.acme_list.add(new Villain(
                "El Gato",
                "Masculino",
                #["Tiene pelo blanco", "Vive en el asilo de ancianos"],
                #["Gatear", "Robar saxofones"]))

        this.acme_list.add(new Villain(
                "R2D2",
                "Indefinido",
                #["Es robotico"],
                #["Vibrar (If you know what i mean)"]))

        // mapamundi
        // COMPLETAR
    }
}