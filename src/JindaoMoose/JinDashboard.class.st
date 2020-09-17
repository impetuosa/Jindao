Class {
	#name : #JinDashboard,
	#superclass : #JinPresenter,
	#instVars : [
		'projectExplorer',
		'viewport',
		'toolbar',
		'model',
		'components',
		'mapOverviewPage',
		'angularExplorer',
		'angularModel'
	],
	#category : #JindaoMoose
}

{ #category : #specs }
JinDashboard class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: #toolbar
		  withConstraints: [ :constraints | 
			  constraints height: self toolbarHeight * 2 ];
		  add: (SpBoxLayout newHorizontal
				   add: #projectExplorer
				   withConstraints: [ :constraints | 
					   constraints width: self projectExplorerWidth ];
				   add: #viewport;
				   add: #angularExplorer
				   withConstraints:
					   [ :constraints | constraints width: self projectExplorerWidth ]
						   yourself);
		  yourself
]

{ #category : #'as yet unclassified' }
JinDashboard class >> projectExplorerWidth [
	^ 400
]

{ #category : #initialization }
JinDashboard >> components [

	^ components
]

{ #category : #initialization }
JinDashboard >> createNewProjectExplorerPaneFor: aModel [

	| table |
	(aModel respondsTo:#children ) ifFalse:[^ nil  ].
	table := self newTable.
	table
		addColumn: ((SpCheckBoxTableColumn
				  title: ' '
				  evaluated: [ :class | components includes: class ])
				 onActivation: [ :class | components add: class ];
				 onDeactivation: [ :class | 
					 components remove: class ifAbsent: [  ] ];
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
		
	table items: aModel children.

	^ table
]

{ #category : #initialization }
JinDashboard >> emptyViewport [

	mapOverviewPage ifNotNil: [ 
		viewport removePage: mapOverviewPage.
		mapOverviewPage := nil ]
]

{ #category : #initialization }
JinDashboard >> iconFor: anElement [

	^ JinIcons iconFor: anElement
]

{ #category : #initialization }
JinDashboard >> initializePresenters [

	super initializePresenters.
	toolbar := self newToolbar.
	toolbar beBoth.
	toolbar
		addItemLeft: (SpToolbarButtonPresenter  new
				 label: 'Access';
				 icon: (self theme iconNamed: #smallOpen);
				 help: 'Opens an access project';
				 action: [ self openAccessProject ];
				 yourself);
		addItemLeft: (SpToolbarButtonPresenter new
				 label: 'Accueil';
				 icon: (self theme iconNamed: #smallOpen);
				 help: 'Opens CAcceuille project';
				 action: [ 
					 self openAccueille];
				 yourself);
		addItemLeft: (SpToolbarButtonPresenter new
				 label: 'NW';
				 icon: (self theme iconNamed: #smallOpen);
				 help: 'Opens Northwind project';
				 action: [ 
					self openNorthwind ];
				 yourself);
		addItemLeft: (SpToolbarButtonPresenter new
				 label: 'TreeMap';
				 icon: (self theme iconNamed: #branch);
				 help: 'Tree map overview';
				 action: [ self openTreeMapOverview ];
				 yourself);
		addItemRight: (SpToolbarButtonPresenter new
				 label: 'Angular';
				 icon: (self theme iconNamed: #smallOpen);
				 help: 'openAngularProject';
				 action: [ self openAngularProject ];
				 yourself);
		addItemRight: (SpToolbarButtonPresenter new
				 label: 'CW3';
				 icon: (self theme iconNamed: #smallOpen);
				 help: 'Open core web 3 ';
				 action: [ self openCW3];
				 yourself).
	projectExplorer := self newProjectExplorer .
	angularExplorer := self newProjectExplorer .

	viewport := self newNotebook
]

{ #category : #initialization }
JinDashboard >> initializeWindow: aWindowPresenter [ 	
	super initializeWindow: aWindowPresenter.
	aWindowPresenter whenWillCloseDo: [ self windowClosing ].
]

{ #category : #initialization }
JinDashboard >> newProjectExplorer [

	^ SpMillerColumnPresenter new
		  presenterBlock: [ :aModel | 
			  JinInspectorBuilder new inspectorFor: aModel into: self ];
		  yourself
]

{ #category : #initialization }
JinDashboard >> open [

	<script: 'self new openWithSpec '>
	
]

{ #category : #initialization }
JinDashboard >> openAccessProject [

	| path |
	path := UIManager default
		        chooseFullFileNameMatching: nil
		        label: 'Access project'.
	path ifNil: [ ^ self ].
	path := path asFileReference.
	path exists ifFalse: [ 
		UIManager default inform: 'Invalid file'.
		^ self ].

	self openAccessProject: path
]

{ #category : #initialization }
JinDashboard >> openAccessProject: path [

	model ifNotNil: [ 
		(UIManager default
			 confirm:
			 'Open a new project requires to close the already opened one. Do you want to continue?'
			 label: 'Close project?')
			ifTrue: [ 
				model closeAndQuit.
				model := nil ]
			ifFalse: [ ^ self ] ].

	model := JinAccessMooseModel new
		         path: path asFileReference;
		         yourself.
	mapOverviewPage ifNotNil: [ 
		mapOverviewPage presenterProvider model: model ].
	components := Set new.
	projectExplorer setRootModel: model
]

{ #category : #initialization }
JinDashboard >> openAccueille [

	self openAccessProject:
		'D:\Users\Santiago.BRAGAGNOLO\Documents\PhD\Resources\11.50.00.02\Produit\caccueil.accdb'
			asFileReference
]

{ #category : #initialization }
JinDashboard >> openAngularProject [

	| path |
	path := UIManager default
		        chooseFullFileNameMatching: nil
		        label: 'Angular project'.
	path ifNil: [ ^ self ].
	path := path asFileReference.
	path exists ifFalse: [ 
		UIManager default inform: 'Invalid file'.
		^ self ].

	self openAngularProject: path
]

{ #category : #'as yet unclassified' }
JinDashboard >> openAngularProject: aFileReference [

	angularModel ifNotNil: [ 
		(UIManager default
			 confirm:
			 'Open a new project requires to close the already opened one. Do you want to continue?'
			 label: 'Close project?')
			ifTrue: [ 
				angularModel closeAndQuit.
				angularModel := nil ]
			ifFalse: [ ^ self ] ].

	angularModel := JinAngularScheme onPath: aFileReference.


	angularExplorer setRootModel: angularModel
]

{ #category : #initialization }
JinDashboard >> openCW3 [ 
	self openAngularProject: 'D:\Users\Santiago.BRAGAGNOLO\Documents\git-repositories\coreweb3\export' asFileReference 
]

{ #category : #initialization }
JinDashboard >> openNorthwind [

	self openAccessProject:
		'D:\Users\Santiago.BRAGAGNOLO\Documents\norwind\Northwind.accdb'
			asFileReference
]

{ #category : #initialization }
JinDashboard >> openTreeMapOverview [

	| widget |
	model ifNil: [ UIManager inform: 'none project is opened!' .^ self ].
	mapOverviewPage ifNotNil: [ ^ self ].

	widget := self instantiate: JinTreeMapPresenter.

	mapOverviewPage := self newNotebookPage
		                   beCloseable;
		                   title: '';
		                   presenterProvider: widget;
		                   yourself.
	viewport addPage: mapOverviewPage.

	widget needRebuild: true.
	self update.
	widget model: model
]

{ #category : #accessing }
JinDashboard >> project [
	^ model 
]

{ #category : #initialization }
JinDashboard >> tableContents [

	^ model entities 
]

{ #category : #initialization }
JinDashboard >> tableMenu [

	| table1 |
	table1 := projectExplorer.
	^ self newMenu
		  title: 'Context menu example';
		  addGroup: [ :aGroup | 
			  aGroup
				  addItem: [ :anItem | 
					  anItem
						  name: 'Print in transcript';
						  shortcut: $p meta;
						  description: 'Print the selected class on Transcript';
						  action: [ projectExplorer selectedItems traceCr ] ];
				  addItem: [ :anItem | 
					  anItem
						  name: 'Browse';
						  iconName: #open;
						  action: [ projectExplorer selectedItems browse ] ];
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
													   projectExplorer selectedItems instanceVariables size
														   traceCr ] ] ]) ] ]
]

{ #category : #initialization }
JinDashboard >> windowClosing [

	model ifNotNil: [ model ensureClosed ]
]
