Class {
	#name : #JinAngularComponent,
	#superclass : #JinAngularContainer,
	#instVars : [
		'name'
	],
	#category : #JindaoAngular
}

{ #category : #visiting }
JinAngularComponent >> acceptVisitor: aJinInspectorBuilder [ 
	aJinInspectorBuilder visitAngularComponent: self 
]

{ #category : #accessing }
JinAngularComponent >> behavior [

	^ JinAngularComponentBehaviour new
		  path: path / (name , '.component.ts');
		  name: name;
		  yourself
]

{ #category : #accessing }
JinAngularComponent >> name [
	^ name
]

{ #category : #accessing }
JinAngularComponent >> name: aString [ 
	name := aString
]

{ #category : #generated }
JinAngularComponent >> template [

	^ JinAngularComponentTemplate new 
		  path: path / (name , '.component.html ');
		  name: name;
		  yourself
]
