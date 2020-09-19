Class {
	#name : #JinAngularProtoComponent,
	#superclass : #Object,
	#instVars : [
		'template',
		'behaviour',
		'name'
	],
	#category : #JindaoMoose
}

{ #category : #visiting }
JinAngularProtoComponent >> acceptVisitor: aVisitor [
	aVisitor visitAngularProtoComponent: self . 
	
]

{ #category : #accessing }
JinAngularProtoComponent >> behavior [

	^ behaviour ifNil: [ 
		  behaviour := JinAngularProtoComponentBehavior new ]
]

{ #category : #accessing }
JinAngularProtoComponent >> name [
	^ name
]

{ #category : #accessing }
JinAngularProtoComponent >> name: aString [ 
	name := aString 
]

{ #category : #accessing }
JinAngularProtoComponent >> template [
	^ template
]

{ #category : #accessing }
JinAngularProtoComponent >> template: aJinAngularProtoComponentTemplate [ 
	template := aJinAngularProtoComponentTemplate
]
