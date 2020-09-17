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
		  | directories |
		  directories := (path / #components) directories.
		  components := directories
			                select: [ :d | 
				                d entries anySatisfy: [ :e | 
					                e basename endsWith: 'component.ts' ] ]
			                thenCollect: [ :d | 
				                | file |
				                file := (d entries detect: [ :e | 
					                         e basename endsWith: 'component.ts' ])
					                        asFileReference.
				                JinAngularComponent new
					                name:
						                (file basename
							                 copyReplaceAll: '.component.ts'
							                 with: '');
					                path: file parent;
					                yourself ] ]
]
