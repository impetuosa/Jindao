Class {
	#name : #JinSubvisitor,
	#superclass : #JinMultiVisitor,
	#instVars : [
		'parent'
	],
	#category : #'Jindao-Subvisitor'
}

{ #category : #'as yet unclassified' }
JinSubvisitor >> code [
	^ parent code
]

{ #category : #'as yet unclassified' }
JinSubvisitor >> control [
	^ parent control
]

{ #category : #accessing }
JinSubvisitor >> database [ 
	^ parent database
]

{ #category : #accessing }
JinSubvisitor >> firstClassCitizen [ 
	^ parent firstClassCitizen
]

{ #category : #'as yet unclassified' }
JinSubvisitor >> gui [
	^ parent gui
]

{ #category : #'as yet unclassified' }
JinSubvisitor >> project [
	^ parent project
]

{ #category : #accessing }
JinSubvisitor >> referenceAccess [
	^ parent referenceAccess
]

{ #category : #accessing }
JinSubvisitor >> referenceLibrary [ 
	^ parent referenceLibrary
]

{ #category : #accessing }
JinSubvisitor >> state [ 	
	^ parent state
]

{ #category : #accessing }
JinSubvisitor >> syntax [
	^ parent syntax
]
