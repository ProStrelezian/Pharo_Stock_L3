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
]

{ #category : #initialization }
Stock >> initialize [
		contient := OrderedCollection new.
		numero := (2**32) atRandom.
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

Transcript show: ('La méthode WriteDB a été activé !'); cr.
"Transcript show: (self numero)."

n := ('data/database_', (self numero) printString,'_',((Date today) year) printString,'_',((Date today) monthIndex) printString,'_',((Date today) dayOfMonth) printString, '.json').

"n := ('data/database_', (self numero) printString,'_',((Date today) year) printString,'_',((Date today) monthIndex) printString,'_',((Date today) dayOfMonth) printString, '.csv')."

"Transcript show: n printString."

x := (n) asFileReference. "Création du fichier"

x exists. "Vérifier si ça existe"

x extension.

s := x writeStream. "Créer un write Stream pour pouvoir écrirededans"

"s nextPutAll: ('Référence_Produit;Numéro_de_Lot;Nom_du_Produit;Date_de_Livraison;Marque;Nombre_Unités;Cout_Unitaire;Taux_Marge;Total;Site_de_Production');cr.
(self unAnnuairedeProduit ) do: [ :chaqueProduit |
s nextPutAll: ((chaqueProduit reference)).
s nextPutAll: ';'.
s nextPutAll: ((chaqueProduit lot)).
s nextPutAll: ';'.
s nextPutAll: ((chaqueProduit nom)).
s nextPutAll: ';'.
s nextPutAll: ((chaqueProduit livraison)printString).
s nextPutAll: ';'.
s nextPutAll: ((chaqueProduit marque)).
s nextPutAll: ';'.
s nextPutAll: ((chaqueProduit nb_unites)).
s nextPutAll: ';'.
s nextPutAll: ((chaqueProduit cout)).
s nextPutAll: ';'.
s nextPutAll: ((chaqueProduit taux_marge)).
s nextPutAll: ';'.
s nextPutAll: ((chaqueProduit total)).
s nextPutAll: ';'.
s nextPutAll: ((chaqueProduit site)).
s nextPutAll: ';';cr.]."

s nextPutAll: '['.
(self unAnnuairedeProduit ) do: [ :chaqueProduit | 
	s nextPutAll: '{"Référence": "',(chaqueProduit reference), '"',',"Numéro de lot": "',(chaqueProduit lot), '"',',"Nom du produit": "',(chaqueProduit nom), '"',',"Date de livraison": "',(chaqueProduit livraison) printString, '"',',"Marque": "',(chaqueProduit marque), '"',',"Nombre unités": "',(chaqueProduit nb_unites), '"',',"Coût unitaire": "',(chaqueProduit cout), '"',',"Taux de marque": "',(chaqueProduit taux_marge), '"',',"Total": "',(chaqueProduit total), '"',',"Site de production": "', (chaqueProduit site), '"},'].
s nextPutAll:']'.

"b := x readStream.
b next."


s close. "Fermeture"
]
