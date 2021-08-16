Class {
	#name : #JinDAMFunction,
	#superclass : #JinDAMBehavioural,
	#instVars : [
		'typeReference',
		'typeAnchor'
	],
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMFunction >> relatedSymbolKind [

	^ JinNSKind function
]

{ #category : #accessing }
JinDAMFunction >> typeAnchor: aJinAnchor [ 
	typeAnchor := aJinAnchor
]

{ #category : #accessing }
JinDAMFunction >> typeReference [
	^ typeReference
]

{ #category : #accessing }
JinDAMFunction >> typeReference: aJinDAMTypeReference [

	typeReference := aJinDAMTypeReference
]
