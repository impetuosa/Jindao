"
As detailed in [https://inria.hal.science/hal-02966146v1](https://inria.hal.science/hal-02966146v1), 
Microsoft Access does not have an official format to export code. 

Moreover, we can access structural information through the usage of the COM interface (implemented by the Jindao project[https://github.com/impetuosa/jindao](https://github.com/impetuosa/jindao)), and to access behavioural information through the syntactical analysis of the textual part of the code (implemented by the VBParser [https://github.com/impetuosa/VBParser](https://github.com/impetuosa/VBParser)).

However there are many things that are still complex when conducting the analysis of a Microsoft Access project. 
One of those is to infer the symbol visibility or the namespaces, as namespaces are not explicit in Microsoft Access, VBA nor VB6.

JinNamespaces is a package which based on the information obtained throught the usage of Jindao COM interface and VBParser produces what is named a symbol table.
A symbol table ([https://en.wikipedia.org/wiki/Symbol_table](https://en.wikipedia.org/wiki/Symbol_table)), is normally a tree structure which contains tables of names. 

The tree structure helps to define a hierarhical namespace which defines a context of validity and semantic for a given symbol. 


Such structure is not often needed in analysis, but in our case, we are analysing a language that does not have imports, and has an implicit set of rules to define what is visible and what is not according to the project and the relation with it references. 

The references are libraries (DLL) and Microsoft Access Modules (other Microsoft Access projects) used by the project that we are analysing. 

As VBA holds an ambiguous grammar, artefacts nature cannot be infer from usage. E.g. In the following code, **Something** could be a function with 1 as parameter, or an array access to the position 1. 

```
Private Sub example () 
 dim a as Integer 
 
 a = Something(1)

End Sub
```

Meanwhile it could exists of course a function named **Something** with other parameter type, or more parameters. 
This means that we are forced to know what is this Something in this specific case, to know if we have at hand a function invocation expression or not. 

To learn about this, we need to gather the different declarations in a systematic and consistent fashion, which allow us to to know, while building a model what is it that the syntax is talking about. 






















"
Class {
	#name : #JinNamespacesManifest,
	#superclass : #PackageManifest,
	#category : #'JinNamespaces-Manifest'
}
