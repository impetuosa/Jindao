Class {
	#name : #JinReportBody,
	#superclass : #JinFormBody,
	#category : #'Jindao-Core'
}

{ #category : #'as yet unclassified' }
JinReportBody >> name: aString [
	handle propertyNamed: #Name put: aString
]
