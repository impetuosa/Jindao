Class {
	#name : #JinAnchor,
	#superclass : #Object,
	#instVars : [
		'file',
		'start',
		'stop'
	],
	#category : #JindaoAngular
}

{ #category : #accessing }
JinAnchor >> file: aFile [
	file := aFile 
]

{ #category : #accessing }
JinAnchor >> sourceCode [ 
	 | stream code |
	stream := file readStream.
	stream position: start - 1 . 
	code := stream next: stop- start + 1. 
	stream close. 
	^ code 
]

{ #category : #accessing }
JinAnchor >> start: number [
	 start := number 
]

{ #category : #accessing }
JinAnchor >> stop: number [
	 stop := number 
]
