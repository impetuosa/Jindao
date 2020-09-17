Class {
	#name : #JinInspectorBuilder,
	#superclass : #JinVisitor,
	#instVars : [
		'inspector',
		'owner'
	],
	#category : #JindaoMoose
}

{ #category : #'visit angular' }
JinInspectorBuilder >> createIconNameTable [ 
	
	| table |
	table := self newTable.
	table
		addColumn:
			((SpImageTableColumn
				  title: 'Icon'
				  evaluated: [ :e | self iconFor: e ])
				 width: 50;
				 yourself);
		addColumn: (SpStringTableColumn title: 'Name' evaluated: #name);
		activateOnDoubleClick;
		beMultipleSelection;
		contextMenu: (self tableMenuFor: table);
		beResizable.
	^ table 
]

{ #category : #'as yet unclassified' }
JinInspectorBuilder >> iconFor: anElement [
	^ owner iconFor: anElement 
]

{ #category : #'as yet unclassified' }
JinInspectorBuilder >> inspectorFor: anObject into: anOwner [
	owner := anOwner. 
	anObject acceptVisitor: self.
	^ inspector 
]

{ #category : #'as yet unclassified' }
JinInspectorBuilder >> newMenu [

	^ owner newMenu
]

{ #category : #'as yet unclassified' }
JinInspectorBuilder >> newTable [
	^ owner newTable
]

{ #category : #initialization }
JinInspectorBuilder >> tableMenuFor: table1 [

	^ self newMenu
		  title: 'Context menu example';
		  addGroup: [ :aGroup | 
			  aGroup
				  addItem: [ :anItem | 
					  anItem
						  name: 'Print in transcript';
						  shortcut: $p meta;
						  description: 'Print the selected class on Transcript';
						  action: [ table1 selectedItems traceCr ] ];
				  addItem: [ :anItem | 
					  anItem
						  name: 'Browse';
						  iconName: #open;
						  action: [ table1 selectedItems browse ] ];
				  addItem: [ :anItem | 
					  anItem
						  name: 'Print infos';
						  subMenu: (self newMenu addGroup: [ :aSubGroup | 
									   aSubGroup
										   addItem: [ :item | 
											   item
												   name: 'Print number of methods';
												   action: [ table1 selectedItems methods size traceCr ] ];
										   addItem: [ :item | 
											   item
												   name: 'Print number of variables';
												   action: [ 
													   table1 selectedItems instanceVariables size
														   traceCr ] ] ]) ] ]
]

{ #category : #buileder }
JinInspectorBuilder >> visitAccessMooseModel: aJinAccessMooseModel [

	| table |
	table := self newTable.
	table
		addColumn: ((SpCheckBoxTableColumn
				  title: ' '
				  evaluated: [ :class | owner components includes: class ])
				 onActivation: [ :class | owner components add: class ];
				 onDeactivation: [ :class | 
					 owner components remove: class ifAbsent: [  ] ];
				 width: 20;
				 yourself);
		addColumn:
			((SpImageTableColumn
				  title: 'Icon'
				  evaluated: [ :e | self iconFor: e ])
				 width: 50;
				 yourself);
		addColumn: (SpStringTableColumn title: 'Name' evaluated: #name);
		activateOnDoubleClick;
		beMultipleSelection;
		contextMenu: (self tableMenuFor: table);
		beResizable.

	table items: aJinAccessMooseModel entities .
	inspector := table
]

{ #category : #'visit angular' }
JinInspectorBuilder >> visitAngularComponent: aJinAngularComponent [ 

	inspector := self createIconNameTable.
	inspector items: { aJinAngularComponent template . aJinAngularComponent behavior  } .
	
]

{ #category : #visiting }
JinInspectorBuilder >> visitAngularComponentBehavior: aJinAngularComponentBehaviour [ 
	
	inspector := self createIconNameTable.
	inspector 	addColumn: (SpStringTableColumn title: 'Type' evaluated: #type ).
	inspector items: 
		{aJinAngularComponentBehaviour superclass} , 
		aJinAngularComponentBehaviour interfaces,  
		aJinAngularComponentBehaviour properties, 
		aJinAngularComponentBehaviour methods 
]

{ #category : #'visit angular' }
JinInspectorBuilder >> visitAngularComponentTemplate: aJinAngularComponentTemplate [ 

	inspector := self createIconNameTable.
	inspector items:{ }
]

{ #category : #'visit angular' }
JinInspectorBuilder >> visitAngularModule: aJinAngularModule [

	inspector := self createIconNameTable.
	inspector items:
		aJinAngularModule modules , aJinAngularModule components
]

{ #category : #'visit angular' }
JinInspectorBuilder >> visitAngularProject: aJinAngularProject [

	inspector := self createIconNameTable.
	inspector items: aJinAngularProject modules
]

{ #category : #'visit angular' }
JinInspectorBuilder >> visitAngularScheme: aJinAngularScheme [

	aJinAngularScheme defaultProject acceptVisitor: self
]

{ #category : #visiting }
JinInspectorBuilder >> visitCustomControl: aJinControlGeneric [ 

]

{ #category : #'as yet unclassified' }
JinInspectorBuilder >> visitForm: aForm [

	| table |
	table := self newTable.
	table
		addColumn:
			((SpImageTableColumn
				  title: 'Icon'
				  evaluated: [ :e | self iconFor: e ])
				 width: 50;
				 yourself);
		addColumn:
		(SpStringTableColumn title: 'Type' evaluated: [ :e | e class name copyReplaceAll:'Jin' with:'']);
		addColumn: (SpStringTableColumn title: 'Name' evaluated: #name);
		activateOnDoubleClick;
		beMultipleSelection;
		contextMenu: (self tableMenuFor: table);
		beResizable.
	table items: aForm controls.
	inspector := table
]

{ #category : #'as yet unclassified' }
JinInspectorBuilder >> visitFormControl: aControl [ 
	
]

{ #category : #'visit-first-objects' }
JinInspectorBuilder >> visitMacro: aJinMacro [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
JinInspectorBuilder >> visitModule: aJinModule [


]

{ #category : #'as yet unclassified' }
JinInspectorBuilder >> visitQuery: aQuery [ 


	| table |
	table := self newTable.
	table
		addColumn:
			((SpImageTableColumn
				  title: 'Icon'
				  evaluated: [ :e | self iconFor: e ])
				 width: 50;
				 yourself);
		addColumn:
		(SpStringTableColumn title: 'Type' evaluated: [ :e | e typeName ]);
		addColumn: (SpStringTableColumn title: 'Table' evaluated: #sourceTableName);
		addColumn: (SpStringTableColumn title: 'Name' evaluated: #name);
		activateOnDoubleClick;
		beMultipleSelection;
		contextMenu: (self tableMenuFor: table);
		beResizable.
	table items: aQuery fields.
	inspector := table


]

{ #category : #'as yet unclassified' }
JinInspectorBuilder >> visitReport: aReport [
	self visitForm: aReport
]

{ #category : #'as yet unclassified' }
JinInspectorBuilder >> visitTable: aJinTable [

	| table |
	table := self newTable.
	table
		addColumn:
			((SpImageTableColumn
				  title: 'Icon'
				  evaluated: [ :e | self iconFor: e ])
				 width: 50;
				 yourself);
		addColumn:
		(SpStringTableColumn title: 'Type' evaluated: [ :e | e typeName ]);
		addColumn: (SpStringTableColumn title: 'Name' evaluated: #name);
		activateOnDoubleClick;
		beMultipleSelection;
		contextMenu: (self tableMenuFor: table);
		beResizable.
	table items: aJinTable fields.
	inspector := table
]

{ #category : #visiting }
JinInspectorBuilder >> visitTypescriptMethod: aJinTypescriptMethod [ 
	
	inspector := owner newText. 
	inspector text: aJinTypescriptMethod sourceCode 
	
]
