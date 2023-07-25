"
A kind denotes a kind of symbol. 
Symbols are described with this kind of value to denote the nature of the artefacts they declare. 
Like this, when we find a function declaration, we register the symbol of kind ```JinNSKind function```
"
Class {
	#name : #JinNSKind,
	#superclass : #Object,
	#instVars : [
		'kind'
	],
	#classInstVars : [
		'entries'
	],
	#category : #'JinNamespaces-Model'
}

{ #category : #'as yet unclassified' }
JinNSKind class >> assembly [

	^ self entry: #assembly
]

{ #category : #accessing }
JinNSKind class >> attribute [

	<doc: 'Any symbol with this kind is related with an attribute'>
	^ self entry: #attribute
]

{ #category : #accessing }
JinNSKind class >> attributes [
  ^ self attribute 
]

{ #category : #'as yet unclassified' }
JinNSKind class >> classAlias [
		<doc:'Any symbol with this kind is related with an class alias'>
	^ self entry: #classAlias
]

{ #category : #convenience }
JinNSKind class >> classModule [
		<doc:'Any symbol with this kind is related with an class module'>
	^ self entry: #classModule
]

{ #category : #generated }
JinNSKind class >> constant [
		<doc:'Any symbol with this kind is related with a constant'>
	^ self entry: #constant
]

{ #category : #convenience }
JinNSKind class >> entry: aName [

	^ entries at: aName asSymbol ifAbsentPut: [ 
		  self new
			  kind: aName asSymbol;
			  yourself ]
]

{ #category : #convenience }
JinNSKind class >> enum [
		<doc:'Any symbol with this kind is related with an enumeration'>
	^ self entry: #enum
]

{ #category : #convenience }
JinNSKind class >> enumEntry [
		<doc:'Any symbol with this kind is related with an enum value'>
	^ self entry: #enumEntry
]

{ #category : #convenience }
JinNSKind class >> event [ 
		<doc:'Any symbol with this kind is related with an event'>
	^ self entry: #event
]

{ #category : #convenience }
JinNSKind class >> externalFunction [
		<doc:'Any symbol with this kind is related with an external function'>
	^ self entry: #externalFunction
]

{ #category : #convenience }
JinNSKind class >> externalSub [
		<doc:'Any symbol with this kind is related with an external subprocedure'>
	^ self entry: #externalSub
]

{ #category : #'as yet unclassified' }
JinNSKind class >> field [

	<doc: 'Any symbol with this kind is related with a field'>
	^ self entry: #field
]

{ #category : #convenience }
JinNSKind class >> form [
		<doc:'Any symbol with this kind is related with a form'>
	^ self entry: #form
]

{ #category : #convenience }
JinNSKind class >> forms [ 
	^ self form 
]

{ #category : #convenience }
JinNSKind class >> function [ 
		<doc:'Any symbol with this kind is related with a function'>
	^ self entry: #function
]

{ #category : #convenience }
JinNSKind class >> functions [

	^ self function
]

{ #category : #convenience }
JinNSKind class >> get [
		<doc:'Any symbol with this kind is related with a property getter'>
	^ self entry: #get
]

{ #category : #convenience }
JinNSKind class >> globalVariable [
		<doc:'Any symbol with this kind is related with a global variable'>
	^ self entry: #globalVariable
]

{ #category : #convenience }
JinNSKind class >> initialize [ 	
	entries := Dictionary new .
]

{ #category : #generated }
JinNSKind class >> interface [
		<doc:'Any symbol with this kind is related with an interface'>
	 ^ self entry: #interface. 
]

{ #category : #generated }
JinNSKind class >> interfaces [
	 ^ self interface 
]

{ #category : #convenience }
JinNSKind class >> let [
	<doc:'Any symbol with this kind is related with a property letter'>
	^ self entry: #let
]

{ #category : #convenience }
JinNSKind class >> method [
		<doc:'Any symbol with this kind is related with a method'>
	^ self entry: #method
]

{ #category : #convenience }
JinNSKind class >> module [
		<doc:'Any symbol with this kind is related with a module'>
	^ self entry: #module
]

{ #category : #convenience }
JinNSKind class >> modules [

	^ self module 
]

{ #category : #accessing }
JinNSKind class >> parameter [

	<doc: 'Any symbol with this kind is related with a parameter'>
	^ self entry: #parameter
]

{ #category : #convenience }
JinNSKind class >> primitiveType [
		<doc:'Any symbol with this kind is related with a primitive type '>
	^ self entry: #primitiveType
]

{ #category : #convenience }
JinNSKind class >> queries [

	^ self query 
]

{ #category : #convenience }
JinNSKind class >> query [
		<doc:'Any symbol with this kind is related with a query'>
	^ self entry: #query
]

{ #category : #'as yet unclassified' }
JinNSKind class >> reference [
		<doc:'Any symbol with this kind is related with a reference'>
	^ self entry: #reference
]

{ #category : #accessing }
JinNSKind class >> references [

	^ self reference
]

{ #category : #convenience }
JinNSKind class >> report [
		<doc:'Any symbol with this kind is related with a report'>
	^ self entry: #report
]

{ #category : #convenience }
JinNSKind class >> reports [

	^ self report   
]

{ #category : #convenience }
JinNSKind class >> set [
		<doc:'Any symbol with this kind is related with a property setter'>
	^ self entry: #set
]

{ #category : #'as yet unclassified' }
JinNSKind class >> struct [
		<doc:'Any symbol with this kind is related with a struct'>
	^ self entry: #struct
]

{ #category : #convenience }
JinNSKind class >> sub [ 
		<doc:'Any symbol with this kind is related with a subprocedure'>
	^ self entry: #sub
]

{ #category : #convenience }
JinNSKind class >> table [
		<doc:'Any symbol with this kind is related with a table'>
	^ self entry: #table
]

{ #category : #convenience }
JinNSKind class >> tables [ 

	^ self table  
]

{ #category : #convenience }
JinNSKind class >> typeProperty [
		<doc:'Any symbol with this kind is related with a property'>
	^ self entry: #typeProperty
]

{ #category : #convenience }
JinNSKind class >> userType [
		<doc:'Any symbol with this kind is related with a user type'>
	^ self entry: #userType
]

{ #category : #generated }
JinNSKind class >> variable [
		<doc:'Any symbol with this kind is related with a variable'>
	^ self entry: #variable
]

{ #category : #testing }
JinNSKind >> = anObject [ 
	self species = anObject species ifFalse: [^false].
	^ kind = anObject kind 
]

{ #category : #'as yet unclassified' }
JinNSKind >> adaptToAlceAnchorPathFragment [
	^ kind
]

{ #category : #'.' }
JinNSKind >> compatibleWith: aKindOrSymbol [

	^ aKindOrSymbol isSymbol
		  ifTrue: [ self perform: aKindOrSymbol ]
		  ifFalse: [ self = aKindOrSymbol ]
]

{ #category : #accessing }
JinNSKind >> hash [

	^ kind hash
]

{ #category : #testing }
JinNSKind >> isAnyOf: arrayOfSelectors [

	^ arrayOfSelectors anySatisfy: [ :a | self perform: a ]
]

{ #category : #testing }
JinNSKind >> isAssembly [
 
	^ kind = #assembly
]

{ #category : #'general testing' }
JinNSKind >> isAttribute [

	^ self isAnyOf: #( isVariable isLocalVariable isGlobalVariable isField isTypeProperty isConstant isParameter isEnumEntry)
]

{ #category : #testing }
JinNSKind >> isClassAlias [
	^ kind = #classAlias
]

{ #category : #testing }
JinNSKind >> isClassModule [
	^ kind = #classModule
]

{ #category : #testing }
JinNSKind >> isConstant [
	^ kind = #constant 
]

{ #category : #testing }
JinNSKind >> isEnum [
	^ kind = #enum 
]

{ #category : #testing }
JinNSKind >> isEnumEntry [ 
	^ kind = #enumEntry
]

{ #category : #testing }
JinNSKind >> isEvent [
	^ kind = #event
]

{ #category : #testing }
JinNSKind >> isExternal [

	^ self isAnyOf: #( isExternalFunction isExternalSub )
]

{ #category : #testing }
JinNSKind >> isExternalFunction [
	^ kind = #externalFunction
]

{ #category : #testing }
JinNSKind >> isExternalSub [
	^ kind = #externalSub
]

{ #category : #testing }
JinNSKind >> isField [
	 ^ kind = #field
]

{ #category : #testing }
JinNSKind >> isForm [
	^ kind = #form
]

{ #category : #testing }
JinNSKind >> isFunction [ 
	^ kind = #function
]

{ #category : #testing }
JinNSKind >> isGet [
	^ kind = #get 
]

{ #category : #testing }
JinNSKind >> isGlobalVariable [ 
	 ^ kind = #globalVariable 
]

{ #category : #'general testing' }
JinNSKind >> isInvocable [

	^ self isAnyOf:
		  #( isEvent isFunction isMethod isSub isExternalFunction isExternalSub isLet isGet isSet)
]

{ #category : #testing }
JinNSKind >> isLet [
	^ kind = #let 
]

{ #category : #testing }
JinNSKind >> isLocalVariable [ 
	 ^ kind = #localVariable 
]

{ #category : #testing }
JinNSKind >> isMethod [

	^ kind = #method
]

{ #category : #testing }
JinNSKind >> isModule [
	^ kind = #module
]

{ #category : #testing }
JinNSKind >> isParameter [

	^ kind = #parameter
]

{ #category : #testing }
JinNSKind >> isPrimitiveType [ 
	 ^ kind = #primitiveType 
]

{ #category : #testing }
JinNSKind >> isQuery [
	^ kind = #query or: [ self isTable ]
]

{ #category : #testing }
JinNSKind >> isReference [ 
	^ kind = #reference
]

{ #category : #testing }
JinNSKind >> isReport [
	^ kind = #report
]

{ #category : #testing }
JinNSKind >> isSet [
	^ kind = #set
]

{ #category : #testing }
JinNSKind >> isStruct [
	^ kind = #struct
]

{ #category : #testing }
JinNSKind >> isSub [
	^ kind = #sub
]

{ #category : #testing }
JinNSKind >> isTable [
	^ kind = #table
]

{ #category : #'general testing' }
JinNSKind >> isType [

	^ self isAnyOf:
		  #( isForm isReport isModule isClassModule isTable isQuery isEnum
		     isUserType isStruct isClassAlias isPrimitiveType )
]

{ #category : #testing }
JinNSKind >> isTypeProperty [ 
	 ^ kind = #typeProperty 
]

{ #category : #testing }
JinNSKind >> isUserType [
	^ kind = #userType 
]

{ #category : #testing }
JinNSKind >> isVariable [ 
	 ^ kind = #variable 
]

{ #category : #accessing }
JinNSKind >> kind [

	^ kind
]

{ #category : #accessing }
JinNSKind >> kind: aString [ 
	kind := aString
]

{ #category : #testing }
JinNSKind >> printOn: aStream [

	aStream
		nextPutAll: 'NSKind:';
		nextPutAll: kind
]

{ #category : #visiting }
JinNSKind >> visitControls: aJinCachedEntityCollection for: aJinNSEntryOwner [

	self currentNamespace
		registerAll: aJinCachedEntityCollection allNames 
		kind: JinNSKind typeProperty
		owner: aJinNSEntryOwner
]
