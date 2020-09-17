Class {
	#name : #JinAngularContainer,
	#superclass : #JinAngularObject,
	#instVars : [
		'entities'
	],
	#category : #JindaoAngular
}

{ #category : #accessing }
JinAngularContainer >> entities [

	^ entities ifNil: [ entities := self privateGetEntities ]
]

{ #category : #accessing }
JinAngularContainer >> privateGetEntities [

	^ self subclassResponsibility
]
