Class {
	#name : #Stock,
	#superclass : #Object,
	#instVars : [
		'contient',
		'numero'
	],
	#category : #'S6_Riviere_Kilian_LogicielDeStock'
}

{ #category : #accessing }
Stock >> contient: unProduit [
	(self unAnnuairedeProduit) add: unProduit.
	self writeDB.
	self writejson.
]

{ #category : #initialization }
Stock >> initialize [

		"Cette classe permet de créer un stock qui permet de créer une base de donnée"
		contient := OrderedCollection new.
		numero := (2**24) atRandom. "Génération d'un numéro aléatoire"
]

{ #category : #accessing }
Stock >> numero [
	^numero
]

{ #category : #accessing }
Stock >> numero: unNombre [
	numero := unNombre.
]

{ #category : #'as yet unclassified' }
Stock >> unAnnuairedeProduit [
	^contient.
]

{ #category : #writing }
Stock >> writeDB [

|x s n|

"Première façon de créer un database en .json"
Transcript show: ('La méthode WriteDB a été activé !'); cr.

"Chemin d'accès du fichier"
n := ('data/basic_database_', (self numero) printString,'_',((Date today) year) printString,'_',((Date today) monthIndex) printString,'_',((Date today) dayOfMonth) printString, '.json').

"Transcript show: ((n) printstring)"


x := (n) asFileReference. "Création du fichier"

x exists. "Vérifier si ça existe"

x extension.

s := x writeStream. "Créer un write Stream pour pouvoir écrire dedans"

"Boucle d'une création d'une ligne"
s nextPutAll: '['.
(self unAnnuairedeProduit ) do: [ :chaqueProduit | 
	s nextPutAll: '{"Référence": "',(chaqueProduit reference), '"',',"Numéro de lot": "',(chaqueProduit lot), '"',',"Nom du produit": "',(chaqueProduit nom), '"',',"Date de livraison": "',(chaqueProduit livraison) printString, '"',',"Marque": "',(chaqueProduit marque), '"',',"Nombre unités": "',(chaqueProduit nb_unites), '"',',"Coût unitaire": "',(chaqueProduit cout), '"',',"Taux de marque": "',(chaqueProduit taux_marge), '"',',"Total": "',(chaqueProduit total), '"',',"Site de production": "', (chaqueProduit site), '"},'].
s nextPutAll:']'.


s close. "Fermeture"
]

{ #category : #'as yet unclassified' }
Stock >> writejson [
	|jsonRef stream fichier string n|
	
"Première façon de créer un database en .json"
Transcript show: ('La méthode WriteJSON a été activé !'); cr.

"Chemin d'accès du fichier"
	n := ('data/advanced_database_', (self numero) printString,'_',((Date today) year) printString,'_',((Date today) monthIndex) printString,'_',((Date today) dayOfMonth) printString, '.json').
	
	fichier := (n) asFileReference. "Création du fichier"
	
	fichier exists. "Voir si elle existe."
	fichier extension.
	
	stream := fichier writeStream. "Créer un write Stream pour pouvoir écrire dedans"
	
"Création d'un dictionnaire pour intégrer dans un document le stock"
(self unAnnuairedeProduit)	do: [ :chaqueProduit |
		jsonRef := Dictionary new
		  at: 'Date' put: ((Date today) asString);
		  at: 'Référence' put: ((chaqueProduit reference) asString);
		  at: 'Lot' put: (chaqueProduit lot) asString;
		  at: 'Nom' put: (chaqueProduit nom) asString;
		  at: 'Date de Livraison' put: (chaqueProduit livraison) asString;
		  at: 'Marque' put: (chaqueProduit marque) asString;
		  at: 'Nombre d unités' put: (chaqueProduit nb_unites) asString; 
		  at: 'Coût unitaire' put: (chaqueProduit cout) asString; 
		  at: 'Taux de marge' put: (chaqueProduit taux_marge) asString; 
		  at: 'Total' put: (chaqueProduit total) asString;
		  at: 'Site' put: (chaqueProduit site) asString; 
		yourself. 
		string := STONJSON toString: jsonRef.
		stream nextPutAll: string.
		stream nextPutAll: ',';cr.] .
		
		"jsonRef inspect."

"Fermeture du fichier"		
stream close.
]
