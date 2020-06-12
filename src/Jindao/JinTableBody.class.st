Class {
	#name : #JinTableBody,
	#superclass : #JinBodyObject,
	#instVars : [
		'fields'
	],
	#category : #'Jindao-Core'
}

{ #category : #'as yet unclassified' }
JinTableBody >> fields [
	^ fields
		ifNil: [ fields := JinCollection newDefault
				handle: (handle propertyNamed: #Fields)
				factory: (JinFirstClassCitizenModelFactory defaultFor: JinAccessTableField) ]
]
