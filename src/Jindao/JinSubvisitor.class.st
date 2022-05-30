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

{ #category : #accessing }
JinSubvisitor >> instantiate: aClass [

	^ parent instantiate: aClass
]

{ #category : #accessing }
JinSubvisitor >> parent [ 
	^ parent 
]

{ #category : #accessing }
JinSubvisitor >> parent: aParent [ 
	 parent := aParent 
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

{ #category : #'instance creation' }
JinSubvisitor >> sdkLibrary [

	^ parent sdkLibrary
]

{ #category : #accessing }
JinSubvisitor >> state [ 	
	^ parent state
]

{ #category : #'instance creation' }
JinSubvisitor >> symbolTable [
	^ parent symbolTable 
]

{ #category : #accessing }
JinSubvisitor >> syntax [
	^ parent syntax
]
