Class {
	#name : #JinReport,
	#superclass : #JinForm,
	#category : #'Jindao-Core'
}

{ #category : #accessing }
JinReport class >> typeNumber [
	^ 3
]

{ #category : #'as yet unclassified' }
JinReport >> acceptVisitor: aVisitor [
	aVisitor visitReport: self 
]

{ #category : #'as yet unclassified' }
JinReport >> createControl: aName type: aTypeNumber section: aSection [
	^ project
		createControl: aName
		inReport: self 
		type: aTypeNumber
		section: aSection
]

{ #category : #'as yet unclassified' }
JinReport >> name: aString [ 
	description name: aString 
]

{ #category : #accessing }
JinReport >> privateLoadBodyObject [
	^ (project openReport: self)
]

{ #category : #'as yet unclassified' }
JinReport >> vbeComponentName [
	^ 'Report_' , self name
]
