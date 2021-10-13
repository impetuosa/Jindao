"
I do represent the body of a query. I can get the sql definition 
"
Class {
	#name : #JinQueryBody,
	#superclass : #JinBodyObject,
	#category : #'Jindao-Core'
}

{ #category : #'as yet unclassified' }
JinQueryBody >> fields [
	^ JinCollection newDefault
		handle: (handle propertyNamed: #Fields)
			factory:
			(JinRemoteObjectOnlyGenericsFactory new
				defaultHierarchyClass: JinAccessTableField;
				yourself);
		yourself
]

{ #category : #'as yet unclassified' }
JinQueryBody >> sql [
	^ handle propertyNamed: #SQL
]
