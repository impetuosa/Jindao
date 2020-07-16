Class {
	#name : #CSNLAbsolutePositionLayout,
	#superclass : #CSNLLayout,
	#category : #JindaoCasinoImporting
}

{ #category : #visiting }
CSNLAbsolutePositionLayout >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNLAbsolutePositionLayout: self

	

]
