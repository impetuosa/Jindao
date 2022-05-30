Class {
	#name : #JinNSVisitorCounter,
	#superclass : #Object,
	#instVars : [
		'count'
	],
	#category : #'Jindao-NamespaceIndex'
}

{ #category : #accessing }
JinNSVisitorCounter >> count [

	^ count
]

{ #category : #accessing }
JinNSVisitorCounter >> count: aJinNSNamespace [ 	
	count := 0. 
	
	aJinNSNamespace acceptVisitor: self 
]

{ #category : #visiting }
JinNSVisitorCounter >> visitNameEntry: aJinNSNameEntry [ 
	 count := count + 1.
]

{ #category : #visiting }
JinNSVisitorCounter >> visitNamespace: aJinNSNamespace [

	aJinNSNamespace readEntries do: [ :e | e acceptVisitor: self ]
]

{ #category : #visiting }
JinNSVisitorCounter >> visitSubNamespace: aJinNSSubNamespace [

	self visitNameEntry: aJinNSSubNamespace.
	self visitNamespace: aJinNSSubNamespace
]
