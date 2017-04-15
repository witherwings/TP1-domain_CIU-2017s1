/**
 * Created by lucasf on 4/15/17.
 */

import org.uqbar.arena.Application
import AppModel.MapamundiAppModel

class MapamundiApplication extends Application {

    override protected createMainWindow() {
        val model = new MapamundiAppModel()
        new MapamundiWindow(this, model)
    }

    def static void main(String[] args) {
        new MapamundiApplication().start()
    }
}