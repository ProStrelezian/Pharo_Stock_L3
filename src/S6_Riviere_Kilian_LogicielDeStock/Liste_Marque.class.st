Class {
	#name : #'Liste_Marque',
	#superclass : #SpListPresenter,
	#instVars : [
		'liste_marque',
		'liste_nomproduit',
		'luButton',
		'princeButton',
		'bonnemamanButton',
		'nutellaButton',
		'bjorgButton'
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

{ #category : #accessing }
Liste_Marque >> bjorgButton [

	^ bjorgButton
]

{ #category : #accessing }
Liste_Marque >> bjorgButton: anObject [

	bjorgButton := anObject
]

{ #category : #accessing }
Liste_Marque >> bonnemamanButton [

	^ bonnemamanButton
]

{ #category : #accessing }
Liste_Marque >> bonnemamanButton: anObject [

	bonnemamanButton := anObject
]

{ #category : #layout }
Liste_Marque >> defaultLayout [

	^ SpBoxLayout newHorizontal
			add: (SpBoxLayout newVertical 
					add: 'Marque' expand: false;
					add: luButton;
					add: princeButton;
					add: bonnemamanButton;
					add: nutellaButton;
					add: bjorgButton);
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

	liste_nomproduit := self newList.
		
	luButton := self newToggleButton label: 'LU'.
	princeButton := self newToggleButton label: 'Prince'.
	bonnemamanButton := self newToggleButton label: 'Bonne Maman'.
	nutellaButton := self newToggleButton label: 'Nutella'.
	bjorgButton := self newToggleButton label: 'Bjorg'.
		
	

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

{ #category : #accessing }
Liste_Marque >> luButton [

	^ luButton
]

{ #category : #accessing }
Liste_Marque >> luButton: anObject [

	luButton := anObject
]

{ #category : #accessing }
Liste_Marque >> nutellaButton [

	^ nutellaButton
]

{ #category : #accessing }
Liste_Marque >> nutellaButton: anObject [

	nutellaButton := anObject
]

{ #category : #accessing }
Liste_Marque >> princeButton [

	^ princeButton
]

{ #category : #accessing }
Liste_Marque >> princeButton: anObject [

	princeButton := anObject
]
