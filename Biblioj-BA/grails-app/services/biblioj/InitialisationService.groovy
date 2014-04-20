package biblioj

class InitialisationService {

	boolean transactionnal = true
	
		def initialiserDonnees() {
			
			def LivreAdo = new TypeDocument(intitule: "Livre ado").save(failOnError : true)
			def Nouvaute = new TypeDocument(intitule: "Nouveauté").save(failOnError : true)
			def LivreAdulte = new TypeDocument(intitule: "Livre adulte").save(failOnError : true)
		   
			def vigan = new Auteur(nom:"Vigan", prenom:"Delphine").save(failOnError : true)
			def collins = new Auteur(nom: "Collins",prenom:"Suzanne").save(failOnError : true)
			def stockett = new Auteur(nom: "Stockett",prenom:"Kathryn").save(failOnError : true)
			def carrere = new Auteur(nom: "Carrère",prenom:"Emmanuel").save(failOnError : true)
			def murakami = new Auteur(nom: "Murakami",prenom:"Haruki").save(failOnError : true)
			def delacourt = new Auteur(nom: "Delacourt",prenom:"Grégoire").save(failOnError : true)
			def larsson = new Auteur(nom: "Larsson",prenom:"Stieg").save(failOnError : true)
	
			def livre0 = new Livre(type: LivreAdulte,titre: "Rien ne s'oppose � la nuit : roman",nombreExemplaires :10,nombreExemplairesDisponibles : 10)
			livre0.addToAuteurs(vigan).save(failOnError : true)
			
			def livre1 = new Livre(type: LivreAdo,titre: "Hunger games [Texte imprimé]",nombreExemplaires :10,nombreExemplairesDisponibles : 0)
			livre1.addToAuteurs(collins).save(failOnError : true)
			livre1.addToAuteurs(mrakami).save(failOnError : true)
			
			def livre2 = new Livre(type: Nouvaute,titre: "La couleur des sentiments",nombreExemplaires :10,nombreExemplairesDisponibles : 10)
			livre2.addToAuteurs(stockett).save(failOnError : true)
			def livre3 = new Livre(type: LivreAdo,titre: "L'embrasement",nombreExemplaires :10,nombreExemplairesDisponibles : 1)
			livre3.addToAuteurs(collins).save(failOnError : true)
			def livre4 = new Livre(type:Nouvaute,titre: "Limonov",nombreExemplaires :10,nombreExemplairesDisponibles : 0)
			livre4.addToAuteurs(carrere).save(failOnError : true)
			def livre5 = new Livre(type: Nouvaute,titre: "1Q84. 1. Avril-juin",nombreExemplaires :10,nombreExemplairesDisponibles : 10)
			livre5.addToAuteurs(murakami).save(failOnError : true)
			def livre6 = new Livre(type: Nouvaute,titre: "1Q84. 3. Octobre-décembre",nombreExemplaires :10,nombreExemplairesDisponibles : 10)
			livre6.addToAuteurs(murakami).save(failOnError : true)
			def livre7 = new Livre(type: LivreAdo, titre: "La révolte",nombreExemplaires :10,nombreExemplairesDisponibles : 10)
			livre7.addToAuteurs(collins).save(failOnError : true)
			def livre8 = new Livre(type: LivreAdulte,titre: "La liste de mes envies",nombreExemplaires :10,nombreExemplairesDisponibles : 10)
			livre8.addToAuteurs(delacourt).save(failOnError : true)
			def livre9 = new Livre(type: Nouvaute,titre: "1Q84. 2. Juillet-septembre",nombreExemplaires :10,nombreExemplairesDisponibles : 10)
			livre9.addToAuteurs(murakami).save(failOnError : true)
			def livre10 = new Livre(type: LivreAdulte,titre: "La reine dans le palais des courants d'air [Texte imprimé]",nombreExemplaires :10,nombreExemplairesDisponibles : 10)
			livre10.addToAuteurs(larsson).save(failOnError : true)
			
			}
}
