Class {
	#name : #CSNLTabulateLayout,
	#superclass : #CSNLLayout,
	#category : #JindaoCasinoImporting
}

{ #category : #visiting }
CSNLTabulateLayout >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNLTabulateLayout: self
]

{ #category : #'as yet unclassified' }
CSNLTabulateLayout >> getLayoutAttribute [
	^ {}
]

{ #category : #'as yet unclassified' }
CSNLTabulateLayout >> rows [
	| rows |
	" 
		The layouts in access are defined by the elements, there is not such a container feature. 
		In the case of tabulation, the important thing is the configuration: top and left. 
	"
	rows := (cell
		groupedBy:
			[ :c | (c widget attributes detect: [ :a | a name = #top ]) attributeValue ])
		associations.
	rows := (rows sort: [ :a :b | a key asNumber < b key asNumber ])
		collect: #value.
	^ rows
		collect: [ :r | 
			r
				sort: [ :a :b | 
					(a widget attributes detect: [ :d | d name = #left ]) attributeValue asNumber
						< (b widget attributes detect: [ :d | d name = #left ]) attributeValue  asNumber] ]
]

{ #category : #'as yet unclassified' }
CSNLTabulateLayout >> rowsDo: aBlockClosure [
	self rows do: aBlockClosure
]
