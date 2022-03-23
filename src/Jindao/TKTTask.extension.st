Extension { #name : #TKTTask }

{ #category : #'*Jindao' }
TKTTask >> future: executor timeout: aTimeout [
	^ executor privateFuture: self timeout: aTimeout 
]

{ #category : #'*Jindao' }
TKTTask >> futureTaskExecutionFor: aRunner timeout: aTimeout [

	^ self
		  configureTaskExecution: (TKTTimeoutableFutureExecution new
				   timeout: aTimeout;
				   yourself)
		  with: aRunner
]
