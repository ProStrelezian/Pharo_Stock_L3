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
	super setUp.	
	"Constructors_Page open."
	
	new := Produit new.
	new taux_marge: 0.05.
	new reference: '50'.
	new cout: 20.
]

{ #category : #tests }
Produit_Test >> testCoutProduit [

		self deny: (new cout) <0.
		self assert: (new cout) <5000.
		
]

{ #category : #tests }
Produit_Test >> testMargeProduit [

	self deny: (new taux_marge) isNil.
	self deny: (new taux_marge) equals: 0.
	self deny: (new taux_marge) > 0.50.
]

{ #category : #tests }
Produit_Test >> testMarqueProduit [

	self deny: (new marque) equals: 'non renseigné'.
	self deny: (new marque) isInteger.
]

{ #category : #tests }
Produit_Test >> testNomProduit [
		
		self deny: (new nom) equals: 'non renseigné'.
	
]

{ #category : #tests }
Produit_Test >> testRefProduit [

	self deny: (new reference) equals: 'non renseigné'.
	self assert: (new reference) isInteger.
]

{ #category : #tests }
Produit_Test >> testSiteProduit [

	self deny: (new site) isNil.
	self assert: (new site) equals: 'Annecy'.
	self assert: (new site) equals: 'Genève'.
	self assert: (new site) equals: 'Bergerac'.
	self assert: (new site) equals: 'Avignon'.
	self assert: (new site) equals: 'Saint-Étienne'.
]
