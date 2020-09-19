Class {
	#name : #JinAngularProtoComponent,
	#superclass : #Object,
	#instVars : [
		'module',
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
JinAngularProtoComponent >> behavior: aJinTypescriptClass [

	behaviour := aJinTypescriptClass
]

{ #category : #accessing }
JinAngularProtoComponent >> module: aModule [

	module := aModule
]

{ #category : #accessing }
JinAngularProtoComponent >> name [
	^ name
]

{ #category : #accessing }
JinAngularProtoComponent >> name: aString [ 
	name := aString 
]

{ #category : #actions }
JinAngularProtoComponent >> save [

	| ref |
	self assert: (module components includes: self).
	ref := module path / ('{1}.component.ts' format: { name }).
	self assert: ref exists not.
	ref writeStream
		nextPutAll: behaviour sourceCode;
		close.
	ref := module path / ('{1}.component.html' format: { name }).
	self assert: ref exists not.
	ref writeStream
		nextPutAll: template sourceCode;
		close.
	module components remove: self
]

{ #category : #accessing }
JinAngularProtoComponent >> template [
	^ template
]

{ #category : #accessing }
JinAngularProtoComponent >> template: aJinAngularProtoComponentTemplate [ 
	template := aJinAngularProtoComponentTemplate
]
