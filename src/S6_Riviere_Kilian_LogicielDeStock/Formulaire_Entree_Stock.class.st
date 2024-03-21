Class {
	#name : #'Formulaire_Entree_Stock',
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
		'stock',
		'listButton'
	],
	#category : #'S6_Riviere_Kilian_LogicielDeStock'
}

{ #category : #'instance creation' }
Formulaire_Entree_Stock class >> open [
	(self on: Base_Model new) open.
	Transcript clear.
	Transcript show: 'Ouverture du formulaire.'; cr.
]

{ #category : #accessing }
Formulaire_Entree_Stock >> annecyButton [
	^annecyButton.
]

{ #category : #accessing }
Formulaire_Entree_Stock >> avignonButton [
	^avignonButton
]

{ #category : #accessing }
Formulaire_Entree_Stock >> bergeracButton [
	^bergeracButton
]

{ #category : #actions }
Formulaire_Entree_Stock >> cancel [
	"Action pour fermer le formulaire"
	
	self cancelModel.
]

{ #category : #accessing }
Formulaire_Entree_Stock >> cancelButton [

	^ cancelButton
]

{ #category : #modifying }
Formulaire_Entree_Stock >> cancelButton: anObject [

	cancelButton := anObject.
]

{ #category : #'as yet unclassified' }
Formulaire_Entree_Stock >> cancelModel [
	
	self window close.
	Transcript show: 'Fermeture de la fenêtre en cours...'; cr.
	
]

{ #category : #initialization }
Formulaire_Entree_Stock >> connectPresenters [
	"Ajout des différents boutons spéciaux pour les actions du formulaire"
	self submitButton action: [ self submit ].
	self restoreButton action: [ self restore ].
	self cancelButton action: [ self cancel ].
	self listButton action: [ self list ].
]

{ #category : #accessing }
Formulaire_Entree_Stock >> cout_uniteNumberImput [
	^cout_uniteNumberImput.
]

{ #category : #modifying }
Formulaire_Entree_Stock >> cout_uniteNumberImput: anObject [.
	cout_uniteNumberImput := anObject.
]

{ #category : #accessing }
Formulaire_Entree_Stock >> date_livraisonDateImput [
	^ date_livraisonDateImput.

]

{ #category : #modifying }
Formulaire_Entree_Stock >> date_livraisonDateImput: anObject [
	date_livraisonDateImput := anObject.
]

{ #category : #layout }
Formulaire_Entree_Stock >> defaultLayout [
	"ajout des différentes cases pour chaque renseignement"
	^ SpBoxLayout newTopToBottom 
		add: (SpGridLayout build: [ :builder |
				builder
					add: 'Référence du produit :'; add: reference_produitTextInput; nextRow;
					add: 'Numéro de lot :'; add: numero_lotNumberImput; nextRow;
					add: 'Nom du produit :'; add: nom_produitTextImput ; nextRow;
					add: 'Date de livraison :'; add: date_livraisonDateImput ; nextRow;
					add: 'Marque :'; add: marqueTextImput; nextRow;
					add: 'Nombre d unités du lot'; add: nombre_unitesNumberImput; nextRow;
					add: 'Coût unitaire'; add: cout_uniteNumberImput; nextRow;
					add: 'Taux de marge'; add: taux_margeNumberImput; nextRow;
					"add: 'Total'; add: totalCalculImput ; nextRow; (Pas intégré car elle ne s'actualise pas"
					
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
			add: listButton;
			yourself)
	
		expand: false;
		
		yourself   
]

{ #category : #'model updates' }
Formulaire_Entree_Stock >> fillFormWithWorkingModel [
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
	"self totalCalculImput: aModel total asString. (pas intégré car impossible de l'actualisé"
	(siteButtons at: aModel site) state: true.
	"self itemsInput selectItems: self workingModel selectedItems"
]

{ #category : #'model updates' }
Formulaire_Entree_Stock >> fillModelWithFormContent [
	
	"Formatage des types de données"
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
Formulaire_Entree_Stock >> geneveButton [
	^geneveButton.
]

{ #category : #initialization }
Formulaire_Entree_Stock >> initializePresenters [
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
	"totalCalculImput := self newTextInput
		editable: false."
	
	
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
 
	"Bouton d'actions"
	submitButton  := self newButton label: 'Ajouter'.
	restoreButton := self newButton label: 'Réinitialiser'.
	cancelButton := self newButton label: 'Fermer & Annuler'.
	listButton := self newButton label: 'Catalogue'.
	
	self initializeStock.
	
	
	
	


]

{ #category : #initialization }
Formulaire_Entree_Stock >> initializeStock [
	
	"Initalisation de la classe Stock"
	stock := Stock new.
	Transcript show: 'La liste a été crée !'

]

{ #category : #initialization }
Formulaire_Entree_Stock >> initializeWindow: aWindowPresenter [
	"Cela permet d'ouvrir la fenêtre avec des options pré-définie"
	aWindowPresenter
		initialExtent: 650@600.
	aWindowPresenter title: 'Entreprise LesGâteauxEnchantées - Formulaire de Stock'.
]

{ #category : #accessing }
Formulaire_Entree_Stock >> itemsInput [
	^ itemsInput
]

{ #category : #modifying }
Formulaire_Entree_Stock >> itemsInput: anObject [
	itemsInput := anObject.
]

{ #category : #transitions }
Formulaire_Entree_Stock >> list [

	Transcript show: 'La liste a été ouverte !';cr.
	self listModel.
]

{ #category : #'as yet unclassified' }
Formulaire_Entree_Stock >> listButton [
	^ listButton
]

{ #category : #accessing }
Formulaire_Entree_Stock >> listButton: anObject [.
	listButton := anObject.
]

{ #category : #accessing }
Formulaire_Entree_Stock >> listModel [
	"Cette méthode permet d'accéder au catalogue"
	Liste_Marque open.

]

{ #category : #accessing }
Formulaire_Entree_Stock >> marqueTextImput [
	^ marqueTextImput.
]

{ #category : #modifying }
Formulaire_Entree_Stock >> marqueTextImput: anObject [
	marqueTextImput := anObject. 
]

{ #category : #initialization }
Formulaire_Entree_Stock >> modelChanged [

	workingModel := self model copy.

	self fillFormWithWorkingModel.

]

{ #category : #accessing }
Formulaire_Entree_Stock >> nom_produitTextImput [
	^ nom_produitTextImput.
]

{ #category : #modifying }
Formulaire_Entree_Stock >> nom_produitTextImput: anObject [
	nom_produitTextImput := anObject.
]

{ #category : #accessing }
Formulaire_Entree_Stock >> nombre_unitesNumberImput [
	^ nombre_unitesNumberImput 
]

{ #category : #modifying }
Formulaire_Entree_Stock >> nombre_unitesNumberImput: anObject [
	nombre_unitesNumberImput := anObject.
]

{ #category : #accessing }
Formulaire_Entree_Stock >> numero_lotNumberImput [
	^ numero_lotNumberImput.
]

{ #category : #modifying }
Formulaire_Entree_Stock >> numero_lotNumberInput: anObject [
	numero_lotNumberImput := anObject.
]

{ #category : #accessing }
Formulaire_Entree_Stock >> reference_produitTextInput [
	^ reference_produitTextInput
]

{ #category : #modifying }
Formulaire_Entree_Stock >> reference_produitTextInput: anObject [
	reference_produitTextInput := anObject.
]

{ #category : #'window management' }
Formulaire_Entree_Stock >> restore [
	"Action pour remettre le formulaire à l'état d'origine"
	self modelChanged.
	Transcript show: '> Le formulaire a été réinitialisé !'; cr;cr.
]

{ #category : #accessing }
Formulaire_Entree_Stock >> restoreButton [
	^ restoreButton
]

{ #category : #modifying }
Formulaire_Entree_Stock >> restoreButton: anObject [
	restoreButton := anObject.
]

{ #category : #accessing }
Formulaire_Entree_Stock >> saintetienneButton [
	^saintetienneButton
]

{ #category : #submit }
Formulaire_Entree_Stock >> submit [
	
	"Méthode qui lance la production d'une classe Produit"
	self writeProduit.
	
	
	"Restauration du modèle de base"
	self model: workingModel.
	self announcingObject valueChanged.
	
	self fillModelWithFormContent.
	
	Transcript show: ('> La demande a été soumis !');cr.
	
	

	

]

{ #category : #accessing }
Formulaire_Entree_Stock >> submitButton [
	^ submitButton.
]

{ #category : #modifying }
Formulaire_Entree_Stock >> submitButton: anObject [
	submitButton := anObject.
]

{ #category : #accessing }
Formulaire_Entree_Stock >> taux_margeNumberImput [
	^ taux_margeNumberImput 
]

{ #category : #modifying }
Formulaire_Entree_Stock >> taux_margeNumberImput: anObject [
	taux_margeNumberImput := anObject.
]

{ #category : #accessing }
Formulaire_Entree_Stock >> totalCalculImput [
 ^ (((self nombre_unitesNumberImput number) * (1 + (self taux_margeNumberImput number) * (self cout_uniteNumberImput number))) printString)
]

{ #category : #modifying }
Formulaire_Entree_Stock >> totalCalculImput: anObject [
	totalCalculImput := anObject.

]

{ #category : #accessing }
Formulaire_Entree_Stock >> workingModel [
	^ workingModel
]

{ #category : #modifying }
Formulaire_Entree_Stock >> workingModel: anObject [
	workingModel := anObject
	
]

{ #category : #writing }
Formulaire_Entree_Stock >> writeProduit [

	"Processus de création d'un produit"

	|nouveau|	
	
	nouveau := Produit new.
	
	"Rentrage des information que l'on a rentré sur le formulaire"
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
	
	"Entrée dans le stock de produit avec toutes les informations"
	stock contient: nouveau.
	
	Transcript show: ('Produit pris en compte !'); cr.

]