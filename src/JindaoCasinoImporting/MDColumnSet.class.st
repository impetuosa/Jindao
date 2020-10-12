Class {
	#name : #MDColumnSet,
	#superclass : #MDDataContainer,
	#category : #JindaoCasinoImporting
}

{ #category : #'as yet unclassified' }
MDColumnSet >> compilableTypeIdentifier [
	^ (name copyReplaceAll: ' ' with: '') capitalized
]
