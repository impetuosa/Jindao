Class {
	#name : #JinMultiVisitor,
	#superclass : #Object,
	#category : #'Jindao-Subvisitor'
}

{ #category : #'part visitor' }
JinMultiVisitor >> code [
	^ self subclassResponsibility
]

{ #category : #'part visitor' }
JinMultiVisitor >> control [
	^ self subclassResponsibility
]

{ #category : #'part visitor' }
JinMultiVisitor >> database [
	^ self subclassResponsibility
]

{ #category : #'part visitor' }
JinMultiVisitor >> firstClassCitizen [
	^ self subclassResponsibility
]

{ #category : #'part visitor' }
JinMultiVisitor >> gui [
	^ self subclassResponsibility
]

{ #category : #'part visitor' }
JinMultiVisitor >> project [
	^ self subclassResponsibility
]

{ #category : #'part visitor' }
JinMultiVisitor >> referenceAccess [
	^ self subclassResponsibility
]

{ #category : #'part visitor' }
JinMultiVisitor >> referenceLibrary [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
JinMultiVisitor >> state [
	^ self subclassResponsibility
]

{ #category : #'part visitor' }
JinMultiVisitor >> syntax [
	^ self subclassResponsibility 
]

{ #category : #'visit-first-objects' }
JinMultiVisitor >> visitAccessProperty: anAccessProperty [
	^ self visitHandleObject: anAccessProperty
]

{ #category : #'visit-first-objects' }
JinMultiVisitor >> visitCollection: aCollection [

	aCollection do: [ :element | element acceptVisitor: self ]
]

{ #category : #'delegate to subvisitor' }
JinMultiVisitor >> visitCustomControl: aJinControlObject [
	self control
		ifNotNil: [ :sv | sv visitCustomControl: aJinControlObject ]
]

{ #category : #'delegate to subvisitor' }
JinMultiVisitor >> visitForm: aJinForm [
	self gui ifNotNil: [ :sv | sv visitForm: aJinForm ]
]

{ #category : #'delegate to subvisitor' }
JinMultiVisitor >> visitFormControl: aJinControlObject [
	self control
		ifNotNil: [ :sv | sv visitFormControl: aJinControlObject ]
]

{ #category : #'entry-point' }
JinMultiVisitor >> visitFormModule: aJinFormModule [
	self code ifNotNil: [ :sv | sv visitFormModule: aJinFormModule ]
]

{ #category : #'visit-first-objects' }
JinMultiVisitor >> visitHandleObject: aJinReference [
	self project ifNotNil: [ :sv | sv visitHandleObject: aJinReference ]
]

{ #category : #'delegate to subvisitor' }
JinMultiVisitor >> visitIndex: aJinIndexBody [
	self database ifNotNil: [ :sv | sv visitIndex: aJinIndexBody ]
]

{ #category : #'delegate to subvisitor' }
JinMultiVisitor >> visitMacro: aMacro [
	self code ifNotNil: [ :sv | sv visitMacro: aMacro ]
]

{ #category : #'delegate to subvisitor' }
JinMultiVisitor >> visitModule: aJinModule [
	self code ifNotNil: [ :sv | sv visitModule: aJinModule ]
]

{ #category : #'visit-first-objects' }
JinMultiVisitor >> visitProject: aJinAccessProject [
	self project ifNotNil: [ :sv | sv visitProject: aJinAccessProject ]
]

{ #category : #'delegate to subvisitor' }
JinMultiVisitor >> visitQuery: aJinQuery [
	self database ifNotNil: [ :sv | sv visitQuery: aJinQuery ]
]

{ #category : #'visit-first-objects' }
JinMultiVisitor >> visitReference: aJinReference [
	self project ifNotNil: [ :sv | sv visitReference: aJinReference ]
]

{ #category : #'delegate to subvisitor' }
JinMultiVisitor >> visitReport: aJinReport [
	self gui ifNotNil: [ :sv | sv visitReport: aJinReport ].

]

{ #category : #'delegate to subvisitor' }
JinMultiVisitor >> visitSourceCode: aCode [
	self syntax ifNotNil: [ :sv | sv visitSourceCode: aCode ]
]

{ #category : #'delegate to subvisitor' }
JinMultiVisitor >> visitTable: aJinTable [
	self database ifNotNil: [ :sv | sv visitTable: aJinTable ]
]

{ #category : #'delegate to subvisitor' }
JinMultiVisitor >> visitTableRelation: aJinTableRelation [
	self database
		ifNotNil: [ :sv | sv visitTableRelation: aJinTableRelation ]
]
