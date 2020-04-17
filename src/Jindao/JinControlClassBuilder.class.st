"
I do create a class each time that is needed. I create only one class and add all the methods and properties in it .
"
Class {
	#name : #JinControlClassBuilder,
	#superclass : #Object,
	#instVars : [
		'superclass',
		'name',
		'mapping'
	],
	#category : #'Jindao-Factories-Builders'
}

{ #category : #'as yet unclassified' }
JinControlClassBuilder >> addMethod: aMethod [
	(self buildingClassFor: aMethod )
		compile: (self codeForMethod: aMethod)
		classified: 'method - generated'
]

{ #category : #'as yet unclassified' }
JinControlClassBuilder >> addProperty: aCOMProperty [
	aCOMProperty getter
		ifNotNil: [ (self buildingClassFor: aCOMProperty)
				compile: (self getterCodeFor: aCOMProperty)
				classified: 'property - generated' ].
	aCOMProperty setter
		ifNotNil: [ (self buildingClassFor: aCOMProperty)
				compile: (self setterCodeFor: aCOMProperty)
				classified: 'property - generated' ]
]

{ #category : #'as yet unclassified' }
JinControlClassBuilder >> argumentNamesFor: aCollection [
	^ ' . '
		join: (aCollection collect: [ :a | self parameterNameFor: a ])
]

{ #category : #'as yet unclassified' }
JinControlClassBuilder >> build [
	self buildMappingMethod.
	self buildAcceptVisitorMethod.
	
	^ self class environment at: self buildingClassName asSymbol
]

{ #category : #'as yet unclassified' }
JinControlClassBuilder >> buildAcceptVisitorMethod [
	(self class environment at: self buildingClassName asSymbol) class
		compile: ('acceptVisitor: aVisitor
	^ aVisitor visit{1}' format: { name })
		classified: 'generated'.
]

{ #category : #'as yet unclassified' }
JinControlClassBuilder >> buildMappingMethod [
	(self class environment at: self buildingClassName asSymbol) class
		compile: ('mappedTypeName
	^#''{1}''' format: { mapping })
		classified: 'generated'.
]

{ #category : #'as yet unclassified' }
JinControlClassBuilder >> buildingClass [
	^ self class environment
		at: self buildingClassName
		ifAbsent: [ self superclass
				subclass: self buildingClassName asSymbol
				instanceVariableNames: ''
				classVariableNames: ''
				package: 'Jindao-DomainObjects-GeneratedControls' ]
]

{ #category : #'as yet unclassified' }
JinControlClassBuilder >> buildingClassFor: anElement [
	^ self buildingClass
]

{ #category : #'as yet unclassified' }
JinControlClassBuilder >> buildingClassName [
	^ name
]

{ #category : #'as yet unclassified' }
JinControlClassBuilder >> codeForMethod: aCOMMethod [ 
 ^ aCOMMethod  parameterNames ifEmpty: [ 
'{1}
<method>
	^ (handle dispatch: #''{2}'' ).
' format: {(self methodNameFor: aCOMMethod name). aCOMMethod name} 
	] ifNotEmpty: [  
'{1}
<method>
{4}
	^ (handle dispatch: #''{2}'' withArguments: \{{3}\} ).
' format: {
		(self propertyNameFor: aCOMMethod name withArguments: aCOMMethod  parameterNames ). 
		aCOMMethod name.
		(self argumentNamesFor: aCOMMethod  parameterNames ).
		self commentForOptionalParameters: aCOMMethod optionalParameters
} 
 ]
]

{ #category : #'as yet unclassified' }
JinControlClassBuilder >> commentForOptionalParameters: aCollection [
	^ aCollection
		ifEmpty: [ '' ]
		ifNotEmpty: [ '"This method can be called with optional parameters. '
				, (',' join: aCollection), '"' ]
]

{ #category : #'as yet unclassified' }
JinControlClassBuilder >> getterCodeFor: aCOMProperty [
	^ aCOMProperty getter parameterNames ifEmpty: [ 
'{1}
<getter>
	^ (handle propertyNamed: #''{2}'' ).
' format: {(self methodNameFor: aCOMProperty name). aCOMProperty name} 
	] ifNotEmpty: [  
'{1}
<getter>
{4}
	^ (handle propertyNamed: #''{2}'' withArguments: \{{3}\} ).
' format: {
		(self propertyNameFor: aCOMProperty name withArguments: aCOMProperty getter parameterNames ). 
		aCOMProperty name.
		(self argumentNamesFor:aCOMProperty getter parameterNames ).
		self commentForOptionalParameters: aCOMProperty getter optionalParameters
} 
 ]
]

{ #category : #'as yet unclassified' }
JinControlClassBuilder >> methodNameFor: aString [
	| string | 
	string := (aString copyReplaceAll:'*' with:'').
	^ string first lowercase asString , string allButFirst
]

{ #category : #'class name' }
JinControlClassBuilder >> name: aString [ 
	mapping := aString. 
	name := (superclass name , aString) copyReplaceAll: '_' with: ''
	
]

{ #category : #'as yet unclassified' }
JinControlClassBuilder >> parameterNameFor: aString [
	| string |
	string := aString copyReplaceAll: '*' with: 'Ptr'.
	^ aString first = $a
		ifTrue: [ aString ]
		ifFalse: [ 'a' , string first uppercase asString , string allButFirst ]
]

{ #category : #'as yet unclassified' }
JinControlClassBuilder >> propertyNameFor: aString withArguments: aCollection [
	| baseMethod |
	baseMethod := (self methodNameFor: aString) , ': '
		, (self parameterNameFor: aCollection first).
	^ aCollection size = 1
		ifTrue: [ baseMethod ]
		ifFalse: [ 
			String streamContents: [ : str | 
				str nextPutAll: baseMethod.
			aCollection allButFirst
				do: [ :t | 
					str nextPutAll:' ';
						nextPutAll: (self methodNameFor: t);
						nextPutAll: ': ';
						nextPutAll: (self parameterNameFor: t)]. 
			 ]]
]

{ #category : #'as yet unclassified' }
JinControlClassBuilder >> setterCodeFor: aCOMProperty [ 
^ (aCOMProperty setter parameterNames size - aCOMProperty setter optionalParameters size  =1 ) ifTrue: [
'{1}: {2}
<setter>
		{4}
	^ (handle propertyNamed: #''{3}'' withArguments: \{{2}\} ).
'
		format:
			{self methodNameFor: aCOMProperty name .
			self parameterNameFor: aCOMProperty setter parameterNames first.  
			aCOMProperty name . 
			self commentForOptionalParameters: aCOMProperty setter optionalParameters
			}] ifFalse:[ 
			
'{1}
<setter>
	{4}
	^ (handle propertyNamed: #''{2}'' withArguments: \{{3}\} ).
' format: {
		(self propertyNameFor: aCOMProperty name withArguments: aCOMProperty setter parameterNames ). 
		aCOMProperty name.
		(self argumentNamesFor: aCOMProperty setter parameterNames).
		self commentForOptionalParameters: aCOMProperty setter optionalParameters
} 		
	]
]

{ #category : #accessing }
JinControlClassBuilder >> superclass [
	^ superclass 
]

{ #category : #'as yet unclassified' }
JinControlClassBuilder >> superclass: aClass [ 
	superclass := aClass
	
]
