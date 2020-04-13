Class {
	#name : #JinAccessNorwindModuleInventory,
	#superclass : #JinNorwindBasedTests,
	#category : #Jindao
}

{ #category : #tests }
JinAccessNorwindModuleInventory >> testModuleInventoryIsAvailable [ 
	self assert: (project modules at: 4) name equals: #Inventory 
]
