Class {
	#name : #JinFullASTCodeVisitor,
	#superclass : #JinSubvisitor,
	#category : #'Jindao-Subvisitor'
}

{ #category : #'delegate to subvisitor' }
JinFullASTCodeVisitor >> modifiedSourceCode [
	^ ('percy' asFileReference / self state top name
	   , self state top className , 'bas') exists
		  ifTrue: [ 
			  ('percy' asFileReference / self state top name
			   , self state top className , 'bas') readStream upToEnd ]
		  ifFalse: [ nil ]
]

{ #category : #'delegate to subvisitor' }
JinFullASTCodeVisitor >> syntax [ 
	^ self 
]

{ #category : #'delegate to subvisitor' }
JinFullASTCodeVisitor >> visitSourceCode: aCode [

	| ast |
	self state top src: aCode contents.

	[ ast := aCode ast ]
		on: Error
		do: [ 
			self modifiedSourceCode
				ifNotNil: [ :src | 
					self state top src: src.
					ast := VBParser parse: src ]
				ifNil: [ 
					self state top astCannotLoad: true.
					^ self ] ].
	ast ifNil: [ 
		self state top astCannotLoad: true.
		^ self ].
	ast acceptVisitor: self
]
