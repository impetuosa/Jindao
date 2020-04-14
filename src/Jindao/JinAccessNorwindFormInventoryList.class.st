Class {
	#name : #JinAccessNorwindFormInventoryList,
	#superclass : #JinNorwindBasedTests,
	#category : #Jindao
}

{ #category : #tests }
JinAccessNorwindFormInventoryList >> testFormInventoryListIsAvailable [
	self
		assert: (project forms detect: [ :m | m name = 'Inventory List' ]) name
		equals: 'Inventory List'.
		
]

{ #category : #tests }
JinAccessNorwindFormInventoryList >> testInventoryHas13Lines [
	self
		assert:
			(project forms detect: [ :m | m name = 'Inventory List' ]) code  amountOfLines
		equals: 13
]
