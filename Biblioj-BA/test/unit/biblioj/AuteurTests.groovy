package biblioj



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Auteur)
class AuteurTests {

	void testConstraintNomNullPrenomNull() {
		def auteur = new Auteur()
		assertFalse auteur.validate()
	}
	
	void testConstraintPrenomNull() {
		def auteur = new Auteur(nom : "Aidi")
		assertFalse auteur.validate()
	}
	
	void testConstraintNomNull() {
		def auteur = new Auteur(prenom : "Othmane")
		assertFalse auteur.validate()
	}
	
	void testConstraintNomBlank() {
		def auteur = new Auteur(nom : "", prenom : "Anas")
		assertFalse auteur.validate()
	}
	
	void testConstraintPrenomBlank() {
		def auteur = new Auteur(nom : "Bennis", prenom : "")
		assertFalse auteur.validate()
	}
	
	void testConstraintNomBlankPrenomBlanck() {
		def auteur = new Auteur(nom : "", prenom : "")
		assertFalse auteur.validate()
	}
	
	void testConstraintsValidees() {
		def auteur = new Auteur(nom : "Bennis", prenom : "Anas")
		assertTrue auteur.validate()
	}
	
	void testToString() {
		def auteur = new Auteur(nom : "Anas", prenom : "Bennis")
		assertEquals("Bennis Anas", auteur.toString())
	}
	
}
