Class {
	#name : #JinTypescriptTypeLoader,
	#superclass : #JinTypescriptAbstractLoader,
	#category : #JindaoAngular
}

{ #category : #generated }
JinTypescriptTypeLoader >> visitNameExpression: aName [
	result name: aName name value 
]

{ #category : #generated }
JinTypescriptTypeLoader >> visitTypeReference: aReference [ 
	result := JinTypescriptTypeReference new. 
	super visitTypeReference: aReference 
]

{ #category : #generated }
JinTypescriptTypeLoader >> visitVoidType: aType [
	result := JinTypescriptTypeReference new. 
	result name: #void
]
