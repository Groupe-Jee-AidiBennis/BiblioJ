package biblioj

import static org.junit.Assert.*

import org.junit.*

class InitialisationServiceTests {

    @Before
    void setUp() {
        // Setup logic here
    }

    @After
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

	}}
