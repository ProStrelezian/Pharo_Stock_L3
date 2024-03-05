Class {
	#name : #'Constructors_Page',
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'workingModel',
		'reference_produitTextInput',
		'numero_lotNumberImput',
		'nom_produitTextImput',
		'date_livraisonDateImput',
		'marqueTextImput',
		'nombre_unitesNumberImput',
		'cout_uniteNumberImput',
		'taux_margeNumberImput',
		'totalCalculImput',
		'itemsInput',
		'submitButton',
		'restoreButton',
		'cancelButton',
		'annecyButton',
		'geneveButton',
		'bergeracButton',
		'avignonButton',
		'saintetienneButton',
		'siteButtons',
		'stock'
	],
	#category : #'S6_Riviere_Kilian_LogicielDeStock'
}

{ #category : #'instance creation' }
Constructors_Page class >> open [
	(self on: Base_Model new) open.
	Transcript clear.
	Transcript show: 'Ouverture du formulaire.'; cr.
]

{ #category : #accessing }
Constructors_Page >> annecyButton [
	^annecyButton.
]

{ #category : #accessing }
Constructors_Page >> avignonButton [
	^avignonButton
]

{ #category : #accessing }
Constructors_Page >> bergeracButton [
	^bergeracButton
]

{ #category : #actions }
Constructors_Page >> cancel [
	"Action pour fermer le formulaire"
	
	self cancelModel.
]

{ #category : #accessing }
Constructors_Page >> cancelButton [

	^ cancelButton
]

{ #category : #accessing }
Constructors_Page >> cancelButton: anObject [

	cancelButton := anObject.
]

{ #category : #'as yet unclassified' }
Constructors_Page >> cancelModel [
	
	self window close.
	Transcript show: 'Fermeture de la fenêtre en cours...'; cr.
	
]

{ #category : #initialization }
Constructors_Page >> connectPresenters [
	"ajout des différents boutons spéciaux pour les actions du formulaire"
	self submitButton action: [ self submit ].
	self restoreButton action: [ self restore ].
	self cancelButton action: [ self cancel ].
]

{ #category : #accessing }
Constructors_Page >> cout_uniteNumberImput [
	^cout_uniteNumberImput.
]

{ #category : #accessing }
Constructors_Page >> cout_uniteNumberImput: anObject [.
	cout_uniteNumberImput := anObject.
]

{ #category : #accessing }
Constructors_Page >> date_livraisonDateImput [
	^ date_livraisonDateImput.

]

{ #category : #accessing }
Constructors_Page >> date_livraisonDateImput: anObject [
	date_livraisonDateImput := anObject.
]

{ #category : #layout }
Constructors_Page >> defaultLayout [
	"ajout des différentes cases pour chaque renseignement"
	^ SpBoxLayout newTopToBottom 
		add: (SpBoxLayout newLeftToRight
			spacing: 1;
			add: (SpGridLayout build: [ :builder |
				builder
					add: 'Référence du produit :'; add: reference_produitTextInput; nextRow]);
			add: (SpGridLayout build: [ :builder |
				builder
					add: 'Numéro de lot :'; add: numero_lotNumberImput; nextRow]);
			yourself);
		add: (SpGridLayout build: [ :builder |
				builder
					add: 'Nom du produit :'; add: nom_produitTextImput ; nextRow;
					add: 'Date de livraison :'; add: date_livraisonDateImput ; nextRow;
					add: 'Marque :'; add: marqueTextImput; nextRow;
					add: 'Nombre d unités du lot'; add: nombre_unitesNumberImput; nextRow;
					add: 'Coût unitaire'; add: cout_uniteNumberImput; nextRow;
					add: 'Taux de marge'; add: taux_margeNumberImput; nextRow;
					add: 'Total'; add: totalCalculImput ; nextRow;
		add: 'Site de production:'; add: (SpBoxLayout newVertical 
					add: annecyButton;
					add: geneveButton;
					add: bergeracButton;
					add: avignonButton;
					add: saintetienneButton;
					yourself)]);

		add: (SpBoxLayout newLeftToRight
			spacing: 5;
			add: submitButton;
			add: restoreButton;
			add: cancelButton;
			yourself)
	
		expand: false;
		
		yourself   
]

{ #category : #'model updates' }
Constructors_Page >> fillFormWithWorkingModel [
	"Modèle enrengistrée du jeu d'avant (ou si premier jeu, du modèle de base)"
	| aModel |
	aModel := self workingModel.
	self reference_produitTextInput text: aModel reference_produit.
	self numero_lotNumberImput text: aModel numero_lot asString.
	self nom_produitTextImput text: aModel nom_produit.
	self date_livraisonDateImput date: aModel date_livraison asDate.
	self marqueTextImput text: aModel marque.
	self nombre_unitesNumberImput text: aModel nombre_unites asString.
	self cout_uniteNumberImput text: aModel cout_unite asString.
	self taux_margeNumberImput text: aModel taux_marge asString.
	self totalCalculImput: aModel total asString.
	(siteButtons at: aModel site) state: true.
	"self itemsInput selectItems: self workingModel selectedItems"
]

{ #category : #'model updates' }
Constructors_Page >> fillModelWithFormContent [
	
	"formatage des types de données"
	self workingModel
		reference_produit: self reference_produitTextInput text;
		numero_lot: self numero_lotNumberImput number;
		nom_produit: self nom_produitTextImput text;
		date_livraison: self date_livraisonDateImput date;
		marque: self marqueTextImput text;
		nombre_unites: self nombre_unitesNumberImput number;
		cout_unite: self cout_uniteNumberImput number;
		taux_marge: self taux_margeNumberImput number;
		total: self totalCalculImput.
		self workingModel site: (siteButtons associations detect: [ :each | each value state ]) key.
	
	
	"self workingModel selectedItems: self itemsInput selectedItems."

]

{ #category : #accessing }
Constructors_Page >> geneveButton [
	^geneveButton.
]

{ #category : #initialization }
Constructors_Page >> initializePresenters [
	"instalation des différentes limitations selon les boutons"
	
	"Référence du produit"
	reference_produitTextInput  := self newTextInput.
	reference_produitTextInput  placeholder: 'non renseigné'.
	
	"Lot du produit"
	numero_lotNumberImput := self newNumberInput
		beFloat;
		digits: 0;
		climbRate: 1;
		minimum: 1;
		maximum: 999999. 
		
	"Nom du produit"
	nom_produitTextImput := self newTextInput.
	nom_produitTextImput placeholder: 'non renseigné'.
	
	"Date de livraison"
	date_livraisonDateImput  := self instantiate: SpDatePresenter.
	date_livraisonDateImput display: [ :item | item yyyymmdd ].
	
	"Marque"
	marqueTextImput := self newTextInput.
	marqueTextImput placeholder: 'non renseigné'.
	
	"Nombre d'unités"
	nombre_unitesNumberImput := self newNumberInput
		beFloat;
		digits: 0;
		climbRate: 10;
		minimum: 20;
		maximum: 50000.
		 
	"Coût unitaire"
	cout_uniteNumberImput := self newNumberInput
		beFloat;
		digits: 2;
		climbRate: 0.05;
		minimum: 0.01;
		maximum: 999.99.
	
	"Taux de marge"
	taux_margeNumberImput := self newNumberInput
		beFloat;
		digits: 2;
		climbRate: 0.01;
		minimum: 0;
		maximum: 2. 
		
	"Total"
	totalCalculImput := self newTextInput
		editable: false.
	totalCalculImput placeholder: '0'.
	
	
	"Bouton de site"
	annecyButton  := self newRadioButton label: 'Annecy'.
	geneveButton  := self newRadioButton label: 'Genève'.
	bergeracButton := self newRadioButton label: 'Bergerac'.
	avignonButton  := self newRadioButton label: 'Avignon'.
	saintetienneButton := self newRadioButton label: 'Saint-Étienne'.
	annecyButton  associatedRadioButtons: ({geneveButton},{bergeracButton},{avignonButton},{saintetienneButton}).
	siteButtons := Dictionary newFrom: {
		(#Annecy -> annecyButton).
		(#Genève  -> geneveButton).
		(#Bergerac -> bergeracButton).
		(#Avignon  -> avignonButton).
		(#SaintÉtienne -> saintetienneButton)}.
 

	submitButton  := self newButton label: 'Ajouter'.
	restoreButton := self newButton label: 'Réinitialiser'.
	cancelButton := self newButton label: 'Fermer & Annuler'.
	
	stock := Stock new.
	Transcript show: 'La liste a été crée !'


]

{ #category : #initialization }
Constructors_Page >> initializeWindow: aWindowPresenter [
	"Cela permet d'ouvrir la fenêtre avec des options pré-définie"
	aWindowPresenter
		initialExtent: 650@800.
	aWindowPresenter title: 'Formulaire de stock'.
]

{ #category : #accessing }
Constructors_Page >> itemsInput [
	^ itemsInput
]

{ #category : #accessing }
Constructors_Page >> itemsInput: anObject [
	itemsInput := anObject.
]

{ #category : #accessing }
Constructors_Page >> marqueTextImput [
	^ marqueTextImput.
]

{ #category : #accessing }
Constructors_Page >> marqueTextImput: anObject [
	marqueTextImput := anObject. 
]

{ #category : #initialization }
Constructors_Page >> modelChanged [

	workingModel := self model copy.

	self fillFormWithWorkingModel.

]

{ #category : #accessing }
Constructors_Page >> nom_produitTextImput [
	^ nom_produitTextImput.
]

{ #category : #accessing }
Constructors_Page >> nom_produitTextImput: anObject [
	nom_produitTextImput := anObject.
]

{ #category : #accessing }
Constructors_Page >> nombre_unitesNumberImput [
	^ nombre_unitesNumberImput 
]

{ #category : #accessing }
Constructors_Page >> nombre_unitesNumberImput: anObject [
	nombre_unitesNumberImput := anObject.
]

{ #category : #accessing }
Constructors_Page >> numero_lotNumberImput [
	^ numero_lotNumberImput.
]

{ #category : #accessing }
Constructors_Page >> numero_lotNumberInput: anObject [
	numero_lotNumberImput := anObject.
]

{ #category : #accessing }
Constructors_Page >> reference_produitTextInput [
	^ reference_produitTextInput
]

{ #category : #accessing }
Constructors_Page >> reference_produitTextInput: anObject [
	reference_produitTextInput := anObject.
]

{ #category : #'window management' }
Constructors_Page >> restore [
	"Action pour remettre le formulaire à l'état d'origine"
	self modelChanged.
	Transcript show: '> Le formulaire a été réinitialisé !'; cr;cr.
]

{ #category : #accessing }
Constructors_Page >> restoreButton [
	^ restoreButton
]

{ #category : #accessing }
Constructors_Page >> restoreButton: anObject [
	restoreButton := anObject.
]

{ #category : #accessing }
Constructors_Page >> saintetienneButton [
	^saintetienneButton
]

{ #category : #submit }
Constructors_Page >> submit [
	
	self submitOut.
	self writeProduit.
	
	"Restauration du modèle de base"
	self model: workingModel.
	self announcingObject valueChanged.
	
	self fillModelWithFormContent.
	
	
	

	

]

{ #category : #accessing }
Constructors_Page >> submitButton [
	^ submitButton.
]

{ #category : #accessing }
Constructors_Page >> submitButton: anObject [
	submitButton := anObject.
]

{ #category : #'as yet unclassified' }
Constructors_Page >> submitOut [
	Transcript show: '> La demande a été soumis !'; cr.
	
	Transcript show: 'Les infos données sont : '; cr.
	Transcript show: ((self nombre_unitesNumberImput number) * (1 + (self taux_margeNumberImput  number) * (self cout_uniteNumberImput number)));cr.
	
]

{ #category : #accessing }
Constructors_Page >> taux_margeNumberImput [
	^ taux_margeNumberImput 
]

{ #category : #accessing }
Constructors_Page >> taux_margeNumberImput: anObject [
	taux_margeNumberImput := anObject.
]

{ #category : #accessing }
Constructors_Page >> totalCalculImput [
 ^ totalCalculImput.
]

{ #category : #accessing }
Constructors_Page >> totalCalculImput: anObject [
	totalCalculImput := anObject.
]

{ #category : #accessing }
Constructors_Page >> workingModel [
	^ workingModel
]

{ #category : #accessing }
Constructors_Page >> workingModel: anObject [
	workingModel := anObject
	
]

{ #category : #writing }
Constructors_Page >> writeProduit [

	|nouveau|
	
	nouveau := Produit new.
	
	nouveau reference: (self reference_produitTextInput text).
	nouveau lot: (self numero_lotNumberImput text).
	nouveau nom: (self nom_produitTextImput text).
	nouveau livraison: (self date_livraisonDateImput date).
	nouveau marque: (self marqueTextImput text).
	nouveau nb_unites: (self nombre_unitesNumberImput text).
	nouveau cout: (self cout_uniteNumberImput text).
	nouveau taux_marge: (self taux_margeNumberImput text).
	nouveau total: (self totalCalculImput).
	nouveau site: ((annecyButton state) ifTrue: ('Annecy')
					ifFalse: ((geneveButton state) ifTrue: ('Genève')
					ifFalse: ((bergeracButton state) ifTrue: ('Bergerac')
					ifFalse: ((avignonButton state) ifTrue: ('Avignon')
					ifFalse: ((saintetienneButton state) ifTrue: ('Saint-Étienne')
					ifFalse: ('Inconnue')))))).
					
	stock contient: nouveau.
	Transcript show: ('Produit pris en compte !'); cr.
]
