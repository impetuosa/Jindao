Class {
	#name : #JinCasinoModelStatelessFactory,
	#superclass : #Object,
	#category : #'Jindao-CasinoImporting'
}

{ #category : #accessing }
JinCasinoModelStatelessFactory >> disabled [
	^ CSNUIDisabled new
		disabled: true;
		yourself
]

{ #category : #accessing }
JinCasinoModelStatelessFactory >> height: aJinControlCheckbox [
	^ CSNUIAbsoluteHeight new
		attributeValue: aJinControlCheckbox height;
		yourself
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> importAccessProperty: aProperty inTheContextOf: anImportedControl [
	| attribute |
	attribute := aProperty acceptVisitor: self.
	(attribute isNil or: [ attribute = self ])
		ifTrue: [ ^ nil ].
	anImportedControl addAttribute: attribute.
	^ attribute
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> importControl: aControl inTheContextOf: aWidget [
	| control |
	control := self importModelFrom: aControl.
	aWidget addWidget: control.
	^ control
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> importForm: aForm inTheContextOf: aProject [
	^ JinCasinoPage new
		realClassName: aForm class name;
		addBusinessPage:
			(CSNBusinessPage new
				name: aForm nameWithoutSpaces;
				yourself);
		name: aForm name;
		project: aProject;
		yourself
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> importModelFrom: aControl [
	^ aControl acceptVisitor: self. 
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> importProject: aProject model: aModel [
	^ JinCasinoProject new
		name: aProject name;
		model: aModel ;
		yourself
]

{ #category : #'visiting - properties' }
JinCasinoModelStatelessFactory >> visitAccessProperty: aProperty [ 
	"nothing to do"
]

{ #category : #'visit - control' }
JinCasinoModelStatelessFactory >> visitAttachment: aJinControlAttachment [
	| input |
	input := CSNUIInputFile new.
	input name: aJinControlAttachment nameWithoutSpaces.
	^ input
]

{ #category : #'visit - control' }
JinCasinoModelStatelessFactory >> visitCheckbox: aJinControlCheckbox [ 
	| input |
	input := CSNUIInputCheckbox new. 
	input name: aJinControlCheckbox nameWithoutSpaces.
	input value: aJinControlCheckbox value.
	^ input 
]

{ #category : #'visit - control' }
JinCasinoModelStatelessFactory >> visitCombobox: aJinControlCombobox [
	| input |
	input := CSNUISelect new.
	input name: aJinControlCombobox nameWithoutSpaces.
	input value: aJinControlCombobox defaultValue.
	^ input
]

{ #category : #'visit - control' }
JinCasinoModelStatelessFactory >> visitCommandButton: aJinControlCommandButton [
	| input |
	input := CSNUIButton new.
	input name: aJinControlCommandButton nameWithoutSpaces.
	^ input
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitControlSource: aJinControlSource [ 
	self visitAccessProperty: aJinControlSource 
]

{ #category : #'visiting - properties' }
JinCasinoModelStatelessFactory >> visitControlType: aJinControlType [ 
	 self visitAccessProperty: aJinControlType
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitDatasheetCaption: aJinDatasheetCaption [
	aJinDatasheetCaption value
		ifNotEmpty: [ :val | 
			^ CSNUILabel new
				attributeValue: val;
				yourself ]
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitDecimalPlaces: aJinDecimalPlaces [
	self assert: aJinDecimalPlaces value = 255.
	self visitAccessProperty: aJinDecimalPlaces 
]

{ #category : #'visiting - properties' }
JinCasinoModelStatelessFactory >> visitEventProcPrefix: aJinEventProcPrefix [ 
	 self visitAccessProperty: aJinEventProcPrefix
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitFormat: aJinFormat [ 
	self assert: aJinFormat value = ''.
	self visitAccessProperty: aJinFormat 
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitHeight: aJinHeight [
	Warning
		signal:
			' I dont know yet how to manage height . it seems to be a bit more complex than expected '
]

{ #category : #'visit - control' }
JinCasinoModelStatelessFactory >> visitImage: aJinControlImage [
	| input |
	input := CSNUILabel new.
	input name: aJinControlImage nameWithoutSpaces.
	^ input
]

{ #category : #'visit - control' }
JinCasinoModelStatelessFactory >> visitLabel: aJinControlLabel [
	| input |
	input := CSNUIParagraph new.
	input name: aJinControlLabel nameWithoutSpaces.
	input text: aJinControlLabel caption.
	^ input
]

{ #category : #'visiting - properties' }
JinCasinoModelStatelessFactory >> visitLabelName: aJinLabelName [
	Warning signal: 'JinLabelName fails on getting value. this visit may have to do something '
]

{ #category : #'visit - control' }
JinCasinoModelStatelessFactory >> visitLine: aJinControlLine [ 
	self error: 'There is no widget for Line yet. '
]

{ #category : #'visit - control' }
JinCasinoModelStatelessFactory >> visitListBox: aJinControlListBox [
	| input |
	input := CSNUIOrderedList new.
	input name: aJinControlListBox nameWithoutSpaces.
	^ input
]

{ #category : #'visiting - properties' }
JinCasinoModelStatelessFactory >> visitName: aJinName [
	self visitAccessProperty: aJinName
]

{ #category : #'visit - control' }
JinCasinoModelStatelessFactory >> visitPage: aJinControlPage [
	| input |
	input := CSNUITab new.
	input name: aJinControlPage nameWithoutSpaces.
	^ input
]

{ #category : #'visit - control' }
JinCasinoModelStatelessFactory >> visitRectangle: aJinControlRectangle [
	| input |
	input := CSNUIPanel new.
	input name: aJinControlRectangle nameWithoutSpaces.
	^ input
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitShowDatePicker: aJinShowDatePicker [ 
	" this property is used during the building of the text box. nothing to do here "

]

{ #category : #'visit - control' }
JinCasinoModelStatelessFactory >> visitSubForm: aJinControlSubForm [
	| input |
	input := CSNUIFieldset new.
	input name: aJinControlSubForm nameWithoutSpaces.
	^ input
]

{ #category : #'visit - control' }
JinCasinoModelStatelessFactory >> visitTabControl: aJinControlTabControl [
	| input |
	input := CSNUITabManager new.
	input name: aJinControlTabControl nameWithoutSpaces.
	^ input
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitTextFormat: aJinTextFormat [
	self assert: aJinTextFormat value = 0.
	self visitAccessProperty: aJinTextFormat
]

{ #category : #'visit - control' }
JinCasinoModelStatelessFactory >> visitTextbox: aJinControlTextbox [
	| input |
	input := (aJinControlTextbox showDatePicker = 1
		ifTrue: [ CSNUIInputDate ]
		ifFalse: [ CSNUIInputText ]) new.
	input name: aJinControlTextbox nameWithoutSpaces.
	input value: aJinControlTextbox defaultValue.
	^ input
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitTop: aJinTop [ 
	Warning signal: 'Top should be interesting for layout annotating '
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitVisible: aJinVisible [
	aJinVisible value
		ifTrue: [ ^ self visitAccessProperty: aJinVisible ].
	self halt: 'Invisible thing. check what to do'.
	^ CSNUIVisibility new
		attributeValue: false;
		yourself
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitWidth: aJinWidth [
	Warning
		signal:
			' I dont know yet how to manage width. it seems to be a bit more complex than expected '
]

{ #category : #accessing }
JinCasinoModelStatelessFactory >> width: aJinControlCheckbox [ 
	^ CSNUIAbsoluteWidth new
		attributeValue: aJinControlCheckbox width;
		yourself
]
