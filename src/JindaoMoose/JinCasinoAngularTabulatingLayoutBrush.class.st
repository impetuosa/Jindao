Class {
	#name : #JinCasinoAngularTabulatingLayoutBrush,
	#superclass : #Object,
	#category : #JindaoMoose
}

{ #category : #writing }
JinCasinoAngularTabulatingLayoutBrush >> write: aCSNLAbsolutePositionLayout into: aXMLWriter with: aFullBlockClosure [

	aXMLWriter tag: 'tbody' with: [ 
		aCSNLAbsolutePositionLayout rowsDo: [ :row | 
			aXMLWriter tag: 'tr' with: [ 
				row do: [ :cell | 
					aXMLWriter tag: 'td' with: [ aFullBlockClosure value: cell widget ] ] ] ] ]
]
