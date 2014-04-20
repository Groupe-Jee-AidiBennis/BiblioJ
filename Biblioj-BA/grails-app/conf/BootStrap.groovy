import biblioj.InitialisationService;

class BootStrap {

	InitialisationService initialisationService
	
		def init = { servletContext ->
			environments {
				development {
					initialisationService.initialiserDonnees()
				}
			}
		}
		def destroy = {
		}
}
