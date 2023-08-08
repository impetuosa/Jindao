"
# Jindao
JinDao (進道) is a project faor Microsoft Access usage. JinDao does not mean anything, but puts together Jin (get into) and Dao (way).

Jindao is a library which provides online access to Microsoft Access projects through the usage of Microsoft COM. 

Jindao follows generally the implementation proposed by [https://inria.hal.science/hal-02966146v1](https://inria.hal.science/hal-02966146v1).

Access provides a visual interface to export some entities by point and click. This process is time consuming and prone to error. It is not tractable for full applications and in addition not all the elements can be exported. Leading to what we call a partially observable domain, since, by the usage of given tooling we cannot obtain artefact to analyze.


![Figure-Blind-Metamodel](https://github.com/impetuosa/Jindao/blob/master/figures/access-metamodel-blind.jpg?raw=true).




The figure shows a simplified model of \access main elements.
In grey we show the elements that \textbf{cannot} be exported from the GUI, in white those that can.
Most of the structural entities are not available for export such as the table definitions, the query SQL definition, reports and forms structures not even the macros. 
The main GUI exporting features are related to the visual basic part of the project, including modules, class-modules, and the report or form companion-modules.
The latter happens to be useless since their structure is not migrated.All analysis proposed over this partial content should be fully based on heuristics. 



Through COM, Access exposes a large and powerful API, that allows high in- teroperability in between different applications.

For interacting with Access through COM we must interact with an object model, composed by the followings.
* Remote handle. For interacting with remote Access entities COM provides remote memory addresses. We call these addresses handles.
* Application. First instance to access through COM. This application object is bound to a running instance of Access. It exposes an explorable API, and it allows access to the project components, directly or indirectly.
* DoCmd. (Do Command) is an object that reifies most of the available operations to apply on the application. It must be used for opening a project, databases and others. Most of the objects below have this object as a dependency.
* References. This collection contains Reference objects describing a project’s static dependencies.
* CurrentProject. Depends on DoCmd. It holds basic metadata for each element in the project, by pointing to the collections AllForms, AllReports, AllMacros, AllModules that contains objects describing each form, report, macro and module correspondingly.
* CurrentData. Depends on DoCmd. It holds metadata for each element related with data structures. In this object the available collections are AllTables, AllQueries that contains objects describing each table and query correspondingly.
* DbEngine. Depends on DoCmd. It is the main access point to the data model. It provides access to workspaces.
* Workspace. Depends on DbEngine. Represent database schemes, and provides access to the scheme elements by pointing to the collections QueryDefs and TableDefs.
* TableDef and QueryDef. Depends on Workspace. Each of these objects contains a description. For the TableDefs name and fields. For the QueryDefs name and SQL.
* Forms, Reports and Modules. Depends on DoCmd. Finally, we have three main collections where we can find the Form, Report and Module objects with their inner composition. This internal definition includes composed controls (textbox, labels, etc.), properties (layout, naming, companion-module, etc) and VBA source code.

## Architecture Implementation

![Figure-Architecture](https://github.com/impetuosa/Jindao/blob/master/figures/uml-arc-jindao.jpg?raw=true).



As general architecture we propose to create a model that uses the COM model as a back-end as shown in the next figure We propose lazy access to the COM model back-end, what will guarantee that we access and load only what is needed. This feature aims to limit the memory usage (constraint stated in Section 2) by construction. The lazy approach will also allow us to map each binary-model-entity to a model-entity one at a time. We also propose to cache the results, for reducing the COM calls and therefore CPU time and inter-process communication.
Regarding the mapping between the COM model entity-type and our model, we propose to use two kinds of mapping: by type and by attribute value. First- class citizen entities are represented by two COM models, and that is why all of them subclass from a LoadableObject class, which maps two COM models instead of one.
For mapping the binary-model-entities to model-entity types, we propose to use factories. The mapping factory by type maps one binary-entity-type to one model-entity-type. The mapping factory by attribute value maps one binary- entity to one specific model-entity-type according to one specific binary-entity value.

## More documentation

* For documentation about the Jindao MSAccess first citizen usage, please address  [API.md](API.md)
* For documentation about the Jindao connector internals, please address [InternalAPI.md](InternalAPI.md).
* For documentation about the Microsoft Access object model, please address [https://learn.microsoft.com/en-us/office/vba/api/overview/access](https://learn.microsoft.com/en-us/office/vba/api/overview/access)

## Other modules

* For documentation about the JinNamespaces symbol table, please address [Namespace.md](Namespace.md).
* For documentation about the JinDAM Data Access Model (unification model for further imports to Moose and Moxing) please, address  [DataAccessModel.md](DataAccessModel.md).










"
Class {
	#name : #JindaoManifest,
	#superclass : #PackageManifest,
	#category : #'Jindao-Manifest'
}

{ #category : #'as yet unclassified' }
JindaoManifest class >> apiPackages [

	^ self tags: #( 'MSAccess-Project' 'MSAccess-Database' 'MSAccess-Code' 'MSAccess-Widgets' 'MSAccess-Widgets-Builtin-Controls' 'MSAccess-Library')
]

{ #category : #'3- Tables' }
JindaoManifest class >> exampleAccessTableInformation [

	<example>
	| project table recordset records |
	" Opens an access project "
	project := JinAccessApplication default open: self projectPath.


	"Choose a random table"
	table := project tables first.

	"Get's a recordset form the table"
	recordset := table recordset.
	records := OrderedCollection new.

	"Fills up the records collection with the first two rows"
	[ recordset atEnd not and: [ records size < 3 ] ] whileTrue: [ 
		records add:
			(recordset fields collect: [ :f | f name , '=' , f value asString ]).
		recordset next ].
	"Closes the recordset "
	recordset close.

	"Inspects the stored information"
	records inspect.

	" Closes the project and quits the Microsoft Access application "
	project closeAndQuit
]

{ #category : #'2- Forms' }
JindaoManifest class >> exampleCountControls [

	<example>
	| project controls |
	" Opens an access project "
	project := JinAccessApplication default open: self projectPath.


	" Flat collect the amount of controls per form. As Microsoft Access has a limit of forms opened at the same time, we close them as soon as we finished with it. "
	controls := (project forms collect: [ :f | 
		             | size |
		             size := f controls size.
		             f close.
		             size ]) sum.

	" Opens the transcript to see the next message "
	Transcript open.

	" Traces the amount of forms and forms and controls "
	self traceCr:
		('The project has {1} forms and defines a total of {2} controls ' 
			 format: { 
					 project forms size asString.
					 controls asString }).

	" Closes the project and quits the Microsoft Access application "
	project closeAndQuit
]

{ #category : #'4- Libraries' }
JindaoManifest class >> exampleLibrariesAnalysis [

	<example>
	| project reference stringsModule signatures |
	" Opens an access project "
	project := JinAccessApplication default open: self projectPath.


	" 
	A project has references. A reference can be either a DLL library or an AccessModule. 
	In this example we find the VBA library, which includes the VBA language builtin types and functions.
	
	 "

	reference := project references detect: [ :r | r name = #VBA ].


	" 
	The reference object is a meta-object which includes information such as the version and GUID of the library and which knows how to obtain the Path of the library in this running computer. 
	 "
	Transcript open.

	reference name traceCr.
	reference version traceCr.
	reference guid traceCr.

	" 
	The reference object can give us access to a library reification, which analyses the library file (ex: DLL) and exposes all the content.
	
	This handle allows for example, to find all the defined types in the library. 
	In our example we get the module where all the string functions are defined. 
	
	 "
	stringsModule := reference library types detect: [ :t | 
		                 t name = #Strings ].

	" 
	
	As the strings module is an object too, we can get all the mehods or functions defined within. 
	Which are also objects. 
	In this part of the example we obtain all the signatures of all the methods defined in the Strings module, shipped with the VBA language. 
	"
	signatures := stringsModule methods collect: [ :m | 
		              m returnTypeName , ' ' , m selector , '('
		              , m parameters size asString , ')' ].

	signatures traceCr.
	signatures inspect.

	project closeAndQuit
]

{ #category : #'2- Forms' }
JindaoManifest class >> exampleLoadAstModule [

	<example>
	| project form |
	" Opens an access project "
	project := JinAccessApplication default open: self projectPath.


	"Choose a random form from all those forms with module (attached code) "
	form := project forms detect: [ :a | 
		        | f |
		        f := a hasModule.
		        a ensureUnload.
		        f ].

	"Inspect the form's ast"
	form ast inspect.

	" Closes the project and quits the Microsoft Access application "
	project closeAndQuit
]

{ #category : #'1- Starting' }
JindaoManifest class >> exampleOpenAndQuitProject [

	<example>
	| project |
	" Opens an access project "
	project := JinAccessApplication default open: self projectPath.

	" waits for the user to press ok "
	UIManager default alert:
		'Please press OK to continue and close the Access project '.


	" Closes the project and quits the Microsoft Access application "
	project closeAndQuit
]

{ #category : #'3- Tables' }
JindaoManifest class >> exampleTableInformation [

	<example>
	| project table |
	" Opens an access project "
	project := JinAccessApplication default open: self projectPath.


	"Choose a random table"
	table := project tables first.

	" A table is an object. "

	table name traceCr.

	" It has fields "
	table fields do: [ :f | 
		f name trace.
		' ' trace.
		f typeName traceCr ].


	" A table also has indexes "
	(String streamContents: [ :stream | 
		 table indexes do: [ :i | 
			 stream
				 nextPutAll: 'IndexName: ';
				 nextPutAll: i name;
				 nextPutAll: 'Affects Columns (';
				 nextPutAll: (',' join: (i fields collect: #name));
				 nextPutAll: ')';
				 nextPutAll: String lf ] ]) traceCr.
	table close.
	" Closes the project and quits the Microsoft Access application "
	project closeAndQuit
]

{ #category : #'as yet unclassified' }
JindaoManifest class >> implementationPackages [

	^ self tags: #( Core 'Core-RemoteCollections' 'Core-Factories' )
]

{ #category : #'3- Tables' }
JindaoManifest class >> loadAddBaseline [

	<load>
	| spec |
	spec
		baseline: 'Jindao'
		with: [ 
		spec repository: 'github://impetuosa/Jindao:v2.x.x/src' ]
]

{ #category : #'3- Tables' }
JindaoManifest class >> loadMetacello [

	<load>
	  Metacello new
    	githubUser: 'Impetuosa' project: 'Jindao' commitish: 'v1.x.x' path: 'src';
    	baseline: 'Jindao';
    	onWarningLog;
    	load
	

]

{ #category : #'as yet unclassified' }
JindaoManifest class >> projectPath [

	^ (UIManager default
		   chooseFullFileNameMatching: #( accdb )
		   label: 'Please find a accdb file to open') ifNil: [ 
		  self error: 'Must choose a project' ]
]
