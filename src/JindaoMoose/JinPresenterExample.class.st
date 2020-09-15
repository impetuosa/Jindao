Class {
	#name : #JinPresenterExample,
	#superclass : #SpPresenter,
	#category : #JindaoMoose
}

{ #category : #initialization }
JinPresenterExample >> initializePresenter [

	layout := SpBoxLayout newVertical. 
	1 to: 100 do: [  : i  | layout add:(self newButton label: i asString ) ].
	
]
