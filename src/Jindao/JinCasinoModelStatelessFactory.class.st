Class {
	#name : #JinCasinoModelStatelessFactory,
	#superclass : #Object,
	#category : #'Jindao-CasinoImporting'
}

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> importControl: aControl inTheContextOf: aWidget [ 
	^ aWidget addAttribute: (self importModelFrom: aControl) 
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> importForm: aForm inTheContextOf: aProject [
	^ JinPage new
		realClassName: aForm name;
		project: aProject;
		yourself
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> importModelFrom: aControl [
	^ aControl acceptVisitor: self. 
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> importProject: aProject [
	^ JinCasinoProject new
		name: aProject name;
		yourself
]
