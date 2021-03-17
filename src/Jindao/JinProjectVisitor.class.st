Class {
	#name : #JinProjectVisitor,
	#superclass : #JinSubvisitor,
	#category : #'Jindao-Subvisitor'
}

{ #category : #'visit-first-objects' }
JinProjectVisitor >> project [
	^ self
]

{ #category : #'visit-first-objects' }
JinProjectVisitor >> visitHandleObject: aJinReference [
	" Nothing to do "
]

{ #category : #'visit-first-objects' }
JinProjectVisitor >> visitProject: aJinAccessProject [
	self visitCollection: aJinAccessProject references.
	self visitCollection: aJinAccessProject tables.
	self visitCollection: aJinAccessProject queries.
	self visitCollection: aJinAccessProject modules.
	self visitCollection: aJinAccessProject reports.
	self visitCollection: aJinAccessProject forms.
	self visitCollection: aJinAccessProject relations
	"	self visitCollection: aJinAccessProject macros."
]

{ #category : #'visit-first-objects' }
JinProjectVisitor >> visitReference: aJinReference [
	self visitHandleObject: aJinReference
]
