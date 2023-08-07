"
I represent a file input statement 
"
Class {
	#name : #JinDAMFileLineInput,
	#superclass : #JinDAMEntity,
	#instVars : [
		'fileDescriptorReference',
		'inputReference'
	],
	#category : #'JinDAM-Model'
}

{ #category : #visiting }
JinDAMFileLineInput >> accept: aMOJinDAMImporter [

	^ aMOJinDAMImporter visitFileLineInput: self
]

{ #category : #accessing }
JinDAMFileLineInput >> fileDescriptorReference [
	^ fileDescriptorReference
]

{ #category : #accessing }
JinDAMFileLineInput >> fileDescriptorReference: aJinDAMAccessRead [ 
	fileDescriptorReference := aJinDAMAccessRead
]

{ #category : #accessing }
JinDAMFileLineInput >> inputReference [
	^ inputReference
]

{ #category : #accessing }
JinDAMFileLineInput >> inputReference: aJinDAMAccessRead [ 
	inputReference := aJinDAMAccessRead
]
