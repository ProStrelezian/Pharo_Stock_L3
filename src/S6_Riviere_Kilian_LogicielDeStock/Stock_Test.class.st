Class {
	#name : #'Stock_Test',
	#superclass : #TestCase,
	#instVars : [
		'stock'
	],
	#category : #'S6_Riviere_Kilian_LogicielDeStock'
}

{ #category : #running }
Stock_Test >> setUp [
	"Jeu d'essai de test de la classe Stock"
	
	super setUp.	
	
	
	stock := Stock new.
	stock numero: 0.
]

{ #category : #tests }
Stock_Test >> testContenirStock [
	
	"Cette méthode permet les tests sur la variable de la classe Stock, 'unAnnuairedeProduit' "
	
	self deny: (stock unAnnuairedeProduit) isNil.
   self assert: (stock unAnnuairedeProduit) isNotNil.
]

{ #category : #tests }
Stock_Test >> testNumeroStock [
	
	"Cette méthode permet les tests sur la variable de la classe Stock, 'numero' "
	
	self deny: (stock numero) isNil.
	self deny: (stock numero) <= 0.
	self assert: (stock numero) > 0.
	self assert: (stock numero) isFloat.
	
]
