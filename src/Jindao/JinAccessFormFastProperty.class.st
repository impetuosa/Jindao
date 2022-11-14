Class {
	#name : #JinAccessFormFastProperty,
	#superclass : #JinAccessFastProperty,
	#category : #'Jindao-Core'
}

{ #category : #accessing }
JinAccessFormFastProperty >> value [

	^ accessObject handle propertyNamed: name 
]
