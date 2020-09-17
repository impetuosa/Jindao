Class {
	#name : #JinAngularNamedObject,
	#superclass : #JinAngularObject,
	#instVars : [
		'name'
	],
	#category : #JindaoAngular
}

{ #category : #accessing }
JinAngularNamedObject >> name [
	^ name
]

{ #category : #accessing }
JinAngularNamedObject >> name: aString [

	name := aString
]
