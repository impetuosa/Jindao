Extension { #name : #Symbol }

{ #category : #'*JinDAM' }
Symbol >> isExternal [

	^ #( isExternal isExternalFunction isExternalSub ) includes: self
]
