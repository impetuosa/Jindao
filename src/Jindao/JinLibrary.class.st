Class {
	#name : #JinLibrary,
	#superclass : #Object,
	#instVars : [
		'reference',
		'functions',
		'libraryHandle',
		'dbgHandle',
		'types',
		'typeLoader'
	],
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #accessing }
JinLibrary >> dbgHandle [

	| path |
	^ dbgHandle ifNil: [ 
		path := reference path exists
			        ifTrue: [ reference path ]
			        ifFalse: [ self libraryHandle win32Path ].
		path ifNil: [ self error: 'cannot resolve address for library! ' ].

		DBGHelpLib uniqueInstance enumerateModules: [ :moduleName :baseDll :void | 
			self traceCr: moduleName. 
			(moduleName = reference name or: [ 
				 moduleName asLowercase = path basenameWithoutExtension asLowercase ])
				ifTrue: [ 
					dbgHandle := baseDll.
					false ]
				ifFalse: [ true ] ].
		dbgHandle := dbgHandle
			             ifNil: [ 
			             DBGHelpLib uniqueInstance loadModule: path fullName ]
			             ifNotNil: [ dbgHandle ].
		dbgHandle ]
]

{ #category : #lazy }
JinLibrary >> fetchLibraryFunctions [

	| ff |
	ff := OrderedCollection new.

	DBGHelpLib uniqueInstance
		enumerateSymbols: self dbgHandle
		callback: [ :pSymbol :size :usc | " The pSymbol pointer is valid **ONLY** during the callback execution. "
			| symbol |
			symbol := DBGSymbolInfo fromHandle: pSymbol.
			" 
			https://docs.microsoft.com/en-us/windows/win32/api/dbghelp/ns-dbghelp-symbol_info
			SYMFLAG_EXPORT = 0x00000200
			The symbol is from the export table. 
			"
			self traceCr: symbol flags hex.
			symbol flags = 16r200 ifTrue: [ 
				ff add: (JinLibFunction new
						 library: self;
						 selector: symbol name;
						 yourself) ].
			true ].
	^ ff
]

{ #category : #accessing }
JinLibrary >> functions [
	^ functions ifNil: [ functions := self fetchLibraryFunctions ]
]

{ #category : #handle }
JinLibrary >> libraryHandle [

	^ libraryHandle ifNil: [ 
		  libraryHandle := (COMTypeLibName readFromRegistry detect: [ :r | 
			                    r guid = reference guid ]) loadWithRegistryInfo ]
]

{ #category : #lazy }
JinLibrary >> name [
	^ reference name
]

{ #category : #accessing }
JinLibrary >> reference: aJinReference [

	reference := aJinReference
]

{ #category : #accessing }
JinLibrary >> typeLoader [
	^ typeLoader ifNil: [ typeLoader := JinLibraryTypeLoader new  ].
]

{ #category : #accewssing }
JinLibrary >> types [

	^ types ifNil: [ 
		  types := self libraryHandle typeInfos collect: [ :i | 
			           self typeLoader load: i ] ]
]
