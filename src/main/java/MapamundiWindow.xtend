/**
 * Created by lucasf on 4/15/17.
 */

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel

import AppModel.MapamundiAppModel


class MapamundiWindow extends SimpleWindow<MapamundiAppModel> {

    new(WindowOwner parent, MapamundiAppModel model) {
        super(parent, model)
    }

    override protected addActions(Panel actionsPanel) {
        //no queremos usar este template default
    }

    override protected createFormPanel(Panel mainPanel) {
        //no queremos usar este template default
    }

    override createMainTemplate(Panel mainPanel) {

    }
}