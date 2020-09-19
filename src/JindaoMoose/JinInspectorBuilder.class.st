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
		contextMenu: (self tableMenuForAngular: table);
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

{ #category : #initialization }
JinInspectorBuilder >> tableMenuForAngular: aTable [

	^ self newMenu
		  addGroup: [ :aGroup | 
			  aGroup addItem: [ :anItem | 
					  anItem
						  name: 'Inspect';
						  description: 'Inspect';
						  action: [ aTable selectedItems inspect ] ].
			  aGroup addItem: [ : menuItem | 
				  menuItem
					name:'New';
					  subMenu: (self newMenu
							   
							   addGroup: [ :newGroup | 
								   newGroup
									   addItem: [ :anItem | 
										   anItem
											   name: 'Create new module';
											   description: 'new module';
											   action: [ owner createNewAngularModule ] ];
									   addItem: [ :anItem | 
										   anItem
											   name: 'New component';
											   description: 'Create New Component';
											   action: [ owner createNewAngularComponent ] ];
									   addItem: [ :anItem | 
										   anItem
											   name: 'New model';
											   description: 'Create New Model';
											   action: [ owner createNewAngularModel ] ] ]) ] ]
]

{ #category : #initialization }
JinInspectorBuilder >> tableMenuForQuery: aTable [

	^ self newMenu
		  addGroup: [ :aGroup | 
			  aGroup addItem: [ :anItem | 
					  anItem
						  name: 'Inspect';
						  shortcut: $i meta;
						  description: 'Inspect';
						  action: [ aTable selectedItems inspect ] ] ]
]

{ #category : #initialization }
JinInspectorBuilder >> tableMenuForTable: aTable [

	^ self newMenu

		  addGroup: [ :aGroup | 
			  aGroup addItem: [ :anItem | 
					  anItem
						  name: 'Inspect';
						  shortcut: $i meta;
						  description: 'Inspect';
						  action: [ aTable selectedItems inspect ] ] ]
]

{ #category : #initialization }
JinInspectorBuilder >> tableMenuForms: aTable [

	^ self newMenu
		  addGroup: [ :aGroup | 
			  aGroup
				  addItem: [ :anItem | 
					  anItem
						  name: 'Inspect';
						  shortcut: $i meta;
						  description: 'Inspect';
						  action: [ aTable selectedItems inspect ] ];
				  addItem: [ :anItem | 
					  anItem
						  name: 'Selective Migration';
						  description: 'Migrate UI Selecting new Component';
						  action: [ owner selectiveMigrateAll: aTable selectedItems ] ] ]
]

{ #category : #initialization }
JinInspectorBuilder >> tableMenuProject: aTable [

	^ self newMenu
		  addGroup: [ :aGroup | 
			  aGroup
				  addItem: [ :anItem | 
					  anItem
						  name: 'Inspect';
						  shortcut: $i meta;
						  description: 'Inspect';
						  action: [ aTable selectedItems inspect ] ];
				  addItem: [ :anItem | 
					  anItem
						  name: 'Move to angular';
						  description: 'Migrate UI As new Component';
						  action: [ owner fullMigrateAll: aTable selectedItems ] ];
				  addItem: [ :anItem | 
					  anItem
						  name: 'Selective Migration';
						  description: 'Migrate UI Selecting new Component';
						  action: [ owner selectiveMigrateAll: aTable selectedItems ] ] ]
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
		contextMenu: (self tableMenuProject: table);
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

	inspector := owner newTreeTable.
	inspector
		addColumn: (SpStringTableColumn title: 'Element' evaluated: [ : e |( e respondsTo:#name )ifTrue: [e name ] ifFalse:[ e class name,'[', e hash asString , ']' ]  ] );
		roots: { aJinAngularComponentTemplate ast };
		children: [ :anElement | 
			anElement hasChildren
				ifTrue: [ anElement nodes ]
				ifFalse: [ {  } ] ];
		yourself
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

{ #category : #visiting }
JinInspectorBuilder >> visitAngularProtoComponent: aJinAngularProtoComponent [

	self visitAngularComponent: aJinAngularProtoComponent
]

{ #category : #visiting }
JinInspectorBuilder >> visitAngularProtoComponentBehavior: aJinAngularProtoComponentBehavior [ 
	^ self visitAngularComponentBehavior: aJinAngularProtoComponentBehavior
]

{ #category : #visiting }
JinInspectorBuilder >> visitAngularProtoComponentTemplate: aJinAngularProtoComponentTemplate [ 
	self visitAngularComponentTemplate: aJinAngularProtoComponentTemplate
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
		contextMenu: (self tableMenuForms: table);
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
		contextMenu: (self tableMenuForQuery: table);
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
		contextMenu: (self tableMenuForTable: table);
		beResizable.
	table items: aJinTable fields.
	inspector := table
]

{ #category : #visiting }
JinInspectorBuilder >> visitTypescriptMethod: aJinTypescriptMethod [ 
	
	inspector := owner newText. 
	inspector text: aJinTypescriptMethod sourceCode 
	
]
