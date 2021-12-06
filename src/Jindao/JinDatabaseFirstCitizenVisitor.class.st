Class {
	#name : #JinDatabaseFirstCitizenVisitor,
	#superclass : #JinSubvisitor,
	#category : #'Jindao-Subvisitor'
}

{ #category : #accessing }
JinDatabaseFirstCitizenVisitor >> database [
	^ self
]

{ #category : #accessing }
JinDatabaseFirstCitizenVisitor >> visitIndex: aJinIndexBody [
	
]

{ #category : #accessing }
JinDatabaseFirstCitizenVisitor >> visitQuery: aJinQuery [ 
	" Not yer something to do "
]

{ #category : #accessing }
JinDatabaseFirstCitizenVisitor >> visitTable: aJinTable [
	self visitCollection: aJinTable indexes.

]

{ #category : #accessing }
JinDatabaseFirstCitizenVisitor >> visitTableRelation: aJinTableRelation [
]
