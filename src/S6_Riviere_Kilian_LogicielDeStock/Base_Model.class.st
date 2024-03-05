Class {
	#name : #'Base_Model',
	#superclass : #Object,
	#instVars : [
		'reference_produit',
		'numero_lot',
		'nom_produit',
		'marque',
		'date_livraison',
		'nombre_unites',
		'cout_unite',
		'taux_marge',
		'total',
		'site',
		'selectedItems'
	],
	#category : #'S6_Riviere_Kilian_LogicielDeStock'
}

{ #category : #accessing }
Base_Model >> cout_unite [
	^cout_unite 
]

{ #category : #accessing }
Base_Model >> cout_unite: anObject [
	cout_unite := anObject.
]

{ #category : #accessing }
Base_Model >> date_livraison [
	^date_livraison.
]

{ #category : #accessing }
Base_Model >> date_livraison: anObject [
	date_livraison := anObject.
]

{ #category : #'tests - printing' }
Base_Model >> elements [
	^ { 
		'reference_produit' -> self reference_produit.
		'numero_lot' -> self numero_lot.
		'nom_produit' -> self nom_produit.
		'date_livraison' -> self date_livraison.
		'marque' -> self marque.
		'nombre_unites_lot' -> self nombre_unites.
		'cout_une_unite' -> self cout_unite.
		
		'items' -> self selectedItems.
		}
]

{ #category : #initialization }
Base_Model >> initialize [
	
	|txt|
	
	"Cette classe permet d'avoir les valeurs par défaut du formulaire"
	super initialize.
	"Ce sont les valeurs par défaut du formulaire"
	reference_produit := ''.
	numero_lot := 1.
	nom_produit := ''.
	date_livraison := (Date today).
	marque := ''.
	nombre_unites := 20.
	cout_unite := 0.01.
	taux_marge := 0.
	site := #Annecy.
	selectedItems := { self items at: 2. self items at: 3. self items at: 4 }.
	
	txt := 'database.txt' asFileReference.
	txt exists.
	txt extension.
	
]

{ #category : #accessing }
Base_Model >> items [

	^ #('item 1' 'item 2' 'item 3' 'item 4' 'item 5')
]

{ #category : #accessing }
Base_Model >> marque [
	^marque.
]

{ #category : #accessing }
Base_Model >> marque: anObject [
	marque := anObject
]

{ #category : #accessing }
Base_Model >> nom_produit [
	^nom_produit. 
]

{ #category : #accessing }
Base_Model >> nom_produit: anObject [
	nom_produit := anObject.
]

{ #category : #accessing }
Base_Model >> nombre_unites [
	^ nombre_unites
]

{ #category : #accessing }
Base_Model >> nombre_unites: anObject [
	nombre_unites := anObject.
]

{ #category : #accessing }
Base_Model >> numero_lot [
	^ numero_lot 
]

{ #category : #accessing }
Base_Model >> numero_lot: anObject [
	numero_lot := anObject.
]

{ #category : #accessing }
Base_Model >> reference_produit [
	^ reference_produit
]

{ #category : #accessing }
Base_Model >> reference_produit: anObject [
	reference_produit := anObject
]

{ #category : #accessing }
Base_Model >> selectedItems [
	^ selectedItems
]

{ #category : #accessing }
Base_Model >> selectedItems: anObject [
	selectedItems := anObject asArray.
]

{ #category : #accessing }
Base_Model >> site [
	^ site
]

{ #category : #accessing }
Base_Model >> site: anObject [
	site := anObject
]

{ #category : #'as yet unclassified' }
Base_Model >> sites [
	^ #(Annecy Genève Bergerac Avignon Saint-Étienne)
]

{ #category : #accessing }
Base_Model >> taux_marge [
	^taux_marge
]

{ #category : #accessing }
Base_Model >> taux_marge: anObject [
	taux_marge := anObject
]

{ #category : #accessing }
Base_Model >> total [
	^	((nombre_unites) * (cout_unite) * (1 + taux_marge))
]

{ #category : #accessing }
Base_Model >> total: anObject [
	total := anObject.
]
