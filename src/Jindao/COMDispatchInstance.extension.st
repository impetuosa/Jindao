Extension { #name : #COMDispatchInstance }

{ #category : #'*JinDao' }
COMDispatchInstance >> asCOMHandle [
	^ self 
]

{ #category : #'*Jindao' }
COMDispatchInstance >> propertyNamed: aPropName putIfWritable: aValue [
	| prop |
	prop := self getDispatchType properties
		at:aPropName .
	prop setter
		ifNil: [ ^ false ]
		ifNotNil: [ prop write: aValue to: self.
			^ true ]
]
