package biblioj

class Livre {

	String titre
	int nombreExemplaires
	int nombreExemplairesDisponibles
	TypeDocument type
	
	static belongsTo = Auteur
	static hasMany = [auteurs:Auteur,reservations:Reservation]
	static constraints = {
		titre(nullable:false)
		nombreExemplaires(min : 0)
		nombreExemplairesDisponibles(min : 0)
		type (nullable : true)
	}
	static mapping = {
		reservations joinTable: [name: "mm_reservation_livres", key: 'mm_livre_id' ]
	}
		
	def String toString() {
		titre
	}
}
