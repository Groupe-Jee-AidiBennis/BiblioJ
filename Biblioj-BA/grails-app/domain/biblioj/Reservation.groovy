package biblioj

import java.util.Date;

class Reservation {

	String code
	Date dateReservation
	static hasMany = [livres : Livre]
	static belongsTo = Livre
	static constraints = {
		code(nullable:false)
						 }

	
	@Override
	public String toString() {
		return code;
	}
	def boolean ajouterLivre(int id) {
		if(Livre.findById(id) == null) {
			return false
		}
		if(this.livres == null) {
			this.livres = new HashSet();
			Livre l =Livre.findById(id)
			this.livres.add(l)
			
		} else {
			boolean livreExistant = false
			
			for(live in livres) {
				if(live.id == id) {
					
					livreExistant = true
					break
				}
			}
			if(!livreExistant) {
				Livre l = Livre.findById(id)
				this.livres.add(l)
				
				}
		}
		return true
	}
					
	def boolean supprimerExemplaireLivre(int id) {
		for (livre in livres) {
			if(livre.id == id) {
				
					livres.remove(livre)
				
				
				return true
			}
		}
		return false
	}
}
