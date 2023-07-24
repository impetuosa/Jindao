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
	<doc: 'Closes this first class citizen'>
	project close: self.
	body := nil
]

{ #category : #'as yet unclassified' }
JinModelObject >> closeAndSave [

	<doc: 'Closes and save this first class citizen'>
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

	<doc: 'export as text into a given folder '>
	^ project export: self toFolder: aFolder
]

{ #category : #testing }
JinModelObject >> isAccessForm [

	^ false
]

{ #category : #'as yet unclassified' }
JinModelObject >> isAccessProject [
	 ^ false 
]

{ #category : #testing }
JinModelObject >> isControl [

	^ false
]

{ #category : #testing }
JinModelObject >> isLibrary [
	^ false
]

{ #category : #accessing }
JinModelObject >> isLoaded [
	^ body isNotNil and: [ description isLoaded ]
]

{ #category : #testing }
JinModelObject >> isModelObject [

	^ true
]

{ #category : #accessing }
JinModelObject >> isModule [

	^ false
]

{ #category : #testing }
JinModelObject >> isQuery [ 
	^ false
]

{ #category : #testing }
JinModelObject >> isRelation [ 
	^ false 
]

{ #category : #accessing }
JinModelObject >> isRootElement [

	^ false
]

{ #category : #testing }
JinModelObject >> isTable [

	^ false
]

{ #category : #accessing }
JinModelObject >> load [

	<doc:
	'Opens the first class citizen object in edition mode in the context of the Microsoft Access environment. '>
	self isLoaded ifFalse: [ body := self privateLoadBodyObject ]
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

	<doc: 'Saves any modification of a firstclass citizen '>
	project save: self
]

{ #category : #'as yet unclassified' }
JinModelObject >> typeNumber [
	^ self class typeNumber
]
