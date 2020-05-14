Class {
	#name : #JinCasinoModelStatelessFactory,
	#superclass : #Object,
	#category : #'Jindao-CasinoImporting'
}

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> disabled [
	^ CSNUIDisabled new
		disabled: true;
		yourself
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> height: aJinControlCheckbox [
	^ CSNUIAbsoluteHeight new
		attributeValue: aJinControlCheckbox height;
		yourself
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
	^ JinPage new
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

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> setupAttributesFrom: aJinControl into: aCSNUILeafElement [
	self flag: #CheckComment. 
	" The attributes required can be built by visiting the properties, since properties are pretty much the same. We may can aim to generate as the controls  "
	aJinControl enabled
		ifFalse: [ aCSNUILeafElement addAttribute: self disabled ].
	"aCSNUILeafElement addAttribute: (self height: aJinControl). "
	"aCSNUILeafElement addAttribute: (self width: aJinControl). "
	
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitAttachment: aJinControlAttachment [ 
| input |
	input := CSNUIInputFile new. 
	input name: aJinControlAttachment nameWithoutSpaces .
	"input addAttribute: (self height: aJinControlAttachment). "
"	input addAttribute: (self width: aJinControlAttachment). "
	
	^ input 
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitCheckbox: aJinControlCheckbox [ 
	| input |
	input := CSNUIInputCheckbox new. 
	input name: aJinControlCheckbox nameWithoutSpaces.
	input value: aJinControlCheckbox value.
	
	self setupAttributesFrom: aJinControlCheckbox into:input.
	
	^ input 
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitCombobox: aJinControlCombobox [ 
	| input |
	input := CSNUISelect new. 
	input name: aJinControlCombobox nameWithoutSpaces.
	input value: aJinControlCombobox defaultValue .
	
	self setupAttributesFrom: aJinControlCombobox into:input.
	
	^ input 
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitCommandButton: aJinControlCommandButton [ 
	| input |
	input := CSNUIButton new. 
	input name: aJinControlCommandButton nameWithoutSpaces .
	
	self setupAttributesFrom: aJinControlCommandButton into:input.
	
	^ input 
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitImage: aJinControlImage [
	| input |
	input := CSNUILabel new.
	input name: aJinControlImage nameWithoutSpaces.
	"input addAttribute: (self height: aJinControlImage). "
	"input addAttribute: (self width: aJinControlImage). "
	^ input
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitLabel: aJinControlLabel [ 
| input |
	self halt. 
	input := CSNUIParagraph new. 
	input name: aJinControlLabel nameWithoutSpaces .
	input text: aJinControlLabel caption.
"	input addAttribute: (self height: aJinControlLabel)." 
"	input addAttribute: (self width: aJinControlLabel). 
	"
	^ input 
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitLine: aJinControlLine [ 
	self error: 'There is no widget for Line yet. '
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitListBox: aJinControlListBox [
	| input |
	input := CSNUIOrderedList new.
	input name: aJinControlListBox nameWithoutSpaces.
	self setupAttributesFrom: aJinControlListBox into: input.
	^ input
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitPage: aJinControlPage [ 
| input |
	input := CSNUITab new.
	input name: aJinControlPage nameWithoutSpaces.
	"input addAttribute: (self height: aJinControlPage).""
	input addAttribute: (self width: aJinControlPage)."
	^ input
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitRectangle: aJinControlRectangle [ 
| input |
	input := CSNUIPanel new. 
	input name: aJinControlRectangle nameWithoutSpaces .

"	input addAttribute: (self height: aJinControlRectangle). "
	"input addAttribute: (self width: aJinControlRectangle). "
	
	^ input 
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitSubForm: aJinControlSubForm [
	| input |
	input := CSNUIFieldset new.
	input name: aJinControlSubForm nameWithoutSpaces.
	"input addAttribute: (self height: aJinControlSubForm)."
	"input addAttribute: (self width: aJinControlSubForm)."
	^ input
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitTabControl: aJinControlTabControl [
	| input |
	input := CSNUITabManager new.
	input name: aJinControlTabControl nameWithoutSpaces.
	"input addAttribute: (self height: aJinControlTabControl)."
"	input addAttribute: (self width: aJinControlTabControl)."
	^ input
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitTextbox: aJinControlTextbox [ 
	| input |
	input := CSNUIInputText new. 
	input name: aJinControlTextbox nameWithoutSpaces .
	input value: aJinControlTextbox defaultValue.
	
	self setupAttributesFrom: aJinControlTextbox into:input.
	
	^ input 
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> width: aJinControlCheckbox [ 
	^ CSNUIAbsoluteWidth new
		attributeValue: aJinControlCheckbox width;
		yourself
]
