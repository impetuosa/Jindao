Class {
	#name : #BaselineOfJinDao,
	#superclass : #BaselineOf,
	#category : #BaselineOfJinDao
}

{ #category : #baselines }
BaselineOfJinDao >> baseline: spec [
	spec
		baseline: 'PharoWin32'
		with: [ spec repository: 'github://tesonep/pharo-com' ].
	spec package: 'JinDao' with: [ spec requires: 'PharoWin32' ].
	spec group: 'default' with: #(JinDao)
]
