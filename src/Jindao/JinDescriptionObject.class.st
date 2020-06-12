"
I am the tipical header of a First class citizen such as form modules, report etc.
"
Class {
	#name : #JinDescriptionObject,
	#superclass : #JinAccessObject,
	#category : #'Jindao-Core'
}

{ #category : #'as yet unclassified' }
JinDescriptionObject >> isLoaded [
	^ handle propertyNamed: #IsLoaded
]

{ #category : #accessing }
JinDescriptionObject >> name [
	^ handle propertyNamed: #Name
]
