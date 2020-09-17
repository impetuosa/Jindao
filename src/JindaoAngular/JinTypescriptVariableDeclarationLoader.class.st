Class {
	#name : #JinTypescriptVariableDeclarationLoader,
	#superclass : #JinTypescriptAbstractLoader,
	#category : #JindaoAngular
}

{ #category : #generated }
JinTypescriptVariableDeclarationLoader >> visitTypeName: aTypeName [  
	self assert: aTypeName names size = 1 .
	 result type: (JinTypescriptTypeReference new name: aTypeName names first name  value   )
]

{ #category : #generated }
JinTypescriptVariableDeclarationLoader >> visitVariableDeclaration: aVariableDeclaration [

	result := JinVariable new.
	result name: aVariableDeclaration variable name value.
	super visitVariableDeclaration: aVariableDeclaration
]
