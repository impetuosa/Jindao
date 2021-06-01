Class {
	#name : #JinLibraryTypeLoader,
	#superclass : #Object,
	#instVars : [
		'mapped'
	],
	#category : #'Jindao-LibraryAnalysis'
}

{ #category : #loader }
JinLibraryTypeLoader >> load: aCOMTypeInfo [

	^ self
		  perform: ('load'
			   ,
				   ((aCOMTypeInfo typeKind item copyReplaceAll: 'TKIND_' with: '')
					    asLowercase capitalized , ':')) asSymbol
		  withArguments: { aCOMTypeInfo }
]

{ #category : #'as yet unclassified' }
JinLibraryTypeLoader >> loadEnum: aCOMTypeInfo [
	^ JinLibraryEnum new
		name: aCOMTypeInfo name;
		values: (aCOMTypeInfo vars collect: [ :v | 
					 JinLibraryEnumValue new
						 name: v name;
						 value: v value;
						 yourself ])
]

{ #category : #'load module' }
JinLibraryTypeLoader >> loadModule: aCOMTypeInfo [ 
	self shouldBeImplemented.
]
