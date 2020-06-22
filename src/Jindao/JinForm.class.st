Class {
	#name : #JinForm,
	#superclass : #JinVBObject,
	#category : #'Jindao-Core'
}

{ #category : #accessing }
JinForm class >> typeNumber [
	^ 2
]

{ #category : #'as yet unclassified' }
JinForm >> acceptVisitor: aVisitor [
	aVisitor visitForm: self.
	
]

{ #category : #'as yet unclassified' }
JinForm >> addControl: aJinLabel [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
JinForm >> code [
	^ self body code
]

{ #category : #'as yet unclassified' }
JinForm >> controls [
	^ self body controls 
]

{ #category : #'as yet unclassified' }
JinForm >> createControl: aName type: aTypeNumber section: aSection [
	^ project
		createControl: aName
		inForm: self 
		type: aTypeNumber
		section: aSection
]

{ #category : #'as yet unclassified' }
JinForm >> createControl: aName type: aTypeNumber section: aSection parent: aParentName [
	^ project
		createControl: aName
		inForm: self
		type: aTypeNumber
		section: aSection
		parent: aParentName
]

{ #category : #'as yet unclassified' }
JinForm >> description [
	^ description
]

{ #category : #'as yet unclassified' }
JinForm >> ensureItHasNonPageHeaderFooter [
	^ project ensureItHasNonPageHeaderFooter: self 
]

{ #category : #'as yet unclassified' }
JinForm >> hasHeaderFooter [
	^ self body hasHeaderFooter
]

{ #category : #'as yet unclassified' }
JinForm >> hasModule [
	^ self body hasModule
]

{ #category : #'as yet unclassified' }
JinForm >> hasPageHeaderFooter [
	^ self body hasPageHeaderFooter
]

{ #category : #'as yet unclassified' }
JinForm >> height [
	^ self body height 
]

{ #category : #'as yet unclassified' }
JinForm >> height: anInteger [
	self body height: anInteger
]

{ #category : #'as yet unclassified' }
JinForm >> installHeaderFooter [
	^ project installHeaderFooterOn: self
]

{ #category : #'as yet unclassified' }
JinForm >> installPageHeaderFooter [
	^ project ensurePageHeaderFooter: self 
]

{ #category : #'as yet unclassified' }
JinForm >> module [
	^ self body module
]

{ #category : #accessing }
JinForm >> privateLoadBodyObject [
	^ (project openForm: self)
]

{ #category : #accessing }
JinForm >> vbeComponentName [
	^ 'Form_' , self name
]

{ #category : #'as yet unclassified' }
JinForm >> width [
	^ self body width
]

{ #category : #'as yet unclassified' }
JinForm >> width: anInteger [
	self body width: anInteger
]
