Class {
	#name : #JinAstMetric,
	#superclass : #JinMetrics,
	#category : #'Jindao-Metrics'
}

{ #category : #'instance creation' }
JinAstMetric >> branchings [
	<cvs: #Branchings at: 15>
	^ (self children collect: [ :c | c valueOrZero: #Branching ]) sum
]

{ #category : #'instance creation' }
JinAstMetric >> functions [
	^ children at: #Function ifAbsent: [ {} ]
]

{ #category : #'instance creation' }
JinAstMetric >> goSubs [
	<cvs: #GoSub at: 12>
	^ (self children collect: [ :c | c valueOrZero: #GoSub ]) sum
]

{ #category : #'instance creation' }
JinAstMetric >> hadErrorOnCalculation [
	^ properties at: #ERROR ifPresent: [ true ] ifAbsent: [ false ]
]

{ #category : #'instance creation' }
JinAstMetric >> loops [
	<cvs: #Loops at: 15>
	^ (self children collect: [ :c | c valueOrZero: #Loop ]) sum
]

{ #category : #'instance creation' }
JinAstMetric >> newFunctionMetrics [
	^ self newEntryForType: #Function
]

{ #category : #'instance creation' }
JinAstMetric >> newPropertyAccessorMetrics [
	^ self newEntryForType: #PropertyAccessor
]

{ #category : #'instance creation' }
JinAstMetric >> newPropertyMetrics [
	^ self newEntryForType: #Property
]

{ #category : #'instance creation' }
JinAstMetric >> newSubMetrics [
	^ self newEntryForType: #SubProcedure
]

{ #category : #'instance creation' }
JinAstMetric >> onErrorGoTos [
	<cvs: #ErrorGoTo at: 13>
	^ (self children collect: [ :c | c valueOrZero: #OnErrorGoTo ]) sum
]

{ #category : #'instance creation' }
JinAstMetric >> onErrorResumeNext [
	<cvs: #ErrorResumeNext at: 14>
	^ (self children collect: [ :c | c valueOrZero: #OnErrorResumeNext ]) sum
]

{ #category : #'instance creation' }
JinAstMetric >> printOn: aStream [
	self class = JinAstMetric
		ifTrue: [ aStream nextPutAll: 'SC Metric'.
			properties
				at: #ERROR
				ifPresent: [ :errorText | 
					aStream nextPutAll: 'Error parsing: ' , errorText.
					^ self ].
			children
				keysAndValuesDo: [ :k :v | 
					aStream
						nextPutAll: k;
						nextPutAll: ':';
						nextPutAll: v size asString;
						nextPutAll: String tab ] ]
		ifFalse: [ aStream
				nextPutAll: (properties at: #AccesType);
				nextPutAll: 'Metric '.
			properties
				keysAndValuesDo: [ :k :v | 
					k = #AccesType
						ifFalse: [ aStream
								nextPutAll: k;
								nextPutAll: ':';
								nextPutAll: v asString;
								nextPutAll: String tab ] ] ]
]

{ #category : #'instance creation' }
JinAstMetric >> property [
	^ children at: #Property ifAbsent: [ {} ]
]

{ #category : #'instance creation' }
JinAstMetric >> propertyAccessors [
	^ children at: #PropertyAccessor ifAbsent: [ {} ]
]

{ #category : #'instance creation' }
JinAstMetric >> resumeLabels [
	<cvs: #ResumeLabel at: 16>
	^ (self children collect: [ :c | c valueOrZero: #ResumeLabel ]) sum
]

{ #category : #'instance creation' }
JinAstMetric >> resumeNext [
	<cvs: #ResumeNext at: 17>
	^ (self children collect: [ :c | c valueOrZero: #ResumeNext ]) sum
]

{ #category : #'instance creation' }
JinAstMetric >> resumes [
	<cvs: #ResumeEmpty at: 15>
	^ (self children collect: [ :c | c valueOrZero: #ResumeEmpty ]) sum
]

{ #category : #'instance creation' }
JinAstMetric >> subs [
	^ children at: #SubProcedure ifAbsent: [ {} ]
]
