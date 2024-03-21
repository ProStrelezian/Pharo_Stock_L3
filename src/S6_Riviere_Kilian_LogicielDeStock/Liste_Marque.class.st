Class {
	#name : #'Liste_Marque',
	#superclass : #SpListPresenter,
	#instVars : [
		'liste_nomproduit',
		'luButton',
		'princeButton',
		'bonnemamanButton',
		'nutellaButton',
		'bjorgButton',
		'workingModel',
		'marqueButtons',
		'choixButton'
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

{ #category : #'as yet unclassified' }
Liste_Marque >> bjorgProduit [

	|fichier|
	
	fichier := 'produit/bjorg.txt' asFileReference.
	
	fichier exists.
	fichier extension.
	

	Transcript show: ('Vous avez selectionné la liste des produit de la marque Bjorg');cr.
	self liste_nomproduit items: (fichier readStreamDo: [ :in |
  Array streamContents: [ :out |
    [ in atEnd ] whileFalse: [ out nextPut: in nextLine ] ] ]).
]

{ #category : #accessing }
Liste_Marque >> bonnemamanButton [

	^ bonnemamanButton
]

{ #category : #accessing }
Liste_Marque >> bonnemamanButton: anObject [

	bonnemamanButton := anObject
]

{ #category : #'as yet unclassified' }
Liste_Marque >> bonnemamanProduit [

	|fichier|
	
	fichier := 'produit/bonnemaman.txt' asFileReference.
	
	fichier exists.
	fichier extension.
	

	Transcript show: ('Vous avez selectionné la liste des produit de la marque Bonne Maman');cr.
	self liste_nomproduit items: (fichier readStreamDo: [ :in |
  Array streamContents: [ :out |
    [ in atEnd ] whileFalse: [ out nextPut: in nextLine ] ] ]).
]

{ #category : #initialization }
Liste_Marque >> connectPresenters [
	self luButton action: [ self luProduit ].
	self princeButton action: [ self princeProduit ].
	self bonnemamanButton action: [ self bonnemamanProduit ].
	self nutellaButton action: [ self nutellaProduit ].
	self bjorgButton action: [ self bjorgProduit ]
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
	luButton associatedToggleButtons: ({princeButton}, {bonnemamanButton}, {nutellaButton}, {bjorgButton}).
		marqueButtons := Dictionary newFrom: {
		(#LU -> luButton).
		(#Prince  -> princeButton).
		(#BonneMaman -> bonnemamanButton).
		(#Nutella  -> nutellaButton).
		(#Bjorg -> bjorgButton)}.
	
	choixButton := self newButton label: 'Filtrer les produits'.

]

{ #category : #initialization }
Liste_Marque >> initializeWindow: aWindowPresenter [
	"Cela permet d'ouvrir la fenêtre avec des options pré-définie"
	aWindowPresenter
		initialExtent: 500@600.
	aWindowPresenter title: 'Catalogue de produit'.
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

{ #category : #'as yet unclassified' }
Liste_Marque >> luProduit [

	|fichier|
	
	fichier := 'produit/lu.txt' asFileReference.
	
	fichier exists.
	fichier extension.
	

	Transcript show: ('Vous avez selectionné la liste des produit de la marque LU');cr.
	self liste_nomproduit items: (fichier readStreamDo: [ :in |
  Array streamContents: [ :out |
    [ in atEnd ] whileFalse: [ out nextPut: in nextLine ] ] ]).
]

{ #category : #accessing }
Liste_Marque >> nutellaButton [

	^ nutellaButton
]

{ #category : #accessing }
Liste_Marque >> nutellaButton: anObject [

	nutellaButton := anObject
]

{ #category : #'as yet unclassified' }
Liste_Marque >> nutellaProduit [
		
	|fichier|
	
	fichier := 'produit/nutella.txt' asFileReference.
	
	fichier exists.
	fichier extension.
	

	Transcript show: ('Vous avez selectionné la liste des produit de la marque Nutella');cr.
	self liste_nomproduit items: (fichier readStreamDo: [ :in |
  Array streamContents: [ :out |
    [ in atEnd ] whileFalse: [ out nextPut: in nextLine ] ] ]).
]

{ #category : #accessing }
Liste_Marque >> princeButton [

	^ princeButton
]

{ #category : #accessing }
Liste_Marque >> princeButton: anObject [

	princeButton := anObject
]

{ #category : #'as yet unclassified' }
Liste_Marque >> princeProduit [
	
	|fichier|
	
	fichier := 'produit/prince.txt' asFileReference.
	
	fichier exists.
	fichier extension.
	

	Transcript show: ('Vous avez selectionné la liste des produit de la marque Prince');cr.
	self liste_nomproduit items: (fichier readStreamDo: [ :in |
  Array streamContents: [ :out |
    [ in atEnd ] whileFalse: [ out nextPut: in nextLine ] ] ]).
]

{ #category : #accessing }
Liste_Marque >> workingModel [
	^ workingModel.
]

{ #category : #accessing }
Liste_Marque >> workingModel: anObject [
	workingModel := anObject.
]
