package biblioj

import static org.junit.Assert.*
import org.junit.*

class ReservationTests {
	Reservation reservation
    @Before
    void setUp() {
        // Setup logic here
    }

    @After
    void tearDown() {
        // Tear down logic here
    }

    @Test
	void testSomething() {
		 reservation = new Reservation(code : "NULL", dateReservation : new Date())
		 reservation = new Reservation(code : "NULL", dateReservation : new Date())
		 def LivreAdulte = new TypeDocument(intitule: "Livre adulte").save(failOnError : true)
		 def vigan = new Auteur(nom:"Vigan", prenom:"Delphine").save(failOnError : true)
		 def livre = new Livre(type: LivreAdulte,titre: "Rien ne s'oppose à la nuit : roman",nombreExemplaires :10,nombreExemplairesDisponibles : 10)
		 livre.addToAuteurs(vigan).save(failOnError : true)
		assertEquals(true, reservation.ajouterLivre(livre.id))
	}
	@Test
	void testSupprimer(){
		reservation = new Reservation(code : "NULL", dateReservation : new Date())
		def LivreAdulte = new TypeDocument(intitule: "Livre adulte").save(failOnError : true)
		def vigan = new Auteur(nom:"Vigan", prenom:"Delphine").save(failOnError : true)
		def livre = new Livre(type: LivreAdulte,titre: "Rien ne s'oppose à la nuit : roman",nombreExemplaires :10,nombreExemplairesDisponibles : 10)
		livre.addToAuteurs(vigan).save(failOnError : true)
		reservation.ajouterLivre(livre.id)
		assertEquals(true, reservation.supprimerExemplaireLivre(livre.id))
	}
}
