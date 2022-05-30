Class {
	#name : #JinAccessNorwindFormInventoryList,
	#superclass : #JinNorwindBasedTests,
	#category : #'Jindao-Tests'
}

{ #category : #tests }
JinAccessNorwindFormInventoryList >> testFormInventoryListHas22Controls [ 
	self
		assert: (project forms detect: [ :m | m name = 'Inventory List' ]) controls size 
		equals: 22.
 
]

{ #category : #tests }
JinAccessNorwindFormInventoryList >> testFormInventoryListHasManyKindsOfControls [
	self
		assert:
			((project forms detect: [ :m | m name = 'Inventory List' ]) controls
				groupedBy: [ :c | c class ]) size
		equals: 4
]

{ #category : #tests }
JinAccessNorwindFormInventoryList >> testFormInventoryListIsAvailable [
	self
		assert: (project forms detect: [ :m | m name = 'Inventory List' ]) name
		equals: 'Inventory List'.
		
]

{ #category : #tests }
JinAccessNorwindFormInventoryList >> testInventoryListHas13Lines [
	self
		assert:
			(project forms detect: [ :m | m name = 'Inventory List' ]) code
				amountOfLines
		equals: 13
]
