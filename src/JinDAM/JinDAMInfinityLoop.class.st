"
I represent a an infinite loop statement 
"
Class {
	#name : #JinDAMInfinityLoop,
	#superclass : #JinDAMLoop,
	#category : #'JinDAM-Model'
}

{ #category : #visiting }
JinDAMInfinityLoop >> accept: aMOJinDAMImporter [

	^ aMOJinDAMImporter visitInfinityLoop: self
]
