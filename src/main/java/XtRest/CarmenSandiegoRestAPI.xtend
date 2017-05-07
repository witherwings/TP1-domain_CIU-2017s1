package XtRest

import Game.GameFiles
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import java.util.ArrayList

@Controller
class CarmenSandiegoRestAPI {
	
	extension JSONUtils = new JSONUtils

	GameFiles files
	
	new(GameFiles files) {
		this.files = files
	}
	
	@Get("/villanos")
    def getVillains(String string) {
        response.contentType = ContentType.APPLICATION_JSON
       	ok(this.getMiniVillains(string).toJson)
    }
	
	def getMiniVillains(String string) {
		val listV = this.files.searchVillains(string)
		val minis = new ArrayList()
		
		for (i : 0 ..< listV.size) {
			minis.add(listV.get(i).getMiniVillain)
		}
		
		return minis
	}
	
}