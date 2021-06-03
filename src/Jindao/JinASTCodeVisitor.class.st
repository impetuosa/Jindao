Class {
	#name : #JinASTCodeVisitor,
	#superclass : #JinSubvisitor,
	#traits : 'TVBProgramNodeVisitor',
	#classTraits : 'TVBProgramNodeVisitor classTrait',
	#category : #'Jindao-Subvisitor'
}

{ #category : #'delegate to subvisitor' }
JinASTCodeVisitor >> syntax [ 
	^ self 
]

{ #category : #'delegate to subvisitor' }
JinASTCodeVisitor >> visitSourceCode: aCode [
	aCode ast acceptVisitor: self
]
