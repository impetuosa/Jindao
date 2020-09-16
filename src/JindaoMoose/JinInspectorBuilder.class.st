Class {
	#name : #JinInspectorBuilder,
	#superclass : #Object,
	#instVars : [
		'inspector',
		'owner'
	],
	#category : #JindaoMoose
}

{ #category : #'as yet unclassified' }
JinInspectorBuilder >> inspectorFor: anObject into: anOwner [
	owner := anOwner. 
	anObject acceptVisitor: self.
	^ inspector 
]

{ #category : #'as yet unclassified' }
JinInspectorBuilder >> visitForm: aForm [

	inspector := owner newTreeTable.
	inspector
		addColumn: (SpStringTableColumn title: 'Name' evaluated: [ : s | [s name ] on: Error do: [ :e | e messageText ]]);
		addColumn: (SpStringTableColumn title: 'Value' evaluated: [ :s | 
					 (s isKindOf: JinAccessFastProperty)
						 ifTrue: [ s safeValue ]
						 ifFalse: [ '' ] ]);
		children: [ :node | 
			(node isKindOf: JinAccessFastProperty)
				ifTrue: [  {  } ]
				ifFalse: [ [node children] on: Error do: [ :e | { e } ]  ] ];
		roots: { aForm }
]

{ #category : #'as yet unclassified' }
JinInspectorBuilder >> visitReport: aReport [

	self visitForm: aReport
]
