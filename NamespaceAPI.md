# JinNamespaces - API

## JinNSSymbolTable
I am a Symbol Table.
I am built based on a specific Microsoft Access project. 
I may contain information of other Microsoft Projects if my original project uses other Microsoft Access projects as dependency. 
I have two main instance variables: 
**external** holds a namespace which aggregates all the symbols declared within my main project.
**assembly** holds namespaces per each associated (referenced) artifact: libraries or other Access projects. 

The external namespace is named external as it holds not only the subhierarchies of symbols but also **all** publically visible elements (or the external visibility of the project). 



### Properties
external
assembly
allSymbols

### Methods
#### JinNSSymbolTable>>namespaceFor: aJinDAMAccessModule kind: aJinNSKind
Obtains a namespace for a given name

#### JinNSSymbolTable>>saveAs: aString
Exports a symbol table in ston format. Receives a file path as parameter (String | FileReference)


### Class Methods
#### JinNSSymbolTable class>>loadFrom: aString
Imports a symbol table in ston format. Receives a file path as parameter (String | FileReference)



## JinNSKind
A kind denotes a kind of symbol. 
Symbols are described with this kind of value to denote the nature of the artefacts they declare. 
Like this, when we find a function declaration, we register the symbol of kind ```JinNSKind function```

### Properties
kind

### Class Methods
#### JinNSKind class>>report
Any symbol with this kind is related with a report

#### JinNSKind class>>set
Any symbol with this kind is related with a property setter

#### JinNSKind class>>sub 
Any symbol with this kind is related with a subprocedure

#### JinNSKind class>>globalVariable
Any symbol with this kind is related with a global variable

#### JinNSKind class>>query
Any symbol with this kind is related with a query

#### JinNSKind class>>classAlias
Any symbol with this kind is related with an class alias

#### JinNSKind class>>module
Any symbol with this kind is related with a module

#### JinNSKind class>>classModule
Any symbol with this kind is related with an class module

#### JinNSKind class>>form
Any symbol with this kind is related with a form

#### JinNSKind class>>enum
Any symbol with this kind is related with an enumeration

#### JinNSKind class>>attribute
Any symbol with this kind is related with an attribute

#### JinNSKind class>>function 
Any symbol with this kind is related with a function

#### JinNSKind class>>let
Any symbol with this kind is related with a property letter

#### JinNSKind class>>get
Any symbol with this kind is related with a property getter

#### JinNSKind class>>method
Any symbol with this kind is related with a method

#### JinNSKind class>>reference
Any symbol with this kind is related with a reference

#### JinNSKind class>>enumEntry
Any symbol with this kind is related with an enum value

#### JinNSKind class>>typeProperty
Any symbol with this kind is related with a property

#### JinNSKind class>>userType
Any symbol with this kind is related with a user type

#### JinNSKind class>>variable
Any symbol with this kind is related with a variable

#### JinNSKind class>>event 
Any symbol with this kind is related with an event

#### JinNSKind class>>externalFunction
Any symbol with this kind is related with an external function

#### JinNSKind class>>table
Any symbol with this kind is related with a table

#### JinNSKind class>>field
Any symbol with this kind is related with a field

#### JinNSKind class>>interface
Any symbol with this kind is related with an interface

#### JinNSKind class>>constant
Any symbol with this kind is related with a constant

#### JinNSKind class>>primitiveType
Any symbol with this kind is related with a primitive type 

#### JinNSKind class>>externalSub
Any symbol with this kind is related with an external subprocedure

#### JinNSKind class>>struct
Any symbol with this kind is related with a struct

#### JinNSKind class>>parameter
Any symbol with this kind is related with a parameter



## JinNSNameEntry
A name entry is a symbol which has a kind (JinNSKind - what it is) an owner (JinNSEntryOwner where it was defined). 


### Properties
parent
name
owner
kind

### Methods
#### JinNSNameEntry>>containingSymbols
Return all the entries where this element has been declared, starting by the inner-most element. Function, Module, Library, Project 

#### JinNSNameEntry>>findSymbol: aString
Polimorphic with a namespace. If the given string matches this symbols name, it returns a collection with self within. Empty collection if not.



## JinNSNamespace
There are Five levels of namespace in VBA: 
Export (the things that are accessible externally from an assembly)
Assembly (The configuration of a single VBA project) 
Reference (AccessModule / Library)
Type (class, module, table, etc).
Method / Function / Producedure.


### Properties
parent
tag
name
entries
entriesMutex
friends
allSymbols

### Methods
#### JinNSNamespace>>friendFindSymbol: aString
Return all symbols visible by in any friend namespace named as given.

#### JinNSNamespace>>namespaceFor: aString kind: aJinNSKind
Find any entry (sub-namespace included) with the name and kind given within the context of this (sub)namespace. 

#### JinNSNamespace>>anchor
Returns an Anchor. An anchor is the path to take to find a specific symbol from the root namespace .

#### JinNSNamespace>>containingSymbols
Return all the entries where this element has been declared, starting by the inner-most element. Function, Module, Library, Project 

#### JinNSNamespace>>findSymbol: aString
Return all symbols visible by in this namespace named as given.

#### JinNSNamespace>>friendsNamespaceFor: aString kind: aJinNSKind
Find any entry (sub-namespace included) with the name and kind given within the context of any "friend" (sub)namespace. (for example, in the context of a project, the friend namespaces are those of included libraries)



## JinNSSubNamespace
Subnamespaces are symbols (named entries) which contain other entries within. 
As a defined a named context (with the name of the class) and contains all the entries within representing other names (attributes, functions, etc).


### Properties
parent
tag
name
entries
entriesMutex
friends
allSymbols
owner
path

### Methods
#### JinNSSubNamespace>>anchor
Returns an Anchor. An anchor is the path to take to find a specific symbol from the root namespace .

#### JinNSSubNamespace>>containingSymbols
Return all the entries where this element has been declared, starting by the inner-most element. Function, Module, Library, Project 



