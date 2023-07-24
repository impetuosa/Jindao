Class {
	#name : #JinAccessFormFastProperty,
	#superclass : #JinAccessFastProperty,
	#category : #'Jindao-MSAccess-ComponentProperties'
}

{ #category : #accessing }
JinAccessFormFastProperty >> value [

	^ accessObject handle propertyNamed: name 
]
