Extension { #name : #COMDispatchInstance }

{ #category : #'*JinDao' }
COMDispatchInstance >> asCOMHandle [
	^ self 
]

{ #category : #'*Jindao' }
COMDispatchInstance >> asCachedHandle [
	^ JinCachedHandle new
		handle: self;
		yourself
]

{ #category : #'*Jindao' }
COMDispatchInstance >> asSnifferHandle [
	^ JinSnifferHandle new
		handle: self;
		yourself
]

{ #category : #'*Jindao' }
COMDispatchInstance >> asStateTrackingHandle [
	^ JinStateTrackingHandle new
		handle: self;
		yourself
]

{ #category : #'*Jindao' }
COMDispatchInstance >> propertyNamed: aPropName putIfWritable: aValue [
	| prop |
	prop := self getDispatchType properties
		detect: [ :e | e name = aPropName ].
	prop setter ifNotNil: [ ^ prop write: aValue to: self ]
]
