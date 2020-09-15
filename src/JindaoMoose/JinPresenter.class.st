Class {
	#name : #JinPresenter,
	#superclass : #StPresenter,
	#category : #JindaoMoose
}

{ #category : #private }
JinPresenter class >> currentApplication [

	^ JinSpecApplication current
]
