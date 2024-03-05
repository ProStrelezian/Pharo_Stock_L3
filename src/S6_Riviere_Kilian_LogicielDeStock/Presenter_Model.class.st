Class {
	#name : #'Presenter_Model',
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'form',
		'resultPane',
		'table',
		'liste'
	],
	#category : #'S6_Riviere_Kilian_LogicielDeStock'
}

{ #category : #layout }
Presenter_Model >> defaultLayout [

	^ SpPanedLayout newLeftToRight
		  positionOfSlider: (StandardFonts defaultFont widthOfString: 'M') * 35;
		  add: form;
		  add: resultPane;
		  yourself
]

{ #category : #initialization }
Presenter_Model >> initialize [
	"Création du modèle"
	self model: Base_Model new.
	super initialize.
]

{ #category : #initialization }
Presenter_Model >> initializePresenters [

	"Cela met en place la forme du formulaire"

	form := self newPresenter 
		layout: (SpBoxLayout newTopToBottom
			add: 'form' expand: false;
			add: (self instantiate: Constructors_Page on: self announcingObject);
			yourself);
		yourself.

	resultPane := self newPresenter 
		layout: (SpBoxLayout newTopToBottom
			add: 'result' expand: false;
			add: (table := self newTable);
			yourself);
		yourself.

	table
		addColumn: (SpStringTableColumn title: 'Name' evaluated: #key);
		addColumn: (SpStringTableColumn title: 'Value' evaluated: #value);
		items: self model elements;
		beResizable
]

{ #category : #initialization }
Presenter_Model >> modelChanged [

	table items: self model elements
]

{ #category : #'option list presenter' }
Presenter_Model >> optionIcon [
	
	^ self iconNamed: #smallWindow
]

{ #category : #'option list presenter' }
Presenter_Model >> optionTitle [

	^ 'Form Presenter'
]

{ #category : #accessing }
Presenter_Model >> table [
	^ table
]

{ #category : #accessing }
Presenter_Model >> table: anObject [
	table := anObject
]
