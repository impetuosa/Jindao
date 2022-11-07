Class {
	#name : #JinGUIFirstCitizenVisitor,
	#superclass : #JinSubvisitor,
	#category : #'Jindao-Subvisitor'
}

{ #category : #'visit-controls' }
JinGUIFirstCitizenVisitor >> gui [
	^ self
]

{ #category : #'visit-controls' }
JinGUIFirstCitizenVisitor >> visitAttachment: aJinControlAttachment [
	self visitFormControl: aJinControlAttachment
]

{ #category : #'visit-controls' }
JinGUIFirstCitizenVisitor >> visitCheckbox: aJinControlCheckbox [
	self visitFormControl: aJinControlCheckbox
]

{ #category : #'visit-controls' }
JinGUIFirstCitizenVisitor >> visitCombobox: aJinControlCombobox [
	self visitFormControl: aJinControlCombobox
]

{ #category : #'visit-controls' }
JinGUIFirstCitizenVisitor >> visitCommandButton: aJinControlCommandButton [ 
	self visitFormControl: aJinControlCommandButton
]

{ #category : #'entry-point' }
JinGUIFirstCitizenVisitor >> visitForm: aJinForm [

	aJinForm hasModule ifTrue: [ aJinForm module acceptVisitor: self ].
	self visitCollection: aJinForm properties.
	self visitCollection: aJinForm controls
]

{ #category : #'visit-controls' }
JinGUIFirstCitizenVisitor >> visitImage: aJinControlImage [ 
	self visitFormControl: aJinControlImage 
]

{ #category : #'visit-controls' }
JinGUIFirstCitizenVisitor >> visitLabel: aJinControlLabel [ 
		self visitFormControl: aJinControlLabel
]

{ #category : #'visit-controls' }
JinGUIFirstCitizenVisitor >> visitLine: aJinControlLine [ 
	self visitFormControl: aJinControlLine
]

{ #category : #'visit-controls' }
JinGUIFirstCitizenVisitor >> visitListBox: aJinControlListBox [ 
	self visitFormControl: aJinControlListBox 
]

{ #category : #'visit-controls' }
JinGUIFirstCitizenVisitor >> visitPage: aJinControlPage [
	self visitFormControl: aJinControlPage
]

{ #category : #'visit-controls' }
JinGUIFirstCitizenVisitor >> visitRectangle: aJinControlRectangle [
	self visitFormControl: aJinControlRectangle
]

{ #category : #'entry-point' }
JinGUIFirstCitizenVisitor >> visitReport: aJinReport [

	aJinReport hasModule ifTrue: [ aJinReport module acceptVisitor: self ].

	self visitCollection: aJinReport controls
]

{ #category : #'visit-controls' }
JinGUIFirstCitizenVisitor >> visitSubForm: aJinControlSubForm [
	self visitFormControl: aJinControlSubForm
]

{ #category : #'visit-controls' }
JinGUIFirstCitizenVisitor >> visitTabControl: aJinControlTabControl [
	self visitFormControl: aJinControlTabControl
]

{ #category : #'visit-controls' }
JinGUIFirstCitizenVisitor >> visitTextbox: aJinControlTextbox [ 
	self visitFormControl: aJinControlTextbox 
]
