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
	super setUp.	
	"Constructors_Page open."
	
	stock := Stock new.
	stock numero: 0.
]

{ #category : #tests }
Stock_Test >> testContenirStock [

	self deny: (stock unAnnuairedeProduit) isNil.
   self assert: (stock unAnnuairedeProduit) isNotNil.
]

{ #category : #tests }
Stock_Test >> testNumeroStock [

	self deny: (stock numero) isNil.
	self deny: (stock numero) equals: 0.
	
]
