Class {
	#name : #JinTypescriptMethodLoader,
	#superclass : #JinTypescriptAbstractLoader,
	#category : #JindaoAngular
}

{ #category : #generated }
JinTypescriptMethodLoader >> visitMemberFunctionDeclaration: aMethodDefinition [

	result := JinTypescriptMethod new.
	result selector: aMethodDefinition name name value.
	self acceptNodes: aMethodDefinition signature parameters.
	result type:
		(JinTypescriptTypeLoader load: aMethodDefinition signature type file: file ).
	self assert: (aMethodDefinition statements noneSatisfy: [ :n | 
			 n isKindOf: JSAssignmentExpressionNode ])
]

{ #category : #generated }
JinTypescriptMethodLoader >> visitMethodDefinition: aMethodDefinition [

	result := JinTypescriptMethod new.
	result selector: aMethodDefinition name name value.
	self acceptNodes: aMethodDefinition parameters .

	self assert: aMethodDefinition type isNil.
	 
	self assert: (aMethodDefinition statements noneSatisfy: [ : n | n isKindOf: JSAssignmentExpressionNode ])
]

{ #category : #generated }
JinTypescriptMethodLoader >> visitVariableDeclaration: aVarDeclaration [

	| param |
	param := JinTypescriptVariableDeclarationLoader load: aVarDeclaration file: file .
	result addParameter: param
]
