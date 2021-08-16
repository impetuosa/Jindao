Extension { #name : #SmaCCToken }

{ #category : #'*JinDAM' }
SmaCCToken >> acceptVisitor: aJinDAMVBVisitorToReferenceName [

	^ aJinDAMVBVisitorToReferenceName visitSmaccToken: self
]
