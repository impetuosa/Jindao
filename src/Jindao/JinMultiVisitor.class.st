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
JinMultiVisitor >> visitForm: aJinForm [
	self gui visitForm: aJinForm .
	
]

{ #category : #'delegate to subvisitor' }
JinMultiVisitor >> visitFormControl: aJinControlObject [
	self control visitFormControl: aJinControlObject
]

{ #category : #'visit-first-objects' }
JinMultiVisitor >> visitHandleObject: aJinReference [ 
	" Leaf object arriving "
]

{ #category : #'delegate to subvisitor' }
JinMultiVisitor >> visitIndex: aJinIndexBody [
	self database visitIndex: aJinIndexBody
]

{ #category : #'delegate to subvisitor' }
JinMultiVisitor >> visitMacro: aMacro [
	self code visitMacro: aMacro
]

{ #category : #'delegate to subvisitor' }
JinMultiVisitor >> visitModule: aJinModule [
	self code visitModule: aJinModule
]

{ #category : #'visit-first-objects' }
JinMultiVisitor >> visitProject: aJinAccessProject [
	self visitCollection: aJinAccessProject references.
	self visitCollection: aJinAccessProject tables.
	self visitCollection: aJinAccessProject queries.
	self visitCollection: aJinAccessProject modules.
	self visitCollection: aJinAccessProject reports.
	self visitCollection: aJinAccessProject forms.
	self visitCollection: aJinAccessProject relations
	"	self visitCollection: aJinAccessProject macros."
]

{ #category : #'delegate to subvisitor' }
JinMultiVisitor >> visitQuery: aJinQuery [
	self database visitQuery: aJinQuery
]

{ #category : #'visit-first-objects' }
JinMultiVisitor >> visitReference: aJinReference [ 


	self visitHandleObject: aJinReference 
]

{ #category : #'delegate to subvisitor' }
JinMultiVisitor >> visitReport: aJinReport [
	self gui visitReport: aJinReport
]

{ #category : #'delegate to subvisitor' }
JinMultiVisitor >> visitTable: aJinTable [
	self database visitTable: aJinTable 

]

{ #category : #'delegate to subvisitor' }
JinMultiVisitor >> visitTableRelation: aJinTableRelation [
	self database visitTableRelation: aJinTableRelation
]
