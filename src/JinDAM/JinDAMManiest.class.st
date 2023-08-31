"
As detailed in [https://inria.hal.science/hal-02966146v1](https://inria.hal.science/hal-02966146v1), 
Microsoft Access does not have an official format to export code. 

Moreover, we can access structural information through the usage of the COM interface (implemented by the Jindao project[https://github.com/impetuosa/jindao](https://github.com/impetuosa/jindao)), and to access behavioural information through the syntactical analysis of the textual part of the code (implemented by the VBParser [https://github.com/impetuosa/VBParser](https://github.com/impetuosa/VBParser)).

However there are many things that are still complex when conducting the analysis of a Microsoft Access project. 

This DataAccessModel (DAM) extension merges the information obtained through Jindao and VBParser. To merge the different elements obtained from Jinda and VBParser we uses the Symbol table defined by the Namespaces.

The DAM model is basically a transition model, which is used to produce Alce models (An Access FAMIX model) and Moxing-Access, a model for conducting software migration. 

As DAM is used to extract different models, it is coded to taking account different levels of detail. 




"
Class {
	#name : #JinDAMManiest,
	#superclass : #PackageManifest,
	#category : #'JinDAM-Manifest'
}

{ #category : #'as yet unclassified' }
JinDAMManiest class >> exampleImporterForAlce [

	<example>
	| importer symbolTable path dam |
	" 
	This importer is configured to load all the structure of the project. 
	For the code elements, it only imports the fan-in and fan-out information and arguments types. 
"
	importer := JinDAMImporter new.
	importer provider
		importAccessReferences;
		importDatabase;
		importProjectElements;
		importGUIElements;
		importGUIControlElementsNoObjectProperties;
		importCodeElements;
		importSyntacticElements;
		importLibraryReferences.

	path := self pathToImportedAccessProject.
	symbolTable := JinNSSymbolTable loadFrom: self pathToSymbolTable.

	" 
	The importer requires a symbol table previously calculated. 
"
	dam := importer import: path asFileReference symbolTable: symbolTable.

	" 
	The imported model is not yet linked. i.e. connects all the calls to the methods or functions.
"
	importer link: dam.

	^ dam
]

{ #category : #'as yet unclassified' }
JinDAMManiest class >> exampleImporterForMoxing [
	<example> 
	| importer symbolTable path dam |

" 
	
	This importer is configured to load all the structure of the project. 
	It also imports all the syntactical elements, representing all the written code. 
	It also imports all the forms/reports objects, storing all the configuration properties.
	
"

	importer := JinDAMImporter new.
	importer provider
		importAccessReferences;
		importDatabase;
		importProjectElements;
		importGUIElements;
		importGUIControlElements;
		importCodeElements;
		importAllSyntacticElements;
		importLibraryReferences.


	path := self pathToImportedAccessProject.
	symbolTable := JinNSSymbolTable loadFrom: self pathToSymbolTable.

" 
	The importer requires a symbol table previously calculated. 
"
	dam := importer import: path asFileReference symbolTable: symbolTable.
	
" 
	The imported model is not yet linked. i.e. connects all the calls to the methods or functions.
"
	importer link: dam.
	
	^ dam.
	



]

{ #category : #'as yet unclassified' }
JinDAMManiest class >> exampleImporterForOnlyDatabaseElements [
	<example> 
	| importer symbolTable path dam |

" 
	
	This importer can be used to create an Alce model which only focuses on the Database structural elements. 
	
	
"

	importer := JinDAMImporter new.
	importer provider
		importAccessReferences;
		importProjectElements;
		importDatabase.


	path := self pathToImportedAccessProject.
	symbolTable := JinNSSymbolTable loadFrom: self pathToSymbolTable.

" 
	The importer requires a symbol table previously calculated. 
"
	dam := importer import: path asFileReference symbolTable: symbolTable.
	
" 
	The imported model is not yet linked. i.e. connects all the calls to the methods or functions.
"
	importer link: dam.
	
	^ dam.
	



]

{ #category : #'as yet unclassified' }
JinDAMManiest class >> exampleImporterForOnlyGUIElements [
	<example> 
	| importer symbolTable path dam |

" 
	
	This importer can be used to create an Alce model which only focuses on the GUI structural elements. 
	
	
"

	importer := JinDAMImporter new.
	importer provider
		importAccessReferences;
		importProjectElements;
		importGUIElements;
		importGUIControlElements.


	path := self pathToImportedAccessProject.
	symbolTable := JinNSSymbolTable loadFrom: self pathToSymbolTable.

" 
	The importer requires a symbol table previously calculated. 
"
	dam := importer import: path asFileReference symbolTable: symbolTable.
	
" 
	The imported model is not yet linked. i.e. connects all the calls to the methods or functions.
"
	importer link: dam.

	^ dam.
	



]

{ #category : #'as yet unclassified' }
JinDAMManiest class >> exampleSelectiveImporterForOnlyGUIElements [

	<example>
	| importer symbolTable path dam |
	" 
	
	An importer can be configured to import only the elements that respond to a given block condition. 
	As the importer is configured to be selective, the importer will also try to load all the other things that are used by the selected element. 
	Basically, the idea of this kind of importer is to import fewer elements, and all those elements directly used by those elements. 
	
	
"
	importer := JinDAMImporter new.
	importer provider
		importGUIElements;
		importGUIControlElementsNoObjectProperties;
		importLibraryReferences;
		importProjectElementsThat: [ :a | 
			a isAccessForm and: [ a name = #Name ] ].


	path := self pathToImportedAccessProject.
	symbolTable := JinNSSymbolTable loadFrom: self pathToSymbolTable.

	" 
	The importer requires a symbol table previously calculated. 
"
	dam := importer import: path asFileReference symbolTable: symbolTable.

	" 
	The imported model is not yet linked. i.e. connects all the calls to the methods or functions.
"
	importer link: dam.


	^ dam
]

{ #category : #'as yet unclassified' }
JinDAMManiest class >> pathToImportedAccessProject [

	^ (UIManager default
		   chooseFullFileNameMatching: #( accdb )
		   label: 'Please find a accdb file to open') ifNil: [ 
		  self error: 'Must choose a project' ]
]

{ #category : #'as yet unclassified' }
JinDAMManiest class >> pathToSymbolTable [

	^ (UIManager default
		   chooseFullFileNameMatching: #( ston )
		   label: 'Please find a ston file to open') ifNil: [ 
		  self error: 'Must choose a symbol table' ]
]
