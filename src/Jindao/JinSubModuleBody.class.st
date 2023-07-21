"
I am a module attached to a form. 
I do not belong to the main collection of modules accessible in project/ application.
I am only accessible through a form 
"
Class {
	#name : #JinSubModuleBody,
	#superclass : #JinModuleBody,
	#category : #'Jindao-MSAccess-Widgets'
}

{ #category : #'as yet unclassified' }
JinSubModuleBody >> acceptVisitor: aVisitor [
	aVisitor visitFormModule: self 
]

{ #category : #'as yet unclassified' }
JinSubModuleBody >> ensureUnload [
	" nothing to do here "
]

{ #category : #'as yet unclassified' }
JinSubModuleBody >> isClassModule [
	^ true
]
