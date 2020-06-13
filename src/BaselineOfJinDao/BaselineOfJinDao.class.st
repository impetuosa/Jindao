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
		baseline: 'Casino'
		with: [ spec repository: 'github://badetitou/casino' ].
	spec package: 'Jindao' with: [ spec requires: #PharoWin32 ].
	spec
		package: 'JindaoCasinoImporting'
		with: [ spec requires: #(Jindao Casino) ].
	spec group: 'default' with: #(Jindao).
	spec group: 'full' with: #(default JindaoCasinoImporting)
]
