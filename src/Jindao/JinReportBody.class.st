"
I do represent a Report. A report contains controls and oftenly a related module with the related code. As well i have more grouplevels than a form 
"
Class {
	#name : #JinReportBody,
	#superclass : #JinFormBody,
	#category : #'Jindao-MSAccess-Widgets'
}

{ #category : #'as yet unclassified' }
JinReportBody >> componentKnownProperties [
	^ JinReport componentKnownProperties
]

{ #category : #'as yet unclassified' }
JinReportBody >> groupLevelNumber: anInteger [
	^ JinGroupLevel new
		handle: (handle propertyNamed: #GroupLevel withArguments: {anInteger});
		level: anInteger;
		yourself
]

{ #category : #'as yet unclassified' }
JinReportBody >> groupLevels [
	| collection |
	collection := OrderedCollection new.
	[ 0 to: 9 do: [ :i | collection add: (self groupLevelNumber: i) ] ]
		on: Win32Error
		do: [ :e | e passIfNotError0x80020009 ].
	^ collection
]

{ #category : #'as yet unclassified' }
JinReportBody >> name: aString [
	handle propertyNamed: #Name put: aString
]
