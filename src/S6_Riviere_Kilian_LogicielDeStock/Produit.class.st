Class {
	#name : #Produit,
	#superclass : #Object,
	#instVars : [
		'reference',
		'lot',
		'nom',
		'livraison',
		'marque',
		'nb_unites',
		'cout',
		'taux_marge',
		'total',
		'site'
	],
	#category : #'S6_Riviere_Kilian_LogicielDeStock'
}

{ #category : #accessing }
Produit >> cout [
	^ cout.
]

{ #category : #accessing }
Produit >> cout: anText [
	cout := anText.
]

{ #category : #initialization }
Produit >> initialize [ 
]

{ #category : #accessing }
Produit >> livraison [
	^livraison.
]

{ #category : #accessing }
Produit >> livraison: anText [
	livraison := anText.
]

{ #category : #accessing }
Produit >> lot [
	^lot
]

{ #category : #accessing }
Produit >> lot: anText [.
	lot := anText.
]

{ #category : #accessing }
Produit >> marque [
	^ marque.
]

{ #category : #accessing }
Produit >> marque: anText [
	marque := anText .
]

{ #category : #accessing }
Produit >> nb_unites [
	^ nb_unites
]

{ #category : #accessing }
Produit >> nb_unites: anText [
	nb_unites := anText.
]

{ #category : #accessing }
Produit >> nom [
 ^nom
]

{ #category : #accessing }
Produit >> nom: anText [
	nom:=anText .
]

{ #category : #accessing }
Produit >> reference [
	^reference.
]

{ #category : #accessing }
Produit >> reference: anText [
	reference := anText.
]

{ #category : #accessing }
Produit >> site [
	^site.
]

{ #category : #accessing }
Produit >> site: anText [
	site := anText.
]

{ #category : #accessing }
Produit >> taux_marge [
	^taux_marge.
]

{ #category : #accessing }
Produit >> taux_marge: anText [
	taux_marge := anText.
]

{ #category : #accessing }
Produit >> total [
	^ total
]

{ #category : #accessing }
Produit >> total: anText [
	total := anText.
]
