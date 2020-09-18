Class {
	#name : #JinTypescriptDecoratorLoader,
	#superclass : #JinTypescriptAbstractLoader,
	#instVars : [
		'decorator',
		'currentProperty'
	],
	#category : #JindaoAngular
}

{ #category : #visiting }
JinTypescriptDecoratorLoader >> visitArrayLiteral: aLiteral [
	self visitLiteral: aLiteral 
]

{ #category : #visiting }
JinTypescriptDecoratorLoader >> visitCallExpression: aCallExpression [

	result name: aCallExpression expression name value.
	aCallExpression arguments do: [ :a | a acceptVisitor: self ]
]

{ #category : #visiting }
JinTypescriptDecoratorLoader >> visitDecoratorExpression: aDecoratorExpression [
	result := JinTypescriptDecorator new. 
	aDecoratorExpression decorator acceptVisitor: self. 

]

{ #category : #visiting }
JinTypescriptDecoratorLoader >> visitLiteral: aLiteral [
	self assert: currentProperty value = aLiteral.
	currentProperty value: aLiteral value value 
]

{ #category : #visiting }
JinTypescriptDecoratorLoader >> visitPropertyAssignment: aPropertyDefinition [

	result attributes
		at: aPropertyDefinition name name value
		put: aPropertyDefinition value.
	currentProperty := result attributes associationAt:
		                   aPropertyDefinition name name value.
	aPropertyDefinition value acceptVisitor: self.
	currentProperty := nil.
]
