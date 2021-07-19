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

	^ (MD5 hashMessage: self sql) hex
]

{ #category : #accessing }
JinQuery >> exportToFolder: aFolder [
	(aFolder / self name , 'QUERY') writeStream
		nextPutAll: self sql;
		close
]

{ #category : #'as yet unclassified' }
JinQuery >> fields [
	^ self body fields 
]

{ #category : #accessing }
JinQuery >> privateLoadBodyObject [
	^ (project openQuery: self)
]

{ #category : #'as yet unclassified' }
JinQuery >> sql [
	^ self body sql 
]
