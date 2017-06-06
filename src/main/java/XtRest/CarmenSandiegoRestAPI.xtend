package XtRest

import Game.GameFiles
import com.fasterxml.jackson.databind.exc.UnrecognizedPropertyException
import java.util.ArrayList
import org.uqbar.commons.model.UserException
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Delete
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import Game.CaseFile

@Controller
class CarmenSandiegoRestAPI {
	
	extension JSONUtils = new JSONUtils

	GameFiles files
	CaseFile selectedCase
	
	new(GameFiles files) {
		this.files = files
	}
	
	//-----------------------------------------------------------------------------------//
	/* JUEGO!!! */
	//-----------------------------------------------------------------------------------//
	
	@Post("/iniciarJuego")
	def startGame(){
		response.contentType = ContentType.APPLICATION_JSON
		this.selectedCase = this.files.randomCase()
		ok(new StandardCase(this.selectedCase).toJson)
	}
	
	@Get("/pistaDelLugar")
	def getClue(String place, String caseID){
		response.contentType = ContentType.APPLICATION_JSON
		val String result = this.selectedCase.currentCountry.getClueFromPlace(place, this.selectedCase)
		if(result === null)
			notFound(getErrorJson("No existe ese lugar en el pais actual"))
		else
			ok(result.toJson)
	}
	
	@Post("/emitirOrdenPara")
    def createWarrantTo(@Body String body) {
    	response.contentType = ContentType.APPLICATION_JSON
        try {
	        val Warrant w = body.fromJson(Warrant)
	        try {
	        	this.files.setWarrant(w)
				ok("Orden emitida correctamente".toJson)	        	      
	        } 
	        catch (UserException exception) {
	        	badRequest(getErrorJson(exception.message))
	        }
        } 
        catch (UnrecognizedPropertyException exception) {
        	badRequest(getErrorJson("El body debe ser un Orden de arresto"))
        }
    }
    
    @Post("/viajar")
    def travel(@Body String body){
    	response.contentType = ContentType.APPLICATION_JSON
    	try{
    		val TravelCountry t = body.fromJson(TravelCountry)
    		val current = this.files.getCountryByID(t.destinoId)
    		if (!this.selectedCase.canTravel(current)) {
    			notFound(getErrorJson("No existe pais conectado con ese id"))
    		}
    		else{
    			this.selectedCase.lastCountry = this.selectedCase.currentCountry
    			this.selectedCase.currentCountry = current
    			this.selectedCase.criminalDestinations.add(this.selectedCase.lastCountry)
    			ok(new StandardCase(this.selectedCase).toJson)	
    		}    		
    	}
    	catch(UnrecognizedPropertyException exception) {
        	badRequest(getErrorJson("El body debe ser un destino valido"))
        }
    }
	
	//-----------------------------------------------------------------------------------//
	/* VILLANOS!!! */
	//-----------------------------------------------------------------------------------//
	
	@Get("/villanos")
    def getVillains(String string) {
        response.contentType = ContentType.APPLICATION_JSON
       	ok(this.getMiniVillains(string).toJson)
    }
    
    @Get("/villanos/:id")
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
    
    @Put('/villanos/:id')
    def updateVillainById(@Body String body){
    	response.contentType = ContentType.APPLICATION_JSON
    	try{
    		val villain = this.files.getVillainByID(Integer.valueOf(id))
    		val StandardVillain updVillain = body.fromJson(StandardVillain)
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
    
    @Delete('/villanos/:id')
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
    
    @Post("/villanos")
    def createVillain(@Body String body) {
        response.contentType = ContentType.APPLICATION_JSON
        try {
	        val StandardVillain sv = body.fromJson(StandardVillain)
	        try {
				this.files.setNewVillain(sv.transform)
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
	
	//-----------------------------------------------------------------------------------//
	/* PAISES!!! */
	//-----------------------------------------------------------------------------------//
	
	@Get("/paises")
    def getCountries(String string) {
        response.contentType = ContentType.APPLICATION_JSON
       	ok(this.getMiniCountries(string).toJson)
    }
    
    @Get("/paises/:id")
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
	
	@Put('/paises/:id')
	def updateCountryById(@Body String body){
	    response.contentType = ContentType.APPLICATION_JSON
	    try{
	        val country = this.files.getCountryByID(Integer.valueOf(id))
	        val StandardCountry updCountry = body.fromJson(StandardCountry)
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
	
	@Delete('/paises/:id')
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
	
	@Post("/paises")
	def createCountry(@Body String body) {
	    response.contentType = ContentType.APPLICATION_JSON
	    try {
	        val StandardCountry country = body.fromJson(StandardCountry)
	        try {
	            this.files.setNewCountry(country.adapt)
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
	
	@Post("/paises/:id")
	def createCountryWithDummyId(@Body String body) {
	    response.contentType = ContentType.APPLICATION_JSON
	    try {
	        val StandardCountry country = body.fromJson(StandardCountry)
	        try {
	            this.files.setNewCountry(country.adapt)
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