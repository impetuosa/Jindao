Class {
	#name : #JinAngularComponentBehaviorWriter,
	#superclass : #Object,
	#instVars : [
		'typescriptWriter'
	],
	#category : #JindaoMoose
}

{ #category : #writing }
JinAngularComponentBehaviorWriter >> writeBehaviorFor: aJinCasinoPage into: component [

	self assert: typescriptWriter isNil.
	typescriptWriter := JinTypescriptWriter new .
	aJinCasinoPage accept: self.
	component behavior: self behavior.
]
