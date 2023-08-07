"
I create reference name arrays.
If the element is not a name reference, I return nil. 

For example for an expression such as 
a.b
it returns 
{#a . #b}

"
Class {
	#name : #JinDAMVBVisitorToTaggedReferenceName,
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
JinDAMVBVisitorToTaggedReferenceName class >> noneAttribute [
	^ noneAttribute ifNil: [ noneAttribute := AlcixVariableReference new ]
]

{ #category : #accce }
JinDAMVBVisitorToTaggedReferenceName >> importer: anAlceLibraryReferenceImporter [ 
	importer := anAlceLibraryReferenceImporter
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToTaggedReferenceName >> noneAttribute [
	^ self class noneAttribute 
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToTaggedReferenceName >> noteProcessedElement [
	processedElement := true .
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToTaggedReferenceName >> toTypeReferenceName: aNode context: context [

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


	^ importer
		  instantiateReferenceForNames: refChain
		  context: context
		  preferring: { #isType. #isAssembly }
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToTaggedReferenceName >> undefinedTypeReferenceContext: aContext [

	^ JinDAMTypeReference new
		  beUndefinedType;
		  context: aContext;
		  yourself
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToTaggedReferenceName >> visitArithmeticOperation: aVBArithmeticOperationNode [
	^ nil
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToTaggedReferenceName >> visitAsTypeAndNew: aVBAsTypeAndNewNode [ 
	^ aVBAsTypeAndNewNode type acceptVisitor: self 
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToTaggedReferenceName >> visitBaseType: aVBBaseTypeNode [
	aVBBaseTypeNode variantToken ifNil: [ self error: ' ' ].
	^ aVBBaseTypeNode variantToken acceptVisitor: self
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToTaggedReferenceName >> visitBooleanLiteral: aVBBooleanLiteralNode [
	^ nil
]

{ #category : #visiting }
JinDAMVBVisitorToTaggedReferenceName >> visitColorLiteral: aVBColorLiteralNode [ 
	^ nil
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToTaggedReferenceName >> visitComparisonOperation: aVBComparisonOperationNode [
	^ nil
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToTaggedReferenceName >> visitComplexType: aVBComplexTypeNode [
	^ (aVBComplexTypeNode base acceptVisitor: self)
		,
			(aVBComplexTypeNode members
				flatCollect: [ :m | m acceptVisitor: self ])
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToTaggedReferenceName >> visitConcatenationOperation: aVBConcatenationOperationNode [ 
	^ nil
]

{ #category : #visiting }
JinDAMVBVisitorToTaggedReferenceName >> visitDateLiteral: aVBDateLiteralNode [

	^ nil
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToTaggedReferenceName >> visitDictionaryAccess: aVBDictionaryAccessNode [
| receiver |
	receiver := aVBDictionaryAccessNode receiver
		ifNil: [ aVBDictionaryAccessNode enclosingWith with acceptVisitor: self ]
		ifNotNil: [ aVBDictionaryAccessNode receiver acceptVisitor: self ].
		
 
	^ ((receiver ifNil: [ {} ])  collect: [ :a | a isArray ifTrue: [ a ] ifFalse: [ { a . #dictionary } ]  ])
		, ((aVBDictionaryAccessNode member acceptVisitor: self) collect: [ : i | {  i. #dictionary } ])
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToTaggedReferenceName >> visitEquals: aVBEqualsNode [ 
	^ nil
]

{ #category : #visiting }
JinDAMVBVisitorToTaggedReferenceName >> visitFloatLiteral: aVBFloatLiteralNode [ 
	^ nil
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToTaggedReferenceName >> visitIntegerLiteral: aVBIntegerLiteralNode [ 
	^ nil
]

{ #category : #visiting }
JinDAMVBVisitorToTaggedReferenceName >> visitLibraryMethod: aJinLibraryMethod [

	^ { aJinLibraryMethod returnTypeName }
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToTaggedReferenceName >> visitMemberAccess: aVBMemberAccessNode [

	| receiver |
	receiver := aVBMemberAccessNode receiver
		            ifNil: [ 
			            [ 
			            aVBMemberAccessNode enclosingWith with acceptVisitor:
				            self ]
				            on: Error
				            do: [ :e | 
					            importer problematicForms add: importer state top.
					            nil ] ]
		            ifNotNil: [ 
		            aVBMemberAccessNode receiver acceptVisitor: self ].


	^ ((receiver ifNil: [ {  } ]) collect: [ :a | 
		   a isArray
			   ifTrue: [ a ]
			   ifFalse: [ 
				   { 
					   a.
					   #member } ] ])
	  ,
		  ((aVBMemberAccessNode member acceptVisitor: self) collect: [ :i | 
			   { 
				   i.
				   #member } ])
]

{ #category : #visiting }
JinDAMVBVisitorToTaggedReferenceName >> visitNegatedOperation: aVBNegatedOperationNode [

	self noteProcessedElement.
	^ aVBNegatedOperationNode value acceptVisitor: self
]

{ #category : #visiting }
JinDAMVBVisitorToTaggedReferenceName >> visitNewClause: aVBNewClauseNode [

	^ aVBNewClauseNode typeName acceptVisitor: self
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToTaggedReferenceName >> visitNotOperation: aVBNotOperationNode [
	self noteProcessedElement.
	^ aVBNotOperationNode value acceptVisitor: self
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToTaggedReferenceName >> visitNull: aVBNullNode [
	^ {#Nothing}
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToTaggedReferenceName >> visitParentheseesExpression: aVBParentheseesExpressionNode [ 
	^ aVBParentheseesExpressionNode expression acceptVisitor: self 
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToTaggedReferenceName >> visitProcedureCallOrArrayAccess: aVBProcedureCallOrArrayAccessNode [
	self noteProcessedElement.
	aVBProcedureCallOrArrayAccessNode arguments arguments size = 1
		ifTrue: [ aVBProcedureCallOrArrayAccessNode arguments arguments first value
				acceptVisitor: self ].
	^ nil
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToTaggedReferenceName >> visitSimpleIdentifier: aVBSimpleIdentifierNode [
	^ {aVBSimpleIdentifierNode token value}
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToTaggedReferenceName >> visitSmaccToken: aSmaCCCaseInsensitiveToken [
	^ {aSmaCCCaseInsensitiveToken value asSymbol}
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToTaggedReferenceName >> visitSquareBracketIdentifier: aVBSquareBracketIdentifierNode [
	| str |
	"Square brackets identifiers are used in vb for using whitespaces in a name. In our context we dont care about the first nor the last symbol  "
	str := aVBSquareBracketIdentifierNode token value.
	^ {(str copyFrom: 2 to: str size - 1)}
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToTaggedReferenceName >> visitStringLiteral: aVBStringLiteralNode [ 
	^ nil
]

{ #category : #visiting }
JinDAMVBVisitorToTaggedReferenceName >> visitTypeOf: aVBTypeOfNode [ 

	^ nil.
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToTaggedReferenceName >> visitTypeSize: aVBTypeSizeNode [

	((aVBTypeSizeNode parent respondsTo: #paramarrayToken) and: [ 
		 aVBTypeSizeNode parent paramarrayToken isNotNil ]) ifTrue: [ 
		^ { 'ParamArray' } ].
	aVBTypeSizeNode sizes ifEmpty: [ ^ 'EmptyArray' ].
	self error: 'Should do something else.'
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToTaggedReferenceName >> visitTypedThing: aVBTypedThingNode [
	^ aVBTypedThingNode type acceptVisitor: self
]
