Class {
	#name : #JinAngularComponentTemplateWriter,
	#superclass : #Object,
	#instVars : [
		'xmlStream'
	],
	#category : #JindaoMoose
}

{ #category : #accessing }
JinAngularComponentTemplateWriter >> configuration [

	^ JinCasinoAngularMapper default
]

{ #category : #generated }
JinAngularComponentTemplateWriter >> template [

	^ JinAngularProtoComponentTemplate new
		  contents: xmlStream contents;
		  yourself
]

{ #category : #visiting }
JinAngularComponentTemplateWriter >> visitCSNLAbsolutePositionLayout: aLayout [ 
	| layoutBrush |

	layoutBrush := (self configuration brushFor: aLayout) .

	layoutBrush write: aLayout into: xmlStream with: [ : entry | 
		 entry accept: self.
	 ].
	
]

{ #category : #visiting }
JinAngularComponentTemplateWriter >> visitCSNLCell: aCSNLCell [

	self assert: (aCSNLCell layoutOwner container = aCSNLCell widget) not.
	aCSNLCell widget accept: self
]

{ #category : #visiting }
JinAngularComponentTemplateWriter >> visitCSNLTabulateLayout: aLayout [ 
	| layoutBrush |

	layoutBrush := (self configuration brushFor: aLayout) .

	layoutBrush write: aLayout into: xmlStream with: [ : entry | 
		 entry accept: self.
	 ].
	
]

{ #category : #visiting }
JinAngularComponentTemplateWriter >> visitCSNLVerticalLayout: aCSNLVerticalLayout [

	self writeLayout: aCSNLVerticalLayout
]

{ #category : #visiting }
JinAngularComponentTemplateWriter >> visitCSNUIInputText: aCSNUIInputText [

	self writeLeafElement: aCSNUIInputText
]

{ #category : #visiting }
JinAngularComponentTemplateWriter >> visitCSNUIPanel: aCSNUIPanel [

	(self configuration brushFor: aCSNUIPanel) write: aCSNUIPanel into: xmlStream with: [ 
		aCSNUIPanel layout
			ifNil: [ aCSNUIPanel widgets do: [ :w | w accept: self ] ]
			ifNotNil: [ aCSNUIPanel layout accept: self ] ].
]

{ #category : #visiting }
JinAngularComponentTemplateWriter >> visitCSNUIParagraph: aCSNUIParagraph [ 
	self writeLeafElement: aCSNUIParagraph
]

{ #category : #writing }
JinAngularComponentTemplateWriter >> writeHtmlFor: aCSNUIObject into: component [ 

	self assert: xmlStream isNil.
	xmlStream := XMLWriter new .
	xmlStream enablePrettyPrinting.
	aCSNUIObject accept: self.
	component template: self template.
]

{ #category : #writing }
JinAngularComponentTemplateWriter >> writeLayout: aCSNLLayout [

	aCSNLLayout container widgets , aCSNLLayout cell do: [ :widget | 
		widget accept: self ]
]

{ #category : #visiting }
JinAngularComponentTemplateWriter >> writeLayoutedElement: aCSNElement [ 

	(self configuration brushFor: aCSNElement) write: aCSNElement into: xmlStream with: [ 
		aCSNElement layout
			ifNil: [ aCSNElement  widgets do: [ :w | w accept: self ] ]
			ifNotNil: [ aCSNElement layout accept: self ] ].
]

{ #category : #writing }
JinAngularComponentTemplateWriter >> writeLeafElement: anElement [

	(self configuration brushFor: anElement) write: anElement into: xmlStream
]
