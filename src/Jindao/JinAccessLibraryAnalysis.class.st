Class {
	#name : #JinAccessLibraryAnalysis,
	#superclass : #JinNorwindBasedTests,
	#category : #'Jindao-Tests'
}

{ #category : #convenience }
JinAccessLibraryAnalysis >> dao [

	^ self libraryNamed: #DAO
]

{ #category : #convenience }
JinAccessLibraryAnalysis >> libraryNamed: aName [

	^ project references detect: [ :r | 
		  r name asLowercase = aName asLowercase ]
]

{ #category : #tests }
JinAccessLibraryAnalysis >> testContainsReferenceToDAOLibrary [
	self assert: (self libraryNamed: #DAO) name equals: #DAO
]

{ #category : #tests }
JinAccessLibraryAnalysis >> testContainsReferenceToVBALibrary [

	self assert: (self libraryNamed: #VBA) name equals: #VBA
]

{ #category : #tests }
JinAccessLibraryAnalysis >> testDAOLibraryHasFunctions [

	self assert: self dao library functions size equals: 2
]

{ #category : #tests }
JinAccessLibraryAnalysis >> testDAOLibraryHasTypes [

	self assert: self dao library types size equals: 76
]

{ #category : #tests }
JinAccessLibraryAnalysis >> testProjectHasLibrariesAsReferences [

	self
		assert: (project references select: [ :r | r isLibrary ]) size
		equals: 6
]

{ #category : #tests }
JinAccessLibraryAnalysis >> testProjectHasReferences [

	self assert: project references size equals: 6
]

{ #category : #tests }
JinAccessLibraryAnalysis >> testVBALibraryHasFunctions [

	self assert: self vba library functions size equals: 600
]

{ #category : #tests }
JinAccessLibraryAnalysis >> testVBALibraryHasTypes [

	self assert: self vba library types size equals: 26
]

{ #category : #convenience }
JinAccessLibraryAnalysis >> vba [

	^ self libraryNamed: #VBA
]
