Class {
	#name : #JinAngularProject,
	#superclass : #JinAngularContainer,
	#instVars : [
		'projectType',
		'anchoredToUrlSegment',
		'name',
		'modules'
	],
	#category : #JindaoAngular
}

{ #category : #visiting }
JinAngularProject >> acceptVisitor: aJinInspectorBuilder [ 
	aJinInspectorBuilder visitAngularProject: self 
]

{ #category : #'as yet unclassified' }
JinAngularProject >> anchoredToUrlSegment: aString [

	anchoredToUrlSegment := aString
]

{ #category : #testing }
JinAngularProject >> isWellKnownNotDirectory: aFileReference [

	^ { #environments. #assets   } includes: aFileReference basename
]

{ #category : #'brick-modules' }
JinAngularProject >> modules [

	^ modules ifNil: [ 
		  | directories |
		
		  directories := path directories reject: [ :d | 
			                 self isWellKnownNotDirectory: d ].
	
		  [ modules isEmptyOrNil and: [ directories isNotEmpty ] ] whileTrue: [
		  		modules := (directories flatCollect: #entries)
			             select: [ :e | e basename endsWith: 'module.ts' ]
			             thenCollect: [ :f | 
				             JinAngularModule new
					             path: f asFileReference parent;
					             name:
						             (f basename copyReplaceAll: '.module.ts' with: '') ].
				directories := (directories flatCollect:[ :e  | e directories collect:#asFileReference  ]).
			].
			modules ifNil: [modules := Array empty ]. 
		 ]. 
]

{ #category : #accessing }
JinAngularProject >> name [

	^ name
]

{ #category : #accessing }
JinAngularProject >> name: aString [ 
	name := aString
]

{ #category : #accessing }
JinAngularProject >> path: aPath [
	path := aPath 
]

{ #category : #accessing }
JinAngularProject >> privateGetEntities [

	^ JinFileCollection new on: self sourceFolder
]

{ #category : #'as yet unclassified' }
JinAngularProject >> projectType: aString [

	projectType := aString
]
