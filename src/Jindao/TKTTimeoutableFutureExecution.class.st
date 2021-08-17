Class {
	#name : #TKTTimeoutableFutureExecution,
	#superclass : #TKTFutureExecution,
	#instVars : [
		'timeout'
	],
	#category : #'Jindao-TaskIt-Futures'
}

{ #category : #accessing }
TKTTimeoutableFutureExecution >> doExecuteTask [
	TKTConfiguration runner scheduleTimeout: timeout on: self.
	^ super doExecuteTask
]

{ #category : #accessing }
TKTTimeoutableFutureExecution >> timeout: aTimeout [

	timeout := aTimeout
]
