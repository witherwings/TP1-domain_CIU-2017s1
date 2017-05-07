package XtRest

import Game.GameFiles
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import java.util.ArrayList
import org.uqbar.xtrest.api.annotation.Delete
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Body
import People.Villain
import org.uqbar.commons.model.UserException
import com.fasterxml.jackson.databind.exc.UnrecognizedPropertyException
import org.uqbar.xtrest.api.annotation.Put
import WorldMap.Country

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
    
    @Get("/villano/:id")
    def getVillainById() {
        response.contentType = ContentType.APPLICATION_JSON
        try {        	
            var villain = this.files.getVillainByID(Integer.valueOf(id))
            if (villain === null) {
            	notFound(getErrorJson("No existe villano con ese id"))
            } else {
            	ok(new StandardVillain(villain).toJson)
            }
        }
        catch (NumberFormatException ex) {
        	badRequest(getErrorJson("El id debe ser un numero entero"))
        }
    }
    
    @Put('/villano/:id')
    def updateVillainById(@Body String body){
    	response.contentType = ContentType.APPLICATION_JSON
    	try{
    		val villain = this.files.getVillainByID(Integer.valueOf(id))
    		val Villain updVillain = body.fromJson(Villain)
    		if (villain === null) {
            	notFound(getErrorJson("No existe villano con ese id"))
            } else {
            	this.files.updateVillainByID(Integer.valueOf(id),updVillain)
            	ok()
            }
    	}
    	catch (NumberFormatException ex) {
        	badRequest(getErrorJson("El id debe ser un numero entero"))
        }
    }
    
    @Delete('/villano/:id')
    def deleteVillainById() {
        response.contentType = ContentType.APPLICATION_JSON
        try {
            this.files.deleteVillain(Integer.valueOf(id))
            ok()
        }
        catch (NumberFormatException ex) {
        	badRequest(getErrorJson("El id debe ser un numero entero"))
        }
    }
    
    @Post("/villano")
    def createVillain(@Body String body) {
        response.contentType = ContentType.APPLICATION_JSON
        try {
	        val Villain villain = body.fromJson(Villain)
	        try {
				this.files.setNewVillain(villain)
				ok()	        	
	        } 
	        catch (UserException exception) {
	        	badRequest(getErrorJson(exception.message))
	        }
        } 
        catch (UnrecognizedPropertyException exception) {
        	badRequest(getErrorJson("El body debe ser un Villano valido"))
        }
    }
	
	def getMiniVillains(String string) {
		val listV = this.files.searchVillains(string)
		val minis = new ArrayList()
		
		for (i : 0 ..< listV.size) {
			minis.add(listV.get(i).getMiniVillain)
		}
		
		return minis
	}
	
	/* PAISES!!! */
	
	@Get("/paises")
    def getCountries(String string) {
        response.contentType = ContentType.APPLICATION_JSON
       	ok(this.getMiniCountries(string).toJson)
    }
    
    @Get("/pais/:id")
	def getCountryById() {
	    response.contentType = ContentType.APPLICATION_JSON
	    try {        	
	        var country = this.files.getCountryByID(Integer.valueOf(id))
	        if (country === null) {
	            notFound(getErrorJson("No existe pais con ese id"))
	        } else {
	            ok(new StandardCountry(country).toJson)
	        }
	    }
	    catch (NumberFormatException ex) {
	        badRequest(getErrorJson("El id debe ser un numero entero"))
	    }
	}
	
	@Put('/pais/:id')
	def updateCountryById(@Body String body){
	    response.contentType = ContentType.APPLICATION_JSON
	    try{
	        val country = this.files.getCountryByID(Integer.valueOf(id))
	        val Country updCountry = body.fromJson(Country)
	        if (country === null) {
	            notFound(getErrorJson("No existe pais con ese id"))
	        } else {
	            this.files.updateCountryByID(Integer.valueOf(id),updCountry)
	            ok()
	        }
	    }
	    catch (NumberFormatException ex) {
	        badRequest(getErrorJson("El id debe ser un numero entero"))
	    }
	}
	
	@Delete('/pais/:id')
	def deleteCountryById() {
	    response.contentType = ContentType.APPLICATION_JSON
	    try {
	        this.files.deleteCountry(Integer.valueOf(id))
	        ok()
	    }
	    catch (NumberFormatException ex) {
	        badRequest(getErrorJson("El id debe ser un numero entero"))
	    }
	}
	
	@Post("/pais")
	def createCountry(@Body String body) {
	    response.contentType = ContentType.APPLICATION_JSON
	    try {
	        val Country country = body.fromJson(Country)
	        try {
	            this.files.setNewCountry(country)
	            ok()	        	
	        } 
	        catch (UserException exception) {
	            badRequest(getErrorJson(exception.message))
	        }
	    } 
	    catch (UnrecognizedPropertyException exception) {
	        badRequest(getErrorJson("El body debe ser un Pais valido"))
	    }
	}
	
	def getMiniCountries(String string) {
		val listV = this.files.searchCountries(string)
		val minis = new ArrayList()
		
		for (i : 0 ..< listV.size) {
			minis.add(listV.get(i).getMiniCountry)
		}
		
		return minis
	}
	
	/* AUX */
    
    private def getErrorJson(String message) {
        '{ "error": "' + message + '" }'
    }
	
}