Class {
	#name : #CSNLAbsolutePositionLayout,
	#superclass : #CSNLLayout,
	#category : #JindaoCasinoImporting
}

{ #category : #visiting }
CSNLAbsolutePositionLayout >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNLAbsolutePositionLayout: self

	

]

{ #category : #'as yet unclassified' }
CSNLAbsolutePositionLayout >> getLayoutAttribute [
	^ {}
]

{ #category : #'as yet unclassified' }
CSNLAbsolutePositionLayout >> rows [
	| rows |
	" 
		The layouts in access are defined by the elements, there is not such a container feature. 
		In the case of tabulation, the important thing is the configuration: top and left. 
	"
	
	rows := (cell groupedBy:	[ :c | ((c widget attributes detect: [ :a | a name = #top ]) attributeValue asNumber / 10) asInteger ])
		associations.
	rows := (rows sort: [ :a :b | a key asNumber < b key asNumber ])
		collect: #value.
	^ rows
		collect: [ :r | 
			r sort: [ :a :b | 
				 (a widget attributes detect: [ :d | d name = #left ]) attributeValue asNumber
			  < (b widget attributes detect: [ :d | d name = #left ]) attributeValue asNumber
		]
		]
]

{ #category : #'as yet unclassified' }
CSNLAbsolutePositionLayout >> rowsDo: aBlockClosure [
	self rows do: aBlockClosure
]
