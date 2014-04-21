package biblioj



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(TypeDocument)
class TypeDocumentTests {

    void testConstraintIntituleNull() {
       def typeDocument = new TypeDocument()
	   assertFalse typeDocument.validate()
    }
	
	void testConstraintIntituleBlank() {
		def typeDocument = new TypeDocument(intitule : "")
		assertFalse typeDocument.validate()
	}
	
	void testConstraintsValidees() {
		def typeDocument = new TypeDocument(intitule : "News ")
		assertTrue typeDocument.validate()
	}
	void testToString() {
		def typeDocument = new TypeDocument(intitule : "Nouveaute")
		assertEquals("Nouveaute", typeDocument.toString())
	}
}
