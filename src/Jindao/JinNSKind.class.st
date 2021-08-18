Class {
	#name : #JinNSKind,
	#superclass : #Object,
	#instVars : [
		'kind'
	],
	#classInstVars : [
		'entries'
	],
	#category : #'Jindao-NamespaceIndex'
}

{ #category : #'as yet unclassified' }
JinNSKind class >> assembly [

	^ self entry: #assembly
]

{ #category : #accessing }
JinNSKind class >> attribute [
	 ^ self entry: #attribute 
]

{ #category : #accessing }
JinNSKind class >> attributes [
  ^ self attribute 
]

{ #category : #'as yet unclassified' }
JinNSKind class >> classAlias [

	^ self entry: #classAlias
]

{ #category : #convenience }
JinNSKind class >> classModule [

	^ self entry: #classModule
]

{ #category : #generated }
JinNSKind class >> constant [

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

	^ self entry: #enum
]

{ #category : #convenience }
JinNSKind class >> enumEntry [

	^ self entry: #enumEntry
]

{ #category : #convenience }
JinNSKind class >> event [ 

	^ self entry: #event
]

{ #category : #convenience }
JinNSKind class >> externalFunction [

	^ self entry: #externalFunction
]

{ #category : #convenience }
JinNSKind class >> externalSub [

	^ self entry: #externalSub
]

{ #category : #'as yet unclassified' }
JinNSKind class >> field [

	^ self entry: #field
]

{ #category : #convenience }
JinNSKind class >> form [

	^ self entry: #form
]

{ #category : #convenience }
JinNSKind class >> forms [ 
	^ self form 
]

{ #category : #convenience }
JinNSKind class >> function [ 

	^ self entry: #function
]

{ #category : #convenience }
JinNSKind class >> functions [

	^ self function
]

{ #category : #convenience }
JinNSKind class >> get [
	^ self entry: #get
]

{ #category : #convenience }
JinNSKind class >> globalVariable [

	^ self entry: #globalVariable
]

{ #category : #convenience }
JinNSKind class >> initialize [ 	
	entries := Dictionary new .
]

{ #category : #generated }
JinNSKind class >> interface [
	 ^ self entry: #interface. 
]

{ #category : #generated }
JinNSKind class >> interfaces [
	 ^ self interface 
]

{ #category : #convenience }
JinNSKind class >> let [
	^ self entry: #let
]

{ #category : #convenience }
JinNSKind class >> module [

	^ self entry: #module
]

{ #category : #convenience }
JinNSKind class >> modules [

	^ self module 
]

{ #category : #accessing }
JinNSKind class >> parameter [
	 ^ self entry: #parameter 
]

{ #category : #convenience }
JinNSKind class >> primitiveType [

	^ self entry: #primitiveType
]

{ #category : #convenience }
JinNSKind class >> queries [

	^ self query 
]

{ #category : #convenience }
JinNSKind class >> query [

	^ self entry: #query
]

{ #category : #'as yet unclassified' }
JinNSKind class >> reference [

	^ self entry: #reference
]

{ #category : #accessing }
JinNSKind class >> references [

	^ self reference
]

{ #category : #convenience }
JinNSKind class >> report [

	^ self entry: #report
]

{ #category : #convenience }
JinNSKind class >> reports [

	^ self report   
]

{ #category : #convenience }
JinNSKind class >> set [
	^ self entry: #set
]

{ #category : #'as yet unclassified' }
JinNSKind class >> struct [

	^ self entry: #struct
]

{ #category : #convenience }
JinNSKind class >> sub [ 

	^ self entry: #sub
]

{ #category : #convenience }
JinNSKind class >> table [

	^ self entry: #table
]

{ #category : #convenience }
JinNSKind class >> tables [ 

	^ self table  
]

{ #category : #convenience }
JinNSKind class >> typeProperty [

	^ self entry: #typeProperty
]

{ #category : #convenience }
JinNSKind class >> userType [

	^ self entry: #userType
]

{ #category : #generated }
JinNSKind class >> variable [

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
	^ kind = ##assembly
]

{ #category : #testing }
JinNSKind >> isAttribute [

	^ self isAnyOf: #( isVariable isLocalVariable isGlobalVariable isField isTypeProperty isConstant isParameter)
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
JinNSKind >> isExternalFunction [
	^ kind = #externalFunction
]

{ #category : #testing }
JinNSKind >> isExternalSub [
	^ kind = #externalSubprocedure
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

{ #category : #testing }
JinNSKind >> isInvocable [

	^ self isAnyOf:
		  #( isEvent isFunction isSub isExternalFunction isExternalSub isLet isGet isSet)
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
	^ kind = #query
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

{ #category : #testing }
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
