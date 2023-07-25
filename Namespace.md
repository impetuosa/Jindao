# JinNamespaces - ReadMe
## Manifest
As detailed in [https://inria.hal.science/hal-02966146v1](https://inria.hal.science/hal-02966146v1), 
Microsoft Access does not have an official format to export code. 
Moreover, we can access structural information through the usage of the COM interface (implemented by the Jindao project[https://github.com/impetuosa/jindao](https://github.com/impetuosa/jindao)), and access behavioural information through the syntactical analysis of the textual part of the code (implemented by the VBParser [https://github.com/impetuosa/VBParser](https://github.com/impetuosa/VBParser)).
However, many things are still complex when analyzing a Microsoft Access project. 
One is to infer the symbol visibility or the namespaces, as namespaces are not explicit in Microsoft Access, VBA or VB6.
JinNamespaces is a package based on the information obtained through the usage of Jindao COM interface and VBParser produces what is named a symbol table.
A symbol table ([https://en.wikipedia.org/wiki/Symbol_table](https://en.wikipedia.org/wiki/Symbol_table)), is normally a tree structure which contains tables of names. 
The tree structure helps to define a hierarchical namespace which defines a context of validity and semantics for a given symbol. 
Such structure is not often needed in the analysis. Still, in our case, we are analysing a language that does not have imports and has an implicit set of rules to define what is visible and what is not according to the project and the relation with it references. 
The references are libraries (DLL) and Microsoft Access Modules (other Microsoft Access projects) used by the project we are analysing. 
As VBA holds an ambiguous grammar, the artefact's nature cannot be inferred from usage. E.g. In the following code, **Something** could be a function with one as a parameter or array access to position 1. 
```
Private Sub example () 
 dim a as Integer 
 
 a = Something(1)
End Sub
```
Meanwhile, it could exist, of course, a function named **Something** with another parameter type or more parameters. 
This means that we are forced to know what is this Something in this specific case, to know if we have at hand a function invocation expression or not. 
To learn about this, we need to gather the different declarations systematically and consistently, which allows us to know, while building a model what it is that the syntax is talking about. 


## More documentation
* For documentation about the Namespaces usage, please address to [NamespaceAPI.md](NamespaceAPI.md)
* For documentation about the Namespaces internals, please address to [NamespaceInternalAPI.md](NamespaceInternalAPI.md).





## Project Examples
```smalltalk
exampleCreateSymbolTableFromScratch
	| project symbolTable symbolTableBuilder |
	
	" 
	To create a Symbol table we must:
		* open the project with Jindao. 
		* create a JNSBuilder instance. 
		* ask the builder to builda symbol table for the opened project.
	This process may take more or less time according to the size of the project. 
	
	Once the process is finished, we can close the project object. 
		
	"
	
	project := JinAccessApplication default open: self projectPath.
	symbolTableBuilder := JinNSBuilder new.
	symbolTable := symbolTableBuilder buildFor: project.
	project closeAndQuit.
	symbolTable inspect. 
	
```
```smalltalk
exampleSaveSymboltableIntoFile
	| symbolTable |
	" 
	To save a symbol table into a file, is easy. 
	Just provide a file reference pointing to the file expected to be written: 
	
	symbolTable saveAs: 'my.file.ston'.
		
	"
	symbolTable := JinNSSymbolTable new.
	symbolTable saveAs: 'my.file.ston' asFileReference.
	'my.file.ston' asFileReference inspect.
```
```smalltalk
exampleLoadSymboltableFromFile
	| symbolTable |
	
	" 
	To load a symbol table from files, you must only provide a valid file reference to the 
	JinNSSymbolTable class>>#loadFrom: method. 
		
	"
	symbolTable := JinNSSymbolTable loadFrom: self importingFile.
	symbolTable inspect. 
	
```



