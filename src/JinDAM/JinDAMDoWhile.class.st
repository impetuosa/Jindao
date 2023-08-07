"
I represent a while statement 
"
Class {
	#name : #JinDAMDoWhile,
	#superclass : #JinDAMLoop,
	#category : #'JinDAM-Model'
}

{ #category : #visiting }
JinDAMDoWhile >> accept: aMOJinDAMImporter [

	^ aMOJinDAMImporter visitDoWhile: self
]
