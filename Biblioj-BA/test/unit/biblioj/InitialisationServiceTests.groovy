package biblioj

import static org.junit.Assert.*

import grails.test.mixin.*
import grails.test.mixin.support.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestMixin(GrailsUnitTestMixin)
class InitialisationServiceTests {

    void setUp() {
        // Setup logic here
    }

    void tearDown() {
        // Tear down logic here
    }

	InitialisationService initialisationService
	void testSomething() {
		initialisationService.initialiserDonnees()
		assertEquals(7, Auteur.count())
		assertEquals(11, Livre.count())
		assertEquals(0, Reservation.count())
		assertEquals(3, TypeDocument.count())
	}
}
