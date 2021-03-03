Class {
	#name : #BaselineOfJindao,
	#superclass : #BaselineOf,
	#category : #BaselineOfJindao
}

{ #category : #baselines }
BaselineOfJindao >> baseline: spec [
	<baseline>
	spec
		baseline: 'PharoWin32'
		with: [ spec repository: 'github://tesonep/pharo-com' ].
	spec
		baseline: 'VBParser'
		with: [ spec repository: 'github://impetuosa/VBParser' ].
	spec
		package: 'Jindao'
		with: [ spec requires: #(PharoWin32 VBParser) ]
]
