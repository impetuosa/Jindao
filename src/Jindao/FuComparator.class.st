Class {
	#name : #FuComparator,
	#superclass : #JinStackVisitor,
	#instVars : [
		'source',
		'target',
		'registry'
	],
	#category : #'Jindao-FuZhi'
}

{ #category : #'visit-first-objects' }
FuComparator >> compare [
	self visitProject: source
]

{ #category : #'visit-first-objects' }
FuComparator >> compareControls: aForm with: targetForm [
	| controls |
	controls := targetForm controls.
	^ aForm controls
		collect: [ :c | 
			controls
				detect: [ :tc | tc name = c name ]
				ifFound: [ :tc | 
					FuObject new
						type: c class name;
						name: c name;
						success: true;
						properties: (self compareProperties: c with: tc);
						yourself ]
				ifNone: [ FuObject new
						type: c class name;
						name: c name;
						success: false;
						errorText: 'NonReplicatedControl';
						yourself ] ]
]

{ #category : #'visit-first-objects' }
FuComparator >> compareFields: f with: tc [
	| propes |
	propes := OrderedCollection new.
	[ propes
		add:
			(f typeName = tc typeName
				ifTrue: [ FuObject new
						type: #TypeName;
						name: f typeName;
						success: true;
						yourself ]
				ifFalse: [ FuObject new
						type: #TypeName;
						name: f typeName;
						success: false;
						errorText: 'Differing type, ' , tc typeName;
						yourself ]) ]
		on: Error
		do: [  ].
	[ propes
		add:
			(f size = tc size
				ifTrue: [ FuObject new
						type: #TypeSize;
						name: f size;
						success: true;
						yourself ]
				ifFalse: [ FuObject new
						type: #TypeSize;
						name: f size;
						success: false;
						errorText: 'Differing size, ' , tc size asString;
						yourself ]) ]
		on: Error
		do: [  ].
	^ propes
]

{ #category : #'visit-first-objects' }
FuComparator >> compareProperties: aForm with: targetForm [
	^ aForm propertiesToInfuse
		collect: [ :h | 
			| vf vt et |
			[ vf := aForm handle propertyNamed: h ]
				on: Error
				do: [ :e | et := 'Error reading from' ].
			[ vt := targetForm handle propertyNamed: h ]
				on: Error
				do: [ :e | et :=( et ifNil:['']), ' Error reading target' ].
			FuObject new
				name: h;
				type: #Property;
				success: (vf = vt and:[ et isEmptyOrNil]) ;
				errorText: et;
				yourself ]
]

{ #category : #'visit-first-objects' }
FuComparator >> compareQuery: query1 with: query2 [
	| sql1 sql2 et |
	[ sql1 := query1 sql ]
		on: Error
		do: [ :e | et := 'Error to get source SQL' ].
	[ sql2 := query2 sql ]
		on: Error
		do: [ :e | et := 'Error to get target SQL' ].
	^ {(FuObject new
		type: #Sql;
		name: 'SqlCompare';
		success: sql1 = sql2;
		errorText:
			((et isNil and: [ sql1 ~= sql2 ])
				ifTrue: [ 'Sql source different to target Sql' ]
				ifFalse: [ et ]))}
]

{ #category : #'visit-first-objects' }
FuComparator >> compareTable: aTable with: anOtherTable [
	| fields |
	fields := anOtherTable fields.
	^ aTable fields
		collect: [ :f | 
			fields
				detect: [ :tc | tc name = f name ]
				ifFound: [ :tc | 
					FuObject new
						type: f class name;
						name: f name;
						success: true;
						properties: (self compareFields: f with: tc);
						yourself ]
				ifNone: [ FuObject new
						type: f class name;
						name: f name;
						success: false;
						errorText: 'NonReplicatedField';
						yourself ] ]
]

{ #category : #'visit-first-objects' }
FuComparator >> initialize [
	super initialize.
	registry := OrderedCollection new
]

{ #category : #accessing }
FuComparator >> registry [
	^ registry
]

{ #category : #accessing }
FuComparator >> source [
	^ source
]

{ #category : #accessing }
FuComparator >> source: anObject [
	source := anObject
]

{ #category : #accessing }
FuComparator >> target [
	^ target
]

{ #category : #accessing }
FuComparator >> target: anObject [
	target := anObject
]

{ #category : #'visit-first-objects' }
FuComparator >> visitForm: aForm [
	| o targetForm |
	targetForm := target forms detect: [ :f | f name = aForm name ].
	o := registry
		add:
			(FuObject new
				name: aForm name;
				type: #JinForm;
				yourself).
	o properties: (self compareProperties: aForm body with: targetForm body ).
	o children: (self compareControls: aForm with: targetForm).
		aForm close.
	targetForm close.
]

{ #category : #'visit-first-objects' }
FuComparator >> visitQuery: aTable [
	| o |
	o := registry
		add:
			(FuObject new
				name: aTable name;
				type: #JinQuery;
				yourself).
	target tables
		detect: [ :f | f name = aTable name ]
		ifFound: [ :t | 
			o success: true.
			o children: (self compareQuery: aTable with: t).
			t close ]
		ifNone: [ o
				success: false;
				errorText: 'QueryWasNotMigrated' ].
	aTable close
]

{ #category : #'visit-first-objects' }
FuComparator >> visitReport: aForm [
	| o targetForm |
	targetForm := target reports detect: [ :f | f name = aForm name ].
	o := registry
		add:
			(FuObject new
				name: aForm name;
				type: #JinReport;
				yourself).
	o properties: (self compareProperties: aForm body with: targetForm body).
	o children: (self compareControls: aForm with: targetForm).
	aForm close.
	targetForm close.
]

{ #category : #'visit-first-objects' }
FuComparator >> visitTable: aTable [
	| o |
	o := registry
		add:
			(FuObject new
				name: aTable name;
				type: #JinTable;
				yourself).
	target tables
		detect: [ :f | f name = aTable name ]
		ifFound: [ :t | 
			o success: true.
			o children: (self compareTable: aTable with: t).
			t close ]
		ifNone: [ o
				success: false;
				errorText: 'TableWasNotMigrated' ].
	aTable close
]

{ #category : #'as yet unclassified' }
FuComparator >> visitTableRelation: aJinTableRelation [
	| rel |
	rel := target relations
		detect: [ :r | r printString = aJinTableRelation printString ]
		ifFound: [ :f | 
			FuObject new
				type: #ForeignKey;
				name: f printString;
				success: true ]
		ifNone: [ FuObject new
				type: #ForeignKey;
				name: aJinTableRelation printString;
				success: false ].
	(registry
		detect:
			[ :re | re type = #JinTable and: [ re name = aJinTableRelation tableName ] ])
		addChild: rel
]
