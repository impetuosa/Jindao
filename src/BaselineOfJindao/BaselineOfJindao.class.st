Class {
	#name : #BaselineOfJindao,
	#superclass : #BaselineOf,
	#category : #BaselineOfJindao
}

{ #category : #baselines }
BaselineOfJindao >> baseline: spec [

	<baseline>
	spec
		baseline: #PharoWin32
		with: [ spec repository: 'github://tesonep/pharo-com' ].
	spec
		baseline: #VBParser
		with: [ spec repository: 'github://impetuosa/VBParser:master' ].
	spec
		package: #Jindao
		with: [ spec requires: #( PharoWin32 VBParser ) ].

	spec baseline: #PostgreSQLParser with: [ 
		spec
			repository: 'github://impetuosa/PostgreSQLParser:master/src';
			loads: #dev ].
	spec
		package: #JinDAM
		with: [ spec requires: #( Jindao PostgreSQLParser ) ]
]
