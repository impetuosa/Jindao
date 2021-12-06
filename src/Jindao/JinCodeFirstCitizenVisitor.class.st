Class {
	#name : #JinCodeFirstCitizenVisitor,
	#superclass : #JinSubvisitor,
	#category : #'Jindao-Subvisitor'
}

{ #category : #'as yet unclassified' }
JinCodeFirstCitizenVisitor >> code [
	^ self
]

{ #category : #'as yet unclassified' }
JinCodeFirstCitizenVisitor >> visitFormModule: aJinFormModule [
	self visitModule: aJinFormModule
]

{ #category : #'as yet unclassified' }
JinCodeFirstCitizenVisitor >> visitMacro: aMacro [
]

{ #category : #'as yet unclassified' }
JinCodeFirstCitizenVisitor >> visitModule: aJinModule [
	aJinModule code acceptVisitor: self
]
