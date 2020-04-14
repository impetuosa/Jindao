Class {
	#name : #JinAccessNorwindModuleInventory,
	#superclass : #JinNorwindBasedTests,
	#category : #Jindao
}

{ #category : #tests }
JinAccessNorwindModuleInventory >> testInventoryTextCode [
	self
		assert: (project modules detect: [ :m | m name = #Inventory ]) code isNotEmpty
]

{ #category : #tests }
JinAccessNorwindModuleInventory >> testModuleInventoryIsAvailable [
	self
		assert: (project modules detect: [ :m | m name = #Inventory ]) name
		equals: #Inventory.
		
]
