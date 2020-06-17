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
JinReport >> addGroupLevel: anExpression header: aBoolean footer: anOtherBoolean [
	^ project
		createGroupLevel: self
		expression: anExpression
		header: aBoolean
		footer: anOtherBoolean
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
JinReport >> groupLevelNumber: anInteger [ 
	^ self body groupLevelNumber: anInteger 
]

{ #category : #'as yet unclassified' }
JinReport >> groupLevels [
	^ self body groupLevels 
]

{ #category : #'as yet unclassified' }
JinReport >> installHeaderFooter [
	^ project installReportHeaderFooterOn: self
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
