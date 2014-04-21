package biblioj



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Livre)
class LivreTests {

	void testConstraintTitreNullNombreExemplairesNullNombreExemplairesDisponiblesNull() {
		def livre0 = new Livre()
		assertFalse livre0.validate()
	 }
	 
	 void testConstraintTitreNull() {
		 def livre = new Livre(nombreExemplaires : 5, nombreExemplairesDisponibles : 5, type : new TypeDocument(intitule : "Nouveaut�"))
		 assertFalse livre.validate()
	 }
	 
	 void testConstraintNombreExemplairesMinValue() {
		 def livre = new Livre(titre : "LivreAdo", nombreExemplaires : -1, nombreExemplairesDisponibles : 7, type : new TypeDocument(intitule : "Nouveaut�"))
		 assertFalse livre.validate()
	 }
	 
	 void testConstraintNombreExemplairesDisponiblesMinValue() {
		 def livre = new Livre(titre : "LivreAdo", nombreExemplaires : 5, nombreExemplairesDisponibles : -1, type : new TypeDocument(intitule : "Nouveaut�"))
		 assertFalse livre.validate()
	 }
	 
	 void testConstraintTypeDocumentNull() {
		 def livre = new Livre(titre : "LivreAdo", nombreExemplaires : 6, nombreExemplairesDisponibles : 7)
		 assertTrue livre.validate()
	 }
	 
	 void testConstraintsValidees() {
		 def livre = new Livre(titre : "LivreAdo", nombreExemplaires : 7, nombreExemplairesDisponibles : 10, type : new TypeDocument(intitule : "Nouveaut�"))
		 assertTrue livre.validate()
	 }
	 
	 void testToString() {
		 def livre = new Livre(titre : "LivreAdo", nombreExemplaires : 20, nombreExemplairesDisponibles : 5, type : new TypeDocument(intitule : "Nouveaut�"))
		 assertEquals("LivreAdo", livre.toString())
	 }
}
