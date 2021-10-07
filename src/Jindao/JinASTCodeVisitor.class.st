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
	| ast |
	
	self state top src: aCode contents. 
	
	[ast := aCode ast.] on: Error do:[  
		self state top astCannotLoad: true .
		 ^ self  
	].
	ast ifNil: [  
		self state top astCannotLoad: true . 
		^ self  
	].
	ast acceptVisitor: self
]
