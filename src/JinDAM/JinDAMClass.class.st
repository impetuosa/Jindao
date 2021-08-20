Class {
	#name : #JinDAMClass,
	#superclass : #JinDAMModule,
	#instVars : [
		'superClassReference'
	],
	#category : #'JinDAM-Model'
}

{ #category : #'as yet unclassified' }
JinDAMClass >> findAttributeInvocable: aString amountArguments: amount [

	| attrs n |
	attrs := super
		         findAttributeInvocable: aString
		         amountArguments: amount.
	attrs ifNotEmpty: [ ^ attrs ].

	superClassReference ifNotNil: [ 
		attrs := superClassReference candidate
			         findAttributeInvocable: aString
			         amountArguments: amount.
		attrs ifNotEmpty: [ ^ attrs ] ].
	name = '_TempVars' ifTrue: [ 
		self assert: amount = 0.
		n := JinDAMAttribute new
			     name: aString;
			     typeReference: (JinDAMTypeReference new
					      typeName: #Variant;
					      yourself);
			     yourself.
		attributes add: n.
		attrs add: n ].

	^ attrs
]

{ #category : #'as yet unclassified' }
JinDAMClass >> relatedSymbolKind [

	^ JinNSKind classModule
]

{ #category : #'as yet unclassified' }
JinDAMClass >> superClassReference [

	^ superClassReference
]

{ #category : #'as yet unclassified' }
JinDAMClass >> superClassReference: aSuperClassRef [
 	 superClassReference := aSuperClassRef 
]