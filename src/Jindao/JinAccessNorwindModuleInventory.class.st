Class {
	#name : #JinAccessNorwindModuleInventory,
	#superclass : #JinNorwindBasedTests,
	#category : #'Jindao-Tests'
}

{ #category : #tests }
JinAccessNorwindModuleInventory >> testInventoryHas27DefinedElements [
	self
		assert:
			(project modules detect: [ :m | m name = #Inventory ]) code
				amountOfElements
		equals: 27
]

{ #category : #tests }
JinAccessNorwindModuleInventory >> testInventoryHas310Lines [
	self
		assert:
			(project modules detect: [ :m | m name = #Inventory ]) code  amountOfLines
		equals: 310
]

{ #category : #tests }
JinAccessNorwindModuleInventory >> testInventoryTextCode [
	self
		assert: (project modules detect: [ :m | m name = #Inventory ]) code isNotEmpty.
]

{ #category : #tests }
JinAccessNorwindModuleInventory >> testModuleInventoryIsAvailable [
	self
		assert: (project modules detect: [ :m | m name = #Inventory ]) name
		equals: #Inventory.
		
]
