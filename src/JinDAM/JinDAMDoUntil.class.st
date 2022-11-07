Class {
	#name : #JinDAMDoUntil,
	#superclass : #JinDAMLoop,
	#category : #'JinDAM-Model'
}

{ #category : #visiting }
JinDAMDoUntil >> accept: aMOJinDAMImporter [

	^ aMOJinDAMImporter visitDoUntil: self
]
