Class {
	#name : #JinDAMVBVisitorToString,
	#superclass : #Object,
	#category : #'JinDAM-Importer-Helpers'
}

{ #category : #'instance creation' }
JinDAMVBVisitorToString >> toString: aNode [
	^ aNode acceptVisitor: self
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToString >> visitArgument: aVBArgumentNode [
	^ aVBArgumentNode source
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToString >> visitArgumentList: aVBArgumentListNode [
	^ ','
		join: (aVBArgumentListNode arguments collect: [ :a | a acceptVisitor: self ])
]

{ #category : #visiting }
JinDAMVBVisitorToString >> visitArithmeticOperation: aVBArithmeticOperationNode [

	^ aVBArithmeticOperationNode source
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToString >> visitBaseType: aVBBaseTypeNode [
	^ aVBBaseTypeNode variantToken acceptVisitor: self
]

{ #category : #visiting }
JinDAMVBVisitorToString >> visitBooleanLiteral: aVBBooleanLiteralNode [ 
	^ aVBBooleanLiteralNode token acceptVisitor: self 
]

{ #category : #visiting }
JinDAMVBVisitorToString >> visitColorLiteral: aVBColorLiteralNode [ 
	^ aVBColorLiteralNode token acceptVisitor: self 
]

{ #category : #visiting }
JinDAMVBVisitorToString >> visitComparisonOperation: aVBComparisonOperationNode [ 
	^ aVBComparisonOperationNode source 
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToString >> visitComplexType: aVBComplexTypeNode [
	| str |
	str := aVBComplexTypeNode base acceptVisitor: self.
	^ aVBComplexTypeNode members
		inject: str
		into: [ :acc :each | acc , (each acceptVisitor: self) ]
]

{ #category : #visiting }
JinDAMVBVisitorToString >> visitConcatenationOperation: aVBConcatenationOperationNode [ 
	^ ''
]

{ #category : #visiting }
JinDAMVBVisitorToString >> visitDateLiteral: aVBDateLiteralNode [

	^ aVBDateLiteralNode token acceptVisitor: self
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToString >> visitDictionaryAccess: aVBDictionaryAccessNode [ 
	^ aVBDictionaryAccessNode source 
]

{ #category : #visiting }
JinDAMVBVisitorToString >> visitEquals: aVBEqualsNode [ 
	^ aVBEqualsNode source 
]

{ #category : #visiting }
JinDAMVBVisitorToString >> visitFloatLiteral: aVBFloatLiteralNode [ 
	^ aVBFloatLiteralNode token acceptVisitor: self 
]

{ #category : #visiting }
JinDAMVBVisitorToString >> visitIntegerLiteral: aVBIntegerLiteralNode [ 
	^ aVBIntegerLiteralNode token acceptVisitor: self 
]

{ #category : #visiting }
JinDAMVBVisitorToString >> visitInterval: aVBIntervalNode [

	^ aVBIntervalNode source
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToString >> visitMemberAccess: aVBMemberAccessNode [
	| str |
	str := aVBMemberAccessNode receiver
		ifNil: [ '' ]
		ifNotNil: [ :a | a acceptVisitor: self ].
	^ str , '.' , (aVBMemberAccessNode member acceptVisitor: self)
]

{ #category : #visiting }
JinDAMVBVisitorToString >> visitNegatedOperation: aVBNegatedOperationNode [ 
	^ '-' , (aVBNegatedOperationNode value acceptVisitor: self )
]

{ #category : #visiting }
JinDAMVBVisitorToString >> visitNewClause: aVBNewClauseNode [

	^ aVBNewClauseNode source
]

{ #category : #visiting }
JinDAMVBVisitorToString >> visitNotOperation: aVBNotOperationNode [

	^ aVBNotOperationNode source
]

{ #category : #visiting }
JinDAMVBVisitorToString >> visitNull: aVBNullNode [

	^ aVBNullNode token acceptVisitor: self
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToString >> visitParameter: aVBParameterNode [
	aVBParameterNode type ifNil: [ ^ 'Undefined' ].
	aVBParameterNode paramarrayToken
		ifNil: [ ^ aVBParameterNode type acceptVisitor: self ].
	^ 'ParamArray' , (aVBParameterNode type acceptVisitor: self)
]

{ #category : #visiting }
JinDAMVBVisitorToString >> visitParentheseesExpression: aVBParentheseesExpressionNode [

	^ aVBParentheseesExpressionNode source
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToString >> visitProcedureCallOrArrayAccess: aVBProcedureCallOrArrayAccessNode [
		
	^
	aVBProcedureCallOrArrayAccessNode source
	" (aVBProcedureCallOrArrayAccessNode selector ifNotNil:  acceptVisitor: self)
		, ' ('
		, (aVBProcedureCallOrArrayAccessNode arguments acceptVisitor: self)
		, ')'"
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToString >> visitSimpleIdentifier: aVBSimpleIdentifierNode [ 
	^ aVBSimpleIdentifierNode token value 
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToString >> visitSmaccToken: aSmaCCCaseInsensitiveToken [ 
	^ aSmaCCCaseInsensitiveToken value 
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToString >> visitSquareBracketIdentifier: aVBSquareBracketIdentifierNode [
	| str |
	str := aVBSquareBracketIdentifierNode token value.
	^ str copyFrom: 2 to: str size - 1
]

{ #category : #visiting }
JinDAMVBVisitorToString >> visitStringLiteral: aVBStringLiteralNode [ 
	^ aVBStringLiteralNode token acceptVisitor: self 
]

{ #category : #visiting }
JinDAMVBVisitorToString >> visitTypeOf: aVBTypeOfNode [
	^ 'Must Implement visitTypeOf '
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToString >> visitTypeSize: aVBTypeSizeNode [ 

	^ '({1})' format: { ',' join: (aVBTypeSizeNode sizes collect: [  :s  | s acceptVisitor: self ]) }
]

{ #category : #'as yet unclassified' }
JinDAMVBVisitorToString >> visitTypedThing: aVBTypedThingNode [

	^ (aVBTypedThingNode type acceptVisitor: self) , ('' join:
		   (aVBTypedThingNode sizes collect: [ :s | s acceptVisitor: self ]))
]
