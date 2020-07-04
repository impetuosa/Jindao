Class {
	#name : #FuQueryValidator,
	#superclass : #AEPQueryVisitor,
	#instVars : [
		'owner',
		'query',
		'projectQuery'
	],
	#category : #'Jindao-AEPValidity'
}

{ #category : #visiting }
FuQueryValidator >> visitEntity: anAEPEntity [
	self visitCollection: anAEPEntity properties.
	self visitCollection: anAEPEntity children.
]

{ #category : #visiting }
FuQueryValidator >> visitQuery: anAEPEntity [
	query := anAEPEntity.
	projectQuery := (owner applicationFor: anAEPEntity) queries
		detect: [ :o | o name = anAEPEntity name ].
	super visitQuery: anAEPEntity
]
