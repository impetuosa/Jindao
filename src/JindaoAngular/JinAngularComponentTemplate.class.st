Class {
	#name : #JinAngularComponentTemplate,
	#superclass : #JinAngularNamedObject,
	#category : #JindaoAngular
}

{ #category : #visiting }
JinAngularComponentTemplate >> acceptVisitor: aJinInspectorBuilder [ 
	aJinInspectorBuilder visitAngularComponentTemplate: self 
]

{ #category : #accessing }
JinAngularComponentTemplate >> ast [

	^ XMLHTMLParser parse: path readStream
]

{ #category : #accessing }
JinAngularComponentTemplate >> name [ 
	^ 'Template'
]

{ #category : #accessing }
JinAngularComponentTemplate >> sourceCode [
	^ path readStream upToEnd. 
]
