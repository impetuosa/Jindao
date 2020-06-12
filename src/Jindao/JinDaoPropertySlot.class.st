Class {
	#name : #JinDaoPropertySlot,
	#superclass : #Slot,
	#instVars : [
		'propertyName',
		'propertyType'
	],
	#category : #'Jindao-Handles'
}

{ #category : #'meta-object-protocol' }
JinDaoPropertySlot >> read: anObject [
	^ propertyType new
		handle: (anObject handle propertyNamed: propertyName);
		parent: anObject;
		yourself
]

{ #category : #'meta-object-protocol' }
JinDaoPropertySlot >> write: aValue to: anObject [
	^ anObject handle propertyNamed: propertyName put: aValue
]
