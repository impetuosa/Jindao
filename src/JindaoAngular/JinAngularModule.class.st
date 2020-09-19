Class {
	#name : #JinAngularModule,
	#superclass : #JinAngularProject,
	#instVars : [
		'components'
	],
	#category : #JindaoAngular
}

{ #category : #accessing }
JinAngularModule >> acceptVisitor: aJinInspectorBuilder [ 
	aJinInspectorBuilder visitAngularModule: self 
]

{ #category : #accessing }
JinAngularModule >> components [

	^ components ifNil: [ 
		  components := path files
			                select: [ :e | e basename endsWith: 'component.ts' ]
			                thenCollect: [ :f | 
				                | ref |
				                ref := f asFileReference.
				                JinAngularComponent new
					                name:
						                (ref basename
							                 copyReplaceAll: '.component.ts'
							                 with: '');
					                path: ref parent;
					                yourself ].

		  components := components asOrderedCollection ]
]

{ #category : #accessing }
JinAngularModule >> path [
	^ path 
]
