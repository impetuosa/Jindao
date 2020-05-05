Class {
	#name : #JinControlClassInheritanceInfer,
	#superclass : #Object,
	#instVars : [
		'names'
	],
	#category : #'Jindao-Factories'
}

{ #category : #accessing }
JinControlClassInheritanceInfer class >> names [
	^ ' '
		split:
			('Laurene Mulvihill
Salvatore Demko
Sandee Jason
Liz Shumaker
Sam Oros
Tad Corrales
Hoyt Sacks
Wen Kridler
Creola Dermody
Jettie Reck
Wesley Lamon
Emmaline Gaxiola
Roosevelt Ligon
Vernice Meece
Isabella Lanford
Ellis Ferretti
Tifany Ferrero
Ester Macko
Shae Wert
Amberly Glenn
Edra Morgenstern
Tarsha Debonis
Vernell Everitt
Hubert Frappier
Celestine Hutcherson
Holly Carrick
Marilou Pocock
Fleta Bruss
Vella Coppinger
Wan Weldy
Mindy Sowders
Mittie Colquitt
Loria Collum
Heidi Woldt
Bret Motyka
Elliot Chenoweth
Loyce Laughlin
Letty Dumas
Mechelle Bran
Cordia Dolin
Wilma Pilcher
August Mccollister
Digna Leisinger
Magan Wallin
Annemarie Hedberg
Lilliana Rasnick
Veta Swindler
Walter Morell
Arla Kirwin' copyReplaceAll: String cr with: ' ')
]

{ #category : #'as yet unclassified' }
JinControlClassInheritanceInfer >> allValidConceptsFor:dataset sorted: aBlock [ 
	| fca |
	fca := MalFormalContext new
		with: dataset using: #yourself using: [ :each | each selectors ];
		yourself.
	^ ((fca concepts
		select: [ :c | c attributes isNotEmpty and: [ c objects size > 1 ] ])
		sort: aBlock)
]

{ #category : #'as yet unclassified' }
JinControlClassInheritanceInfer >> createClass: aName subclassOf: groupSuperclass withMethods: methods [
	| newClass |
	newClass := groupSuperclass
		subclass: aName
		instanceVariableNames: ''
		classVariableNames: ''
		package: 'Jindao-DomainObjects-GeneratedControls-GenSuper'.
	methods
		do:
			[ :method | newClass compile: method sourceCode classified: method category ].
	^ newClass
]

{ #category : #'as yet unclassified' }
JinControlClassInheritanceInfer >> generateSuperClassesFor: origin [
	self generateSuperClassesFor: origin depth: 1
]

{ #category : #'as yet unclassified' }
JinControlClassInheritanceInfer >> generateSuperClassesFor: origin depth: aDepth [
	| concepts dataset changed |
	aDepth > self threshold
		ifTrue: [ " Inspecting point " self halt ].
	changed := false.
	dataset := origin subclasses.
	concepts := self hierarchyBaseline = origin
		ifTrue: [ self getConceptsForHierarchyBaselineFrom: dataset ]
		ifFalse: [ self getConceptsForSubclassFrom: dataset ].
	concepts
		ifNotEmpty: [ self refactorAccordingTo: concepts first.
			changed := true ].
	origin subclasses
		do: [ :s | self generateSuperClassesFor: s depth: aDepth + 1 ].
	changed
		ifTrue: [ self generateSuperClassesFor: origin depth: aDepth + 1  ]
]

{ #category : #'as yet unclassified' }
JinControlClassInheritanceInfer >> getConceptsForHierarchyBaselineFrom: dataset [
	^ (self allValidConceptsFor:dataset sorted: [ :a :b | a objects size > b objects size ] )
]

{ #category : #'as yet unclassified' }
JinControlClassInheritanceInfer >> getConceptsForSubclassFrom: dataset [
	| middleResult packsOfBeginningWith | 
	middleResult := ((self allValidConceptsFor:dataset sorted: [ :a :b | 
		a attributes size = b attributes size ifTrue: [  a objects size > b objects size  ]
		 ifFalse: [ 	a attributes  size < b attributes size  ]
	] ) select: [ : concept | 
			| conceptCommonSuperclass |
			self assert: (concept objects allSatisfy: [ : o | o value superclass = concept objects first value superclass  ])	.
			" We only want the most representative interface that pushes a class that has less representativity than now. 
				This is for avoiding to create a class subclass of the current superclass that is common to all the subclasses of the current superclass.
			"
			conceptCommonSuperclass := concept objects first value superclass.
			conceptCommonSuperclass subclasses size > concept objects size .
	 ]).
middleResult ifEmpty: [ ^ middleResult ].
	packsOfBeginningWith := middleResult collect: [  : c | c-> (c attributes size - ( (c attributes groupedBy: [ : a |( [ : char | char isUppercase  ] split: a value ) first ])  values sort: [: cola :colb | cola size > colb size ])  first size) ].
	
	
	^ (packsOfBeginningWith sorted: [ :a :b | a value < b value ]) collect: [ : assoc  | assoc key ] .
	
	
]

{ #category : #'as yet unclassified' }
JinControlClassInheritanceInfer >> hierarchyBaseline [
	^ JinControlGenerated
]

{ #category : #'as yet unclassified' }
JinControlClassInheritanceInfer >> initialize [
	super initialize.
	names := self class names 
]

{ #category : #'as yet unclassified' }
JinControlClassInheritanceInfer >> name [
	| name |
	name := names atRandom.
	names remove: name.
	^ name
]

{ #category : #'as yet unclassified' }
JinControlClassInheritanceInfer >> refactor: aCollectionOfSubclasses sublassesOf: groupSuperclass with: aCollectionOfSelectors [
	

	"We have to choose a new super class. If it happens that any of the existing classes would be empty after refactoring, it means that it should be it self the new super class, for what the refactoring would be a bit different  "
	^ aCollectionOfSubclasses
		detect: [ :c | c selectors asSet = aCollectionOfSelectors asSet ]
		ifFound: [ :superclass | 
			| using | 
			using := aCollectionOfSubclasses copy.
			using remove: superclass .
			self
				removeSelectors: aCollectionOfSelectors
				from: using
				andInstall: superclass. 
			superclass
		]
		ifNone: [ 
			| methods superclass |
			methods := aCollectionOfSelectors
				collect: [ :s | aCollectionOfSubclasses first methodDict at: s ].
			superclass := self
				createClass: (#JinControl , self name) asSymbol
				subclassOf: groupSuperclass
				withMethods: methods.
			self
				removeSelectors: aCollectionOfSelectors
				from: aCollectionOfSubclasses
				andInstall: superclass.
			superclass 	
		].
]

{ #category : #'as yet unclassified' }
JinControlClassInheritanceInfer >> refactorAccordingTo: concept [
	| classesToWorkWith attributes groupSuperclass |
	self assert: concept objects size > 1 .
	self
		assert: (concept objects groupedBy: [ :c | c value superclass ]) size = 1.
	classesToWorkWith := concept objects collect: [ :a | a value ].
	attributes := concept attributes collect: [ :a | a value ].
	groupSuperclass := classesToWorkWith first superclass.
	^ self
		refactor: classesToWorkWith
		sublassesOf: groupSuperclass
		with: attributes
]

{ #category : #'as yet unclassified' }
JinControlClassInheritanceInfer >> removeSelectors: aCollectionOfSelectors from: aCollectionOfSubclasses andInstall: superclass [
	aCollectionOfSubclasses
		do: [ :o | 
			aCollectionOfSelectors do: [ :s | o removeSelector: s ].
			o superclass: superclass ]
]

{ #category : #'as yet unclassified' }
JinControlClassInheritanceInfer >> threshold [
	^ 30
]
