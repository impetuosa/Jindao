Class {
	#name : #JinBreathFirstVisitor,
	#superclass : #Object,
	#category : #'Jindao-DomainObjects-Visitor'
}

{ #category : #'as yet unclassified' }
JinBreathFirstVisitor >> visitAttachment: aJinControlAttachment [ 
self visitFormControl: aJinControlAttachment
]

{ #category : #'as yet unclassified' }
JinBreathFirstVisitor >> visitCheckbox: aJinControlCheckbox [
	self visitFormControl: aJinControlCheckbox
]

{ #category : #'as yet unclassified' }
JinBreathFirstVisitor >> visitCollection: aCollection [
	aCollection do: [ :element | element acceptVisitor: self ]
]

{ #category : #'as yet unclassified' }
JinBreathFirstVisitor >> visitCombobox: aJinControlCombobox [
	self visitFormControl: aJinControlCombobox
]

{ #category : #'as yet unclassified' }
JinBreathFirstVisitor >> visitCommandButton: aJinControlCommandButton [ 
	self visitFormControl: aJinControlCommandButton
]

{ #category : #'as yet unclassified' }
JinBreathFirstVisitor >> visitForm: aJinForm [
	aJinForm hasModule ifTrue: [  aJinForm module acceptVisitor: self  ].
	self visitCollection: aJinForm controls 
]

{ #category : #'as yet unclassified' }
JinBreathFirstVisitor >> visitFormControl: aJinControlTextbox [ 
	self visitHandleObject: aJinControlTextbox 
]

{ #category : #'as yet unclassified' }
JinBreathFirstVisitor >> visitFormModule: aJinFormModule [ 
	self visitModule: aJinFormModule 
]

{ #category : #'as yet unclassified' }
JinBreathFirstVisitor >> visitHandleObject: aJinReference [ 
	" Leaf object arriving "
]

{ #category : #'as yet unclassified' }
JinBreathFirstVisitor >> visitImage: aJinControlImage [ 
	self visitFormControl: aJinControlImage 
]

{ #category : #'as yet unclassified' }
JinBreathFirstVisitor >> visitLabel: aJinControlLabel [ 
		self visitFormControl: aJinControlLabel
]

{ #category : #'as yet unclassified' }
JinBreathFirstVisitor >> visitLine: aJinControlLine [ 
	self visitFormControl: aJinControlLine
]

{ #category : #'as yet unclassified' }
JinBreathFirstVisitor >> visitListBox: aJinControlListBox [ 
	self visitFormControl: aJinControlListBox 
]

{ #category : #'as yet unclassified' }
JinBreathFirstVisitor >> visitModule: aJinModule [ 
	aJinModule code acceptVisitor: self.
	
]

{ #category : #'as yet unclassified' }
JinBreathFirstVisitor >> visitPage: aJinControlPage [
	self visitFormControl: aJinControlPage
]

{ #category : #'as yet unclassified' }
JinBreathFirstVisitor >> visitProject: aJinAccessProject [
	self visitCollection: aJinAccessProject references.
	self visitCollection: aJinAccessProject modules.
	self visitCollection: aJinAccessProject forms.
	self visitCollection: aJinAccessProject queries.
	self visitCollection: aJinAccessProject reports.
	self visitCollection: aJinAccessProject tables
]

{ #category : #'as yet unclassified' }
JinBreathFirstVisitor >> visitQuery: aJinQuery [ 
	" Not yer something to do "
]

{ #category : #'as yet unclassified' }
JinBreathFirstVisitor >> visitRectangle: aJinControlRectangle [
	self visitFormControl: aJinControlRectangle
]

{ #category : #'as yet unclassified' }
JinBreathFirstVisitor >> visitReference: aJinReference [ 


	self visitHandleObject: aJinReference 
]

{ #category : #'as yet unclassified' }
JinBreathFirstVisitor >> visitReport: aJinReport [ 
	" Visiting "
]

{ #category : #'as yet unclassified' }
JinBreathFirstVisitor >> visitSourceCode: aJinSourceCode [ 
	self visitHandleObject: aJinSourceCode 
]

{ #category : #'as yet unclassified' }
JinBreathFirstVisitor >> visitSubForm: aJinControlSubForm [ 
		self visitFormControl: aJinControlSubForm
]

{ #category : #'as yet unclassified' }
JinBreathFirstVisitor >> visitTabControl: aJinControlTabControl [
	self visitFormControl: aJinControlTabControl
]

{ #category : #'as yet unclassified' }
JinBreathFirstVisitor >> visitTable: aJinTable [ 
	
]

{ #category : #'as yet unclassified' }
JinBreathFirstVisitor >> visitTextbox: aJinControlTextbox [ 
	self visitFormControl: aJinControlTextbox 
]
