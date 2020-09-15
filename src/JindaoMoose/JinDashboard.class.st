Class {
	#name : #JinDashboard,
	#superclass : #JinPresenter,
	#instVars : [
		'projectExplorer',
		'viewport',
		'toolbar',
		'model',
		'components',
		'mapOverviewPage'
	],
	#category : #JindaoMoose
}

{ #category : #specs }
JinDashboard class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: #toolbar
		  withConstraints: [ :constraints | 
			  constraints height: self toolbarHeight *2 ];
		  add: (SpBoxLayout newHorizontal
				   add: #projectExplorer  withConstraints: [ :constraints | 
		  constraints width: self projectExplorerWidth ];
				   add: #viewport;
				   yourself)
		 ;
		  yourself
]

{ #category : #'as yet unclassified' }
JinDashboard class >> projectExplorerWidth [
	^ 400
]

{ #category : #'as yet unclassified' }
JinDashboard >> activatedObject: aSpSingleSelectionMode [ 
	self openObjectInspector: aSpSingleSelectionMode selectedItem. 
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
		addItem: (SpToolbarButtonPresenter  new
				 label: 'Open';
				 icon: (self theme iconNamed: #smallOpen);
				 help: 'Opens an access project';
				 action: [ self openAccessProject ];
				 yourself);
		addItem: (SpToolbarButtonPresenter new
				 label: 'Accueil';
				 icon: (self theme iconNamed: #smallOpen);
				 help: 'Opens CAcceuille project';
				 action: [ 
					 self openProject:
							 'D:\Users\Santiago.BRAGAGNOLO\Documents\PhD\Resources\11.50.00.02\Produit\caccueil.accdb'
								 asFileReference ];
				 yourself);
		addItem: (SpToolbarButtonPresenter new
				 label: 'NW';
				 icon: (self theme iconNamed: #smallOpen);
				 help: 'Opens Northwind project';
				 action: [ 
					 self openProject:
							 'D:\Users\Santiago.BRAGAGNOLO\Documents\norwind\Northwind.accdb'
								 asFileReference ];
				 yourself);
		addItem: (SpToolbarButtonPresenter new
				 label: 'TreeMap';
				 icon: (self theme iconNamed: #smallOpen);
				 help: 'Tree map overview';
				 action: [ self openTreeMapOverview ];
				 yourself).
	projectExplorer := self newTable.


	projectExplorer
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
		activateOnDoubleClick ;
		beMultipleSelection ;
		whenActivatedDo: [ : object | self activatedObject: object ];
		contextMenu: self tableMenu; 
		beResizable.


	viewport := self newNotebook
]

{ #category : #initialization }
JinDashboard >> initializeWindow: aWindowPresenter [ 	
	super initializeWindow: aWindowPresenter.
	aWindowPresenter whenWillCloseDo: [ self windowClosing ].
]

{ #category : #initialization }
JinDashboard >> open [

	<script: 'self new openWithSpec '>
	
]

{ #category : #initialization }
JinDashboard >> openAccessProject [

	| path new |
	path := UIManager default
		        chooseFullFileNameMatching: nil
		        label: 'Access project'.
	path ifNil: [ ^ self ].
	path := path asFileReference.
	path exists ifFalse: [ 
		UIManager default inform: 'Invalid file'.
		^ self ].

	self openProject: path
]

{ #category : #'as yet unclassified' }
JinDashboard >> openObjectInspector: anObject [

	viewport addPage: (self newNotebookPage
			 beCloseable;
			 title: 'Inspector ' , anObject printString;
			 presenterProvider:
				 ((JinInspectorBuilder new inspectorFor: anObject into: self)
					  needRebuild: true;
					  yourself);
			 yourself).
	self update
]

{ #category : #initialization }
JinDashboard >> openProject: path [
	
	model ifNotNil: [ 
		(UIManager default
			 confirm:
			 'Open a new project requires to close the already opened one. Do you want to continue?'
			 label: 'Close project?')
			ifTrue: [ 
				model closeAndQuit.
				model := nil ]
			ifFalse: [ ^ self ] ].

	model := JinAccessMooseModel new path: path asFileReference; yourself .
	mapOverviewPage ifNotNil: [
	mapOverviewPage presenterProvider model: model. ].
	components := Set new .
	
	projectExplorer items: self tableContents
]

{ #category : #initialization }
JinDashboard >> openTreeMapOverview [

	| widget |
	mapOverviewPage ifNotNil: [ ^ self ].

	widget := self instantiate: JinTreeMapPresenter.

	mapOverviewPage := self newNotebookPage
		                   beCloseable;
		                   title: 'Tree map';
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
