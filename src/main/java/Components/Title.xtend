package Components

/**
 * Created by lucasf on 4/15/17.
 */

import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel

class Title extends Label {

    new(Panel container, String text, Integer fontSize) {
        super(container)
        this.text = text
        this.fontSize = fontSize
    }

    new(Panel container, String text) {
        super(container)
        this.text = text
        this.fontSize = 14
    }
}