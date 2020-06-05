Extension { #name : #COMDispatchInstance }

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
