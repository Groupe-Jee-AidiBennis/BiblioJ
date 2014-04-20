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
	static mapping = {
		livres joinTable: [name: "mm_reservation_livres", key: 'mm_reservation_id' ]
	}
	
	@Override
	public String toString() {
		return code;
	}
}
