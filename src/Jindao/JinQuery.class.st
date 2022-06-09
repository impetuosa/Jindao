"
I represent a query 
"
Class {
	#name : #JinQuery,
	#superclass : #JinModelObject,
	#category : #'Jindao-Core'
}

{ #category : #accessing }
JinQuery class >> typeNumber [
	^ 1
]

{ #category : #'as yet unclassified' }
JinQuery >> acceptVisitor: aVisitor [
	^ aVisitor visitQuery: self 
]

{ #category : #accessing }
JinQuery >> children [

	^ self fields
]

{ #category : #'as yet unclassified' }
JinQuery >> contentHash [

	| sql |
	[ sql := self sql ]
		on: Error
		do: [ :e | sql := self name ].
	^ (MD5 hashMessage: sql) hex
]

{ #category : #accessing }
JinQuery >> exportToFolder: aFolder [
	(aFolder / self name , 'QUERY') writeStream
		nextPutAll: self sql;
		close
]

{ #category : #'as yet unclassified' }
JinQuery >> fields [
	 [ ^ self body fields ] on: Error do: [ :e | ^ {  } ]
]

{ #category : #accessing }
JinQuery >> isQuery [ 
	 ^ true
]

{ #category : #'as yet unclassified' }
JinQuery >> isReferredBySymbol: aJinNSNameEntry [

	^ aJinNSNameEntry kind isQuery and: [ 
		  aJinNSNameEntry referersTo: self name ]
]

{ #category : #accessing }
JinQuery >> privateLoadBodyObject [
	^ (project openQuery: self)
]

{ #category : #'as yet unclassified' }
JinQuery >> sql [

	^ [ self body sql ]
		  on: Win32Error
		  do: [ :e | 

			  ^ '' ]
]
