Class {
	#name : #JinDAMVBVisitorToReferenceName,
	#superclass : #Object,
	#instVars : [
		'processedElement',
		'importer'
	],
	#classInstVars : [
		'noneAttribute'
	],
	#category : #'JinDAM-Importer-Helpers'
}

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToReferenceName class >> noneAttribute [
	^ noneAttribute ifNil: [ noneAttribute := AlcixVariableReference new ]
]

{ #category : #accce }
JinDAMVBVisitorToReferenceName >> importer: anAlceLibraryReferenceImporter [ 
	importer := anAlceLibraryReferenceImporter
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToReferenceName >> noneAttribute [
	^ self class noneAttribute 
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToReferenceName >> noteProcessedElement [
	processedElement := true .
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToReferenceName >> toTypeReferenceName: aNode context: context [

	| refChain |
	processedElement := false.
	refChain := aNode acceptVisitor: self.
	processedElement ifTrue: [ 
		self halt: 'Type that comes out of process? ' ].
	refChain ifNil: [ 
		^ self error: 'Unexpected ' "self undefinedTypeReference " ].

	"  Lets consider an attribute A typed DAO.Recordset2. 
		DAO's context is the attribute A. 
		Recordset2 context is DAO keyword context.
		Now the type of the attribute A is Recordset2. 
	"
	^ refChain
		  ifEmpty: [ self undefinedTypeReferenceContext: context ]
		  ifNotEmpty: [ 
			  importer
				  instantiateReferenceForNames: refChain
				  context: context
				  preferring: { #isType. #isAssembly } ]
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToReferenceName >> undefinedTypeReferenceContext: aContext [


	^ JinDAMTypeReference new
		  typeName: '#_TypeUndefined';
		  context: aContext;
		  yourself
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToReferenceName >> visitArithmeticOperation: aVBArithmeticOperationNode [
	^ nil
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToReferenceName >> visitAsTypeAndNew: aVBAsTypeAndNewNode [ 
	^ aVBAsTypeAndNewNode type acceptVisitor: self 
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToReferenceName >> visitBaseType: aVBBaseTypeNode [
	aVBBaseTypeNode variantToken ifNil: [ self error: ' ' ].
	^ aVBBaseTypeNode variantToken acceptVisitor: self
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToReferenceName >> visitBooleanLiteral: aVBBooleanLiteralNode [
	^ nil
]

{ #category : #visiting }
JinDAMVBVisitorToReferenceName >> visitColorLiteral: aVBColorLiteralNode [ 
	^ nil
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToReferenceName >> visitComparisonOperation: aVBComparisonOperationNode [
	^ nil
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToReferenceName >> visitComplexType: aVBComplexTypeNode [
	^ (aVBComplexTypeNode base acceptVisitor: self)
		,
			(aVBComplexTypeNode members
				flatCollect: [ :m | m acceptVisitor: self ])
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToReferenceName >> visitConcatenationOperation: aVBConcatenationOperationNode [ 
	^ nil
]

{ #category : #visiting }
JinDAMVBVisitorToReferenceName >> visitDateLiteral: aVBDateLiteralNode [

	^ nil
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToReferenceName >> visitDictionaryAccess: aVBDictionaryAccessNode [
	^ self visitMemberAccess: aVBDictionaryAccessNode
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToReferenceName >> visitEquals: aVBEqualsNode [ 
	^ nil
]

{ #category : #visiting }
JinDAMVBVisitorToReferenceName >> visitFloatLiteral: aVBFloatLiteralNode [ 
	^ nil
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToReferenceName >> visitIntegerLiteral: aVBIntegerLiteralNode [ 
	^ nil
]

{ #category : #visiting }
JinDAMVBVisitorToReferenceName >> visitLibraryMethod: aJinLibraryMethod [

	^ { aJinLibraryMethod returnTypeName }
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToReferenceName >> visitMemberAccess: aVBMemberAccessNode [
	| receiver |
	receiver := aVBMemberAccessNode receiver
		ifNil: [ aVBMemberAccessNode enclosingWith with acceptVisitor: self ]
		ifNotNil: [ aVBMemberAccessNode receiver acceptVisitor: self ].
	^ (receiver ifNil: [ {} ])
		, (aVBMemberAccessNode member acceptVisitor: self)
]

{ #category : #visiting }
JinDAMVBVisitorToReferenceName >> visitNegatedOperation: aVBNegatedOperationNode [

	self noteProcessedElement.
	^ aVBNegatedOperationNode value acceptVisitor: self
]

{ #category : #visiting }
JinDAMVBVisitorToReferenceName >> visitNewClause: aVBNewClauseNode [

	^ aVBNewClauseNode typeName acceptVisitor: self
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToReferenceName >> visitNotOperation: aVBNotOperationNode [
	self noteProcessedElement.
	^ aVBNotOperationNode value acceptVisitor: self
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToReferenceName >> visitNull: aVBNullNode [
	^ {#Nothing}
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToReferenceName >> visitParentheseesExpression: aVBParentheseesExpressionNode [ 
	^ aVBParentheseesExpressionNode expression acceptVisitor: self 
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToReferenceName >> visitProcedureCallOrArrayAccess: aVBProcedureCallOrArrayAccessNode [
	self noteProcessedElement.
	aVBProcedureCallOrArrayAccessNode arguments arguments size = 1
		ifTrue: [ aVBProcedureCallOrArrayAccessNode arguments arguments first value
				acceptVisitor: self ].
	^ nil
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToReferenceName >> visitSimpleIdentifier: aVBSimpleIdentifierNode [
	^ {aVBSimpleIdentifierNode token value}
]

{ #category : #visiting }
JinDAMVBVisitorToReferenceName >> visitSimpleType: aVBSimpleTypeNode [

	^ aVBSimpleTypeNode typeName acceptVisitor: self
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToReferenceName >> visitSmaccToken: aSmaCCCaseInsensitiveToken [
	^ {aSmaCCCaseInsensitiveToken value asSymbol}
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToReferenceName >> visitSquareBracketIdentifier: aVBSquareBracketIdentifierNode [
	| str |
	"Square brackets identifiers are used in vb for using whitespaces in a name. In our context we dont care about the first nor the last symbol  "
	str := aVBSquareBracketIdentifierNode token value.
	^ {(str copyFrom: 2 to: str size - 1)}
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToReferenceName >> visitStringLiteral: aVBStringLiteralNode [ 
	^ nil
]

{ #category : #visiting }
JinDAMVBVisitorToReferenceName >> visitTypeOf: aVBTypeOfNode [ 

	^ nil.
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToReferenceName >> visitTypeSize: aVBTypeSizeNode [

	((aVBTypeSizeNode parent respondsTo: #paramarrayToken) and: [ 
		 aVBTypeSizeNode parent paramarrayToken isNotNil ]) ifTrue: [ 
		^ { 'ParamArray' } ].
	aVBTypeSizeNode sizes ifEmpty: [ ^ { 'EmptyArray' } ].
	self error: 'Should do something else.'
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToReferenceName >> visitTypedThing: aVBTypedThingNode [

	aVBTypedThingNode type ifNil: [ ^ {  } ].
	^ ((aVBTypedThingNode type acceptVisitor: self) ifNil: [ {  } ]) 
		  collect: [ :a | 
			  a isArray
				  ifTrue: [ a ]
				  ifFalse: [ 
					  { 
						  a.
						  #member } ] ]
]
