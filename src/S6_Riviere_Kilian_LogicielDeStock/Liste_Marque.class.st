Class {
	#name : #'Liste_Marque',
	#superclass : #SpListPresenter,
	#instVars : [
		'liste_marque',
		'liste_nomproduit'
	],
	#category : #'S6_Riviere_Kilian_LogicielDeStock'
}

{ #category : #'instance creation' }
Liste_Marque class >> open [
	<sampleInstance>
	^ self new
		open;
		yourself
]

{ #category : #layout }
Liste_Marque >> defaultLayout [

	^ SpBoxLayout newHorizontal
			add: (SpBoxLayout newTopToBottom 
					add: 'Marque' expand: false;
					add: liste_marque);
			add: (SpBoxLayout newTopToBottom 
					add: '' expand: false;
					add: '');
			add: (SpBoxLayout newTopToBottom 
					add: 'Nom de produit' expand: false;
					add: liste_nomproduit);
			yourself.
]

{ #category : #initialization }
Liste_Marque >> initializePresenters [
	
	liste_marque := self newList.
	liste_nomproduit := self newList.
	
	liste_marque items: #( 'LU' 'Prince' 'Bonne Maman' 'Nutella' 'Bjorg')
]

{ #category : #initialization }
Liste_Marque >> initializeWindow: aWindowPresenter [
	"Cela permet d'ouvrir la fenêtre avec des options pré-définie"
	aWindowPresenter
		initialExtent: 500@600.
	aWindowPresenter title: 'Historique'.
]

{ #category : #accessing }
Liste_Marque >> liste_marque [

	^ liste_marque
]

{ #category : #accessing }
Liste_Marque >> liste_marque: anObject [

	liste_marque := anObject
]

{ #category : #accessing }
Liste_Marque >> liste_nomproduit [

	^ liste_nomproduit
]

{ #category : #accessing }
Liste_Marque >> liste_nomproduit: anObject [

	liste_nomproduit := anObject
]
