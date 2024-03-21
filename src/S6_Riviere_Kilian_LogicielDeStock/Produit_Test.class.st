Class {
	#name : #'Produit_Test',
	#superclass : #TestCase,
	#instVars : [
		'new'
	],
	#category : #'S6_Riviere_Kilian_LogicielDeStock'
}

{ #category : #running }
Produit_Test >> setUp [

	"Jeu d'essai de test de la classe Produit"
	super setUp.	
	
	new := Produit new.
	new taux_marge: 0.05.
	new reference: '50'.
	new cout: 20.
]

{ #category : #tests }
Produit_Test >> testCoutProduit [
		
		"Cette méthode permet les tests sur la variable de la classe Produit, 'cout' "

		self deny: (new cout) <0.
		self assert: (new cout) <5000.
		
]

{ #category : #tests }
Produit_Test >> testDateLivProduit [

	"Cette méthode permet les tests sur la variable de la classe Produit, 'livraison' "
	
	self assert: (new livraison) isNotNil.
]

{ #category : #tests }
Produit_Test >> testLotProduit [

	"Cette méthode permet les tests sur la variable de la classe Produit, 'lot' "
	
	self assert: (new lot) isNotNil.
	self assert: (new lot) >= 1.
	self assert: (new lot) isFloat.
]

{ #category : #tests }
Produit_Test >> testMargeProduit [

	"Cette méthode permet les tests sur la variable de la classe Produit, 'marge' "

	self deny: (new taux_marge) isNil.
	self deny: (new taux_marge) equals: 0.
	self deny: (new taux_marge) > 0.50.
]

{ #category : #tests }
Produit_Test >> testMarqueProduit [
	
	"Cette méthode permet les tests sur la variable de la classe Produit, 'marque' "

	self deny: (new marque) equals: 'non renseigné'.
	self deny: (new marque) isInteger.
]

{ #category : #tests }
Produit_Test >> testNomProduit [
	
		"Cette méthode permet les tests sur la variable de la classe Produit, 'nom_produit' "
		
		self deny: (new nom) equals: 'non renseigné'.
		self deny: (new nom) isNil.
	
]

{ #category : #tests }
Produit_Test >> testRefProduit [
	
	"Cette méthode permet les tests sur la variable de la classe Produit, 'reference' "

	self deny: (new reference) equals: 'non renseigné'.
	self assert: (new reference) isInteger.
]

{ #category : #tests }
Produit_Test >> testSiteProduit [
	
	"Cette méthode permet les tests sur la variable de la classe Produit, 'site' "

	self deny: (new site) isNil.
	self assert: (new site) equals: 'Annecy'.
	self assert: (new site) equals: 'Genève'.
	self assert: (new site) equals: 'Bergerac'.
	self assert: (new site) equals: 'Avignon'.
	self assert: (new site) equals: 'Saint-Étienne'.
]
