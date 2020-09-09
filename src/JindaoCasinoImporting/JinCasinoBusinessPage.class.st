Class {
	#name : #JinCasinoBusinessPage,
	#superclass : #CSNBusinessPage,
	#category : #JindaoCasinoImporting
}

{ #category : #'as yet unclassified' }
JinCasinoBusinessPage >> addWidget: aWidget [
	self mainContainer addWidget: aWidget
]

{ #category : #'as yet unclassified' }
JinCasinoBusinessPage >> mainContainer [
	^ self widgets first
]

{ #category : #'as yet unclassified' }
JinCasinoBusinessPage >> mainContainer: aContainer [
	self assert: self widgets isEmpty.
	super addWidget: aContainer
]

{ #category : #'as yet unclassified' }
JinCasinoBusinessPage >> mainContainerWidgets [
	^ self mainContainer layout cell collect: [ :f | f widget ]
]

{ #category : #'as yet unclassified' }
JinCasinoBusinessPage >> section: anInteger [
	| container |
	^ self mainContainerWidgets
		detect: [ :c | 
			c isContainer
				and: [ (c propertyNamed: 'SectionID') = anInteger asString ] ]
		ifNone: [ container := CSNUIPanel new.
			container propertyNamed: 'SectionID' put: anInteger asString.
			self mainContainer addWidget: container.
			mooseModel add: container.
			container ]
]
