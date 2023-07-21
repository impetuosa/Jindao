"
I do represent the body of a query. I can get the sql definition 
"
Class {
	#name : #JinQueryBody,
	#superclass : #JinBodyObject,
	#category : #'Jindao-MSAccess-Database'
}

{ #category : #'as yet unclassified' }
JinQueryBody >> fields [
	^ JinCollection newDefault
		handle: (handle propertyNamed: #Fields)
			factory:
			(JinRemoteObjectSingleClassFactory new
				defaultHierarchyClass: JinAccessTableField;
				yourself);
		yourself
]

{ #category : #'as yet unclassified' }
JinQueryBody >> sql [
	^ handle propertyNamed: #SQL
]
