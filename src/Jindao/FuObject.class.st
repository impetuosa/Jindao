Class {
	#name : #FuObject,
	#superclass : #Object,
	#instVars : [
		'success',
		'name',
		'children',
		'properties',
		'type',
		'errorText'
	],
	#category : #'Jindao-FuZhi'
}

{ #category : #accessing }
FuObject >> addChild: aChild [
	children add: aChild
]

{ #category : #accessing }
FuObject >> addProperty: aProperty [
	properties add: aProperty
]

{ #category : #accessing }
FuObject >> amountOfProperties [
	^ properties size - self amountPropertiesFailedByReadOnly 
]

{ #category : #accessing }
FuObject >> amountPropertiesFailed [
	^ self amountPropertiesFailedToReadSourceApplication
		+ self amountPropertiesFailedToWriteOnTarget
]

{ #category : #accessing }
FuObject >> amountPropertiesFailedByReadOnly [
	^ self propertiesFailedByReadOnly size
]

{ #category : #accessing }
FuObject >> amountPropertiesFailedToReadSourceApplication [
	^ self propertiesFailedToReadSourceApplication size
]

{ #category : #accessing }
FuObject >> amountPropertiesFailedToWriteOnTarget [
	^ self propertiesFailedToWriteOnTarget size
]

{ #category : #accessing }
FuObject >> children [
	^ children
]

{ #category : #accessing }
FuObject >> children: anObject [
	children := anObject
]

{ #category : #accessing }
FuObject >> errorText [
	^ errorText
]

{ #category : #accessing }
FuObject >> errorText: anObject [
	errorText := anObject
]

{ #category : #initialization }
FuObject >> initialize [
	self children: OrderedCollection new. 
	self properties: OrderedCollection new. 
]

{ #category : #accessing }
FuObject >> name [
	^ name
]

{ #category : #initialization }
FuObject >> name: aName [
	name := aName
]

{ #category : #accessing }
FuObject >> pctPropertyFailure [
	^ ((100 * (self amountPropertiesFailed)) / self amountOfProperties) asFloat
]

{ #category : #accessing }
FuObject >> pctPropertySuccess [
	^ 100 - self pctPropertyFailure 
]

{ #category : #accessing }
FuObject >> points [
	^ success = true
		ifTrue: [ children
				ifEmpty: [ self propertyPoints ]
				ifNotEmpty: [ self propertyPoints * 0.1
						+ (0.9 * (children collect: [ :c | c points ]) average) ] ]
		ifFalse: [ 0 ]
]

{ #category : #accessing }
FuObject >> printOn: aStream [
	aStream
		nextPutAll: type asString;
		nextPutAll: '[';
		nextPutAll: name asString;
		nextPutAll: '|';
		nextPutAll: self successString;
		nextPutAll: ']P:';
		nextPutAll: properties size asString;
		nextPutAll: 'C:';
		nextPutAll: children size asString
]

{ #category : #accessing }
FuObject >> properties [
	^ properties
]

{ #category : #accessing }
FuObject >> properties: anObject [
	properties := anObject
]

{ #category : #accessing }
FuObject >> propertiesFailedByReadOnly [
	^ properties select: [ :p | p errorText = 'Readonly property' ]
]

{ #category : #accessing }
FuObject >> propertiesFailedToReadSourceApplication [
	^ properties select: [ :p | p errorText = 'Failed to read from source application' ]
]

{ #category : #accessing }
FuObject >> propertiesFailedToWriteOnTarget [
	^ properties select: [ :p | p errorText = 'Failed to write to target application' ]
]

{ #category : #accessing }
FuObject >> propertyPoints [
	^ (properties isEmpty or: [ type = #NewRows ])
		ifTrue: [ 1 ]
		ifFalse: [ (properties collect: #points) average ]
]

{ #category : #accessing }
FuObject >> success [
	^ success
]

{ #category : #accessing }
FuObject >> success: anObject [
	success := anObject
]

{ #category : #accessing }
FuObject >> successString [
	success isString
		ifTrue: [ ^ success ].
	^ success
		ifTrue: [ 'OK' ]
		ifFalse: [ 'FAIL' ]
]

{ #category : #accessing }
FuObject >> type [
	^ type
]

{ #category : #accessing }
FuObject >> type: anObject [
	type := anObject
]
