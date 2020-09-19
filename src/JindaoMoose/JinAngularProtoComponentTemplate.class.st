Class {
	#name : #JinAngularProtoComponentTemplate,
	#superclass : #Object,
	#instVars : [
		'contents'
	],
	#category : #JindaoMoose
}

{ #category : #visiting }
JinAngularProtoComponentTemplate >> acceptVisitor: aJinViewportPageBuilder [

	aJinViewportPageBuilder visitAngularProtoComponentTemplate: self
]

{ #category : #accessing }
JinAngularProtoComponentTemplate >> ast [
	^ XMLHTMLParser parse: contents
]

{ #category : #accessing }
JinAngularProtoComponentTemplate >> contents: aString [ 
	contents := aString
]

{ #category : #accessing }
JinAngularProtoComponentTemplate >> name [
	^ 'Template'
]

{ #category : #accessing }
JinAngularProtoComponentTemplate >> sourceCode [

	^ contents
]
