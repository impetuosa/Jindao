# Jindao
JinDao (進道) is a project faor Microsoft Access usage. JinDao does not mean anything, but puts together Jin (get into) and Dao (way).
## Manifest
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




## Project Examples
```smalltalk
exampleAccessTableInformation
	| project table recordset records |
	" Opens an access project "
	project := JinAccessApplication default open: self projectPath.

	"Choose a random table"
	table := project tables shuffle first.
	"Get's a recordset form the table"
	recordset := table recordset.
	records := OrderedCollection new.
	
	"Fills up the records collection with the first two rows"
	[ recordset atEnd not and: [ records size < 3 ] ] whileTrue: [
		records add:
			(recordset fields collect: [ :f | f name , '=' , f value asString ]) ].
	"Closes the recordset "
	recordset close. 
	
	"Inspects the stored information"
	records inspect. 
	
	" Closes the project and quits the Microsoft Access application "
	project closeAndQuit
```
```smalltalk
exampleCountControls
	
	| project controls |
	
	" Opens an access project "
	project := JinAccessApplication default open: self projectPath.
	
	" Flat collect the amount of controls per form. As Microsoft Access has a limit of forms opened at the same time, we close them as soon as we finished with it. "
	controls := project forms flatCollect: [ :f |
		            | size |
		            size := f controls size.
		            f close.
		            size ] sum.
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
```
```smalltalk
exampleOpenAndQuitProject
	| project |
	" Opens an access project "
	project := JinAccessApplication default open: self projectPath.
	" waits for the user to press ok "
	UIManager default alert:
		'Please press OK to continue and close the Access project '.

	" Closes the project and quits the Microsoft Access application "
	project closeAndQuit
```
```smalltalk
exampleLoadAstModule
	| project form |
	" Opens an access project "
	project := JinAccessApplication default open: self projectPath.

	"Choose a random form from all those forms with module (attached code) "
	form := (project forms select: [ :a | a hasModule ]) shuffle first.
	"Inspect the form's ast"
	form ast inspect.
	" Closes the project and quits the Microsoft Access application "
	project closeAndQuit
```


## More documentation

For documentation about the Jindao MSAccess first citizen usage, please address to [API.md](API.md)
For documentation about the Jindao connector internals, please address to [InternalAPI.md](InternalAPI.md).







