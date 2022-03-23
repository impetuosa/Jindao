Class {
	#name : #JinNSSDKLibraryBuilder,
	#superclass : #Object,
	#instVars : [
		'namespace',
		'owner'
	],
	#category : #'Jindao-NamespaceIndex'
}

{ #category : #'as yet unclassified' }
JinNSSDKLibraryBuilder class >> forModel: aModel [

	^ self new
		  model: aModel;
		  yourself
]

{ #category : #alias }
JinNSSDKLibraryBuilder >> aliasTypes [

	^ { 
		  self float.
		  self int32.
		  self int16.
		  self int.
		  self ubyte.
		  self winVariant.
		  self bstring.
		  self dispatchInstance.
		  self bool.
		  self userDefined.
		  self uint.
		  self uint32.
		  self uint16.
		  self ulonglong.
		  self ulong.
		  self currentDb.
		  self err.
		  self voidAlias.
		  self winWideString }
]

{ #category : #alias }
JinNSSDKLibraryBuilder >> bool [

	^ self newAlias: #BOOL 
]

{ #category : #'primitive types' }
JinNSSDKLibraryBuilder >> boolean [

	^ self primitiveTypeNamed: #Boolean
]

{ #category : #alias }
JinNSSDKLibraryBuilder >> bstring [

	^ self newAlias: #BSTRString 
]

{ #category : #API }
JinNSSDKLibraryBuilder >> buildOn: aNamespace [

	self assert: aNamespace parent isNil.
	owner := JinNSEntryOwner new
		         type: JinLibrary;
		         name: #VBALang;
		         contentHash: (MD5 hashMessage:  '-1') hex   ;
		         yourself.
	
	namespace := aNamespace.
	self primitiveTypes.
	self aliasTypes.
	self globals.
	self debugClass.
	namespace := nil
]

{ #category : #'primitive types' }
JinNSSDKLibraryBuilder >> byte [
	^ self primitiveTypeNamed: #Byte
		
	
]

{ #category : #'primitive types' }
JinNSSDKLibraryBuilder >> currency [
	^ self primitiveTypeNamed: #Currency
		
	
]

{ #category : #alias }
JinNSSDKLibraryBuilder >> currentDb [

	^ self newAlias: #CurrentDB 
]

{ #category : #'primitive types' }
JinNSSDKLibraryBuilder >> date [
	^ self primitiveTypeNamed: #Date
		
	
]

{ #category : #'sdk classes' }
JinNSSDKLibraryBuilder >> debugClass [

	| sns dbgclass |
	sns := namespace
		       registerSubNamespace: #Debug
		       kind: JinNSKind classModule
		       owner: owner.

	dbgclass := JinNSEntryOwner new
		            type: JinModule;
		            name: 'VBLang.Debug';
		            contentHash: (MD5 hashMessage: 'VBLang.Debug') hex;
		            yourself.
	sns register: #Assert kind: JinNSKind sub owner: dbgclass.
	sns register: #Print kind: JinNSKind sub owner: dbgclass
]

{ #category : #'primitive types' }
JinNSSDKLibraryBuilder >> decimal [
	^ self primitiveTypeNamed: #Decimal
		
	
]

{ #category : #alias }
JinNSSDKLibraryBuilder >> dispatchInstance [

	^ self newAlias: #COMDispatchInterface
]

{ #category : #'primitive types' }
JinNSSDKLibraryBuilder >> double [
	^ self primitiveTypeNamed: #Double
		
	
]

{ #category : #globals }
JinNSSDKLibraryBuilder >> emptyObject [

	^ self newGlobal: #Empty
]

{ #category : #alias }
JinNSSDKLibraryBuilder >> err [

	^ self newAlias: #Err
]

{ #category : #alias }
JinNSSDKLibraryBuilder >> float [

	^ self newAlias: #float
]

{ #category : #globals }
JinNSSDKLibraryBuilder >> globals [

	^ { 
		  self nullObject.
		  self nothingObject.
		  self emptyObject }
]

{ #category : #alias }
JinNSSDKLibraryBuilder >> int [

	^ self newAlias: #int 
]

{ #category : #alias }
JinNSSDKLibraryBuilder >> int16 [

	^ self newAlias: #int16 
]

{ #category : #alias }
JinNSSDKLibraryBuilder >> int32 [

	^ self newAlias: #int32 
]

{ #category : #'primitive types' }
JinNSSDKLibraryBuilder >> integer [
	^ self primitiveTypeNamed: #Integer
		
	
]

{ #category : #'primitive types' }
JinNSSDKLibraryBuilder >> long [
	^ self primitiveTypeNamed: #Long
		
	
]

{ #category : #'primitive types' }
JinNSSDKLibraryBuilder >> longLong [

	^ self primitiveTypeNamed: #LongLong
]

{ #category : #'primitive types' }
JinNSSDKLibraryBuilder >> longPtr [
	^ self primitiveTypeNamed: #LongPtr
		
	
]

{ #category : #alias }
JinNSSDKLibraryBuilder >> newAlias: aName [

	namespace register: aName kind: JinNSKind classAlias owner: owner  
]

{ #category : #globals }
JinNSSDKLibraryBuilder >> newGlobal: aName [

	namespace register: aName kind: JinNSKind globalVariable owner: owner
]

{ #category : #globals }
JinNSSDKLibraryBuilder >> nothingObject [

	^ self newGlobal: #Nothing 
]

{ #category : #globals }
JinNSSDKLibraryBuilder >> nullObject [

	^ self newGlobal: #Null 
]

{ #category : #'primitive types' }
JinNSSDKLibraryBuilder >> object [
	^ self primitiveTypeNamed: #Object
		
	
]

{ #category : #'primitive types' }
JinNSSDKLibraryBuilder >> primitiveTypeNamed: aName [

	^ namespace
		  register: aName
		  kind: JinNSKind primitiveType
		  owner: owner
]

{ #category : #'primitive types' }
JinNSSDKLibraryBuilder >> primitiveTypes [

	^ { 
		self boolean.
		self byte.
		self currency.
		self date.
		self decimal.
		self double.
		self integer.
		self long.
		self longPtr.
		self longLong.
		self object. 
		self single.
		self string.
		self variant .
		self void 
	}
]

{ #category : #'primitive types' }
JinNSSDKLibraryBuilder >> single [
	^ self primitiveTypeNamed: #Single
		
	
]

{ #category : #'primitive types' }
JinNSSDKLibraryBuilder >> string [
	^ self primitiveTypeNamed: #String
		
	
]

{ #category : #alias }
JinNSSDKLibraryBuilder >> ubyte [

	^ self newAlias: #ubyte 
]

{ #category : #alias }
JinNSSDKLibraryBuilder >> uint [

	^ self newAlias: #uint 
]

{ #category : #alias }
JinNSSDKLibraryBuilder >> uint16 [

	^ self newAlias: #uint16
]

{ #category : #alias }
JinNSSDKLibraryBuilder >> uint32 [

	^ self newAlias: #uint32 
]

{ #category : #alias }
JinNSSDKLibraryBuilder >> ulong [

	^ self newAlias: #ulong
]

{ #category : #alias }
JinNSSDKLibraryBuilder >> ulonglong [

	^ self newAlias: #ulonglong
]

{ #category : #alias }
JinNSSDKLibraryBuilder >> userDefined [

	^ self newAlias: #USERDEFINED 
]

{ #category : #'primitive types' }
JinNSSDKLibraryBuilder >> variant [
	^ self primitiveTypeNamed: #Variant
		
	
]

{ #category : #'primitive types' }
JinNSSDKLibraryBuilder >> void [
	^ self primitiveTypeNamed: #Void
		
	
]

{ #category : #alias }
JinNSSDKLibraryBuilder >> voidAlias [

	^ self newAlias: #VOID
]

{ #category : #alias }
JinNSSDKLibraryBuilder >> winVariant [

	^ self newAlias: #Win32Variant
]

{ #category : #alias }
JinNSSDKLibraryBuilder >> winWideString [

	^ self newAlias: #Win32WideString 
]
