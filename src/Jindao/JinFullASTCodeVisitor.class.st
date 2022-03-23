Class {
	#name : #JinFullASTCodeVisitor,
	#superclass : #JinSubvisitor,
	#category : #'Jindao-Subvisitor'
}

{ #category : #'delegate to subvisitor' }
JinFullASTCodeVisitor >> syntax [ 
	^ self 
]

{ #category : #'delegate to subvisitor' }
JinFullASTCodeVisitor >> visitSourceCode: aCode [
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
