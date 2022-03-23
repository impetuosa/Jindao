Extension { #name : #TTaskScheduler }

{ #category : #'*Jindao' }
TTaskScheduler >> privateFuture: aTask timeout: aTimeout [
	| execution |
	execution := aTask asTask futureTaskExecutionFor: self timeout: aTimeout .
	self scheduleTaskExecution: execution.
	^ execution future
]
