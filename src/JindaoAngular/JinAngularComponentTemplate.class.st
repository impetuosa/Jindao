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
JinAngularComponentTemplate >> name [ 
	^ 'Template'
]
