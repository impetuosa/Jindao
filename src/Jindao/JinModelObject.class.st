"
I represent a first citizen element. 
I have the feature of being loadable, i put together many faces of the same concept (ex JinForm+JinFormBody+JinVBeForm)
"
Class {
	#name : #JinModelObject,
	#superclass : #Object,
	#instVars : [
		'description',
		'body',
		'project'
	],
	#category : #'Jindao-Core'
}

{ #category : #accessing }
JinModelObject class >> typeNumber [
	self subclassResponsibility
]

{ #category : #accessing }
JinModelObject >> body [
	^ body
		ifNil: [ self load.
			body ]
]

{ #category : #'as yet unclassified' }
JinModelObject >> body: aCOMDispatchInstance [ 
	body := aCOMDispatchInstance
]

{ #category : #'as yet unclassified' }
JinModelObject >> close [
	project close: self.
	body := nil
]

{ #category : #'as yet unclassified' }
JinModelObject >> closeAndSave [
	project close: self save: true.
	body := nil
]

{ #category : #'as yet unclassified' }
JinModelObject >> collect: aBlock [

	^ {  }
]

{ #category : #accessing }
JinModelObject >> description: aDescription [
	description := aDescription
]

{ #category : #'as yet unclassified' }
JinModelObject >> ensureUnload [
	project close: self.
	body := nil.
]

{ #category : #'as yet unclassified' }
JinModelObject >> exportToFolder: aFolder [
	^ project export: self toFolder: aFolder
]

{ #category : #'as yet unclassified' }
JinModelObject >> isControl [

	^ false
]

{ #category : #accessing }
JinModelObject >> isLoaded [
	^ body isNotNil and: [ description isLoaded ]
]

{ #category : #accessing }
JinModelObject >> load [
	self isLoaded
		ifFalse: [ body := self privateLoadBodyObject ]
]

{ #category : #'as yet unclassified' }
JinModelObject >> name [
	^ description name 
]

{ #category : #'as yet unclassified' }
JinModelObject >> nameWithoutSpaces [
	^ ((self name copyReplaceAll: ' ' with: '')
		copyReplaceAll: '/'
		with: '') copyReplaceAll: '-' with: '_'
]

{ #category : #accessing }
JinModelObject >> printOn: aStream [
	aStream nextPutAll: self class name ; nextPut:$[ ; nextPutAll: self name ; nextPut: $]
]

{ #category : #accessing }
JinModelObject >> privateLoadBodyObject [
	self subclassResponsibility
]

{ #category : #accessing }
JinModelObject >> project: aJinAccessProject [ 
	project := aJinAccessProject
]

{ #category : #'as yet unclassified' }
JinModelObject >> rename: aName [
	project rename: self with: aName.
	description  := project descritionFor: aName
]

{ #category : #accessing }
JinModelObject >> save [
	project save: self
]

{ #category : #'as yet unclassified' }
JinModelObject >> typeGuid [
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
JinModelObject >> typeNumber [
	^ self class typeNumber
]
