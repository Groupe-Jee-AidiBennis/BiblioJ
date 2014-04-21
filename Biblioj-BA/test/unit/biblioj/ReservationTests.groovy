package biblioj

import static org.junit.Assert.*

import grails.test.mixin.*
import grails.test.mixin.support.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestMixin(GrailsUnitTestMixin)
class ReservationTests {

    void setUp() {
        // Setup logic here
    }

    void tearDown() {
        // Tear down logic here
    }


	void testConstraintCodeNull() {
		def reservation = new Reservation();
		assertFalse reservation.validate()
	 }
	 
	 void testConstraintsValidees() {
		 def reservation = new Reservation(code : "NULL", dateReservation : new Date())
		 assertTrue reservation.validate()
	 }
	 
	 void testToString() {
		 def reservation = new Reservation(code : "NULL", dateReservation : new Date())
		 assertEquals("NULL", reservation.toString())
	 }
	 void testSupprimer(){
		def reservation = new Reservation(code : "NULL", dateReservation : new Date())
		 def LivreAdulte = new TypeDocument(intitule: "Livre adulte").save(failOnError : true)
		 def vigan = new Auteur(nom:"Vigan", prenom:"Delphine").save(failOnError : true)
		 def livre = new Livre(type: LivreAdulte,titre: "Rien ne s'oppose à la nuit : roman",nombreExemplaires :10,nombreExemplairesDisponibles : 10)
		 livre.addToAuteurs(vigan).save(failOnError : true)
		 reservation.ajouterLivre(livre.id)
		 assertEquals(true, reservation.supprimerExemplaireLivre(livre.id))
	 }
}
