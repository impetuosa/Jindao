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
JinCasinoModelStatelessFactory >> importAccessProperty: aProperty inTheContextOf: anImportedControl [
	| attribute |
	attribute := aProperty acceptVisitor: self.
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

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitAttachment: aJinControlAttachment [
	| input |
	input := CSNUIInputFile new.
	input name: aJinControlAttachment nameWithoutSpaces.
	^ input
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitCheckbox: aJinControlCheckbox [ 
	| input |
	input := CSNUIInputCheckbox new. 
	input name: aJinControlCheckbox nameWithoutSpaces.
	input value: aJinControlCheckbox value.
	^ input 
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitCombobox: aJinControlCombobox [
	| input |
	input := CSNUISelect new.
	input name: aJinControlCombobox nameWithoutSpaces.
	input value: aJinControlCombobox defaultValue.
	^ input
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitCommandButton: aJinControlCommandButton [
	| input |
	input := CSNUIButton new.
	input name: aJinControlCommandButton nameWithoutSpaces.
	^ input
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitImage: aJinControlImage [
	| input |
	input := CSNUILabel new.
	input name: aJinControlImage nameWithoutSpaces.
	^ input
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitLabel: aJinControlLabel [
	| input |
	input := CSNUIParagraph new.
	input name: aJinControlLabel nameWithoutSpaces.
	input text: aJinControlLabel caption.
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
	^ input
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitPage: aJinControlPage [
	| input |
	input := CSNUITab new.
	input name: aJinControlPage nameWithoutSpaces.
	^ input
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitRectangle: aJinControlRectangle [
	| input |
	input := CSNUIPanel new.
	input name: aJinControlRectangle nameWithoutSpaces.
	^ input
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitSubForm: aJinControlSubForm [
	| input |
	input := CSNUIFieldset new.
	input name: aJinControlSubForm nameWithoutSpaces.
	^ input
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitTabControl: aJinControlTabControl [
	| input |
	input := CSNUITabManager new.
	input name: aJinControlTabControl nameWithoutSpaces.
	^ input
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> visitTextbox: aJinControlTextbox [
	| input |
	input := CSNUIInputText new.
	input name: aJinControlTextbox nameWithoutSpaces.
	input value: aJinControlTextbox defaultValue.
	^ input
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> width: aJinControlCheckbox [ 
	^ CSNUIAbsoluteWidth new
		attributeValue: aJinControlCheckbox width;
		yourself
]
