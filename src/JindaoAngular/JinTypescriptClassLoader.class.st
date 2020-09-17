Class {
	#name : #JinTypescriptClassLoader,
	#superclass : #JinTypescriptAbstractLoader,
	#instVars : [
		'decorator'
	],
	#category : #JindaoAngular
}

{ #category : #'as yet unclassified' }
JinTypescriptClassLoader class >> loadClassFromFile: aFile [

	| loader |
	loader := self new.
	loader file: aFile. 
	(TypeScriptParser parseFile: aFile) acceptVisitor: loader.
	^ loader result
]

{ #category : #'as yet unclassified' }
JinTypescriptClassLoader class >> loadClassFromStream: aStream [

	| loader |
	loader := self new.

	(TypeScriptParser parseStream: aStream) acceptVisitor: loader.
	^ loader result
]

{ #category : #generated }
JinTypescriptClassLoader >> visitClassExpression: aClassExpression [

	result := JinTypescriptClass new.
	result name: aClassExpression name name value.
	result implements: (aClassExpression types collect: [ :t | 
			 JinTypescriptTypeLoader load: t file: file ]).
	result decorator: decorator. 
	self acceptNodes: aClassExpression elements.
	
]

{ #category : #generated }
JinTypescriptClassLoader >> visitDecoratorExpression: aDecoratorExpression [

	decorator := JinTypescriptDecoratorLoader load: aDecoratorExpression file: file. 
]

{ #category : #generated }
JinTypescriptClassLoader >> visitMemberFunctionDeclaration: aMethodDefinition [
	result addMethod: (JinTypescriptMethodLoader load: aMethodDefinition file: file )
]

{ #category : #generated }
JinTypescriptClassLoader >> visitMethodDefinition: aMethodDefinition [

	result addMethod: (JinTypescriptMethodLoader load: aMethodDefinition file: file )
]

{ #category : #generated }
JinTypescriptClassLoader >> visitPropertyAssignment: aDecoratorExpression [
	self halt .
]
