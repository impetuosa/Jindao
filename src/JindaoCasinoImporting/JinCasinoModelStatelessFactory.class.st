Class {
	#name : #JinCasinoModelStatelessFactory,
	#superclass : #JinVisitor,
	#category : #JindaoCasinoImporting
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
	anImportedControl mooseModel add: attribute. 
	anImportedControl addAttribute: attribute.
	^ attribute
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> importControl: aControl inTheContextOf: aWidget [
	| control intro |
	control := self importModelFrom: aControl.
	control ifNotNil: [
	aWidget mooseModel add: control.
	intro := self
		resolveLayoutContainer: aControl layoutID
		type: aControl layoutName
		inTheContextOf: aWidget.
	intro addWidget: control.].
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
		name: aForm nameWithoutSpaces;
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
JinCasinoModelStatelessFactory >> importSubform: aJinControlSubForm inTheContextOf: aForm [
	
	^ JinCasinoWidgetUsage new
		widgetName: aJinControlSubForm name;
		mooseModel: aForm mooseModel;
		yourself
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> resolveLayoutContainer: aLayoutId type: aLayoutTypeName inTheContextOf: aContainer [
	| layoutedContainer |
	^ aContainer businessPage first widgets
		detect: [ :c | 
			c isContainer
				and:
					[ c layout isNotNil and: [ (c propertyNamed: 'LayoutID') = aLayoutId ] ] ]
		ifNone: [ layoutedContainer := (aLayoutId = 0
				ifTrue: [ CSNUIPanel ]
				ifFalse: [ CSNUIFieldset ]) new.
			layoutedContainer propertyNamed: 'LayoutID' put: aLayoutId.
			layoutedContainer
				layout:
					(aLayoutId = 0
						ifTrue: [ CSNLAbsolutePositionLayout ]
						ifFalse: [ CSNLTabulateLayout ]) new.
			aContainer mooseModel add: layoutedContainer.
			aContainer mooseModel add: layoutedContainer layout.
			aContainer addWidget: layoutedContainer.
			layoutedContainer ]
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

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitBackColor: aJinBackColor [ 
	
]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitBackShade: aJinBackShade [ 
	"CAnnot read type yet "
]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitBackStyle: aJinBackStyle [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitBackThemeColorIndex: aJinBackThemeColorIndex [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitBackTint: aJinBackTint [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitBorderColor: aJinBorderColor [ 
]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitBorderLineStyle: aJinBorderLineStyle [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitBorderShade: aJinBorderShade [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitBorderStyle: aJinBorderStyle [ 	
]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitBorderThemeColorIndex: aJinBorderThemeColorIndex [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitBorderTint: aJinBorderTint [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitBorderWidth: aJinBorderWidth [ 
]

{ #category : #'visit - control' }
JinCasinoModelStatelessFactory >> visitCheckbox: aJinControlCheckbox [ 
	| input |
	input := CSNUIInputCheckbox new. 
	input name: aJinControlCheckbox nameWithoutSpaces.
	[input value: aJinControlCheckbox value.] on: Win32Error do: [ :e | e passIfNotError0x80020009  ].
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
	input
		addAttribute:
			(CSNUILabel new
				attributeValue: aJinControlCommandButton caption;
				yourself).
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

{ #category : #'visiting - properties' }
JinCasinoModelStatelessFactory >> visitDatasheetCaption: aJinDatasheetCaption [
	aJinDatasheetCaption value
		ifNotEmpty: [ :val | 
			self halt. 
			^ CSNUILabel new
				attributeValue: val;
				yourself ]
]

{ #category : #'visiting - properties' }
JinCasinoModelStatelessFactory >> visitDecimalPlaces: aJinDecimalPlaces [
"	self assert: aJinDecimalPlaces value = 255."
	self visitAccessProperty: aJinDecimalPlaces 
]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitDisplayAsHyperlink: aJinDisplayAsHyperlink [ 

]

{ #category : #'visiting - properties' }
JinCasinoModelStatelessFactory >> visitEventProcPrefix: aJinEventProcPrefix [ 
	 self visitAccessProperty: aJinEventProcPrefix
]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitFontBold: aJinFontBold [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitFontItalic: aJinFontItalic [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitFontName: aJinFontName [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitFontSize: aJinFontSize [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitFontUnderline: aJinFontUnderline [ 
]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitFontWeight: aJinFontWeight [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitForeColor: aJinForeColor [ 
]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitForeShade: aJinForeShade [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitForeThemeColorIndex: aJinForeThemeColorIndex [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitForeTint: aJinForeTint [ 

]

{ #category : #'visiting - properties' }
JinCasinoModelStatelessFactory >> visitFormat: aJinFormat [ 
"	self assert: aJinFormat value = ''.
	self visitAccessProperty: aJinFormat "
]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitGridlineStyleBottom: aJinGridlineStyleBottom [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitGridlineStyleLeft: aJinGridlineStyleLeft [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitGridlineStyleRight: aJinGridlineStyleRight [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitGridlineStyleTop: aJinGridlineStyleTop [ 

]

{ #category : #'visiting - properties' }
JinCasinoModelStatelessFactory >> visitHeight: aJinHeight [
	^ CSNUIAbsoluteHeight new
		attributeValue: aJinHeight value;
		name: #height;
		yourself
]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitHyperlinkTarget: aJinHyperlinkTarget [ 

]

{ #category : #'visit - control' }
JinCasinoModelStatelessFactory >> visitImage: aJinControlImage [
	| input |
	input := CSNUIImage new.
	input name: aJinControlImage nameWithoutSpaces.
	
	^ input
]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitIsHyperlink: aJinIsHyperlink [ 

]

{ #category : #'visit - control' }
JinCasinoModelStatelessFactory >> visitLabel: aJinControlLabel [
	| input |
	input := CSNUIParagraph new.
	input name: aJinControlLabel nameWithoutSpaces.
	input
		addAttribute:
			(CSNUILabel new
				attributeValue: aJinControlLabel caption;
				yourself).
	^ input
]

{ #category : #'visiting - properties' }
JinCasinoModelStatelessFactory >> visitLabelName: aJinLabelName [

]

{ #category : #'visiting - properties' }
JinCasinoModelStatelessFactory >> visitLeft: aJinLeft [
	^ CSNUILeft new
		attributeValue: aJinLeft value;
		name: #left;
		yourself
]

{ #category : #'visit - control' }
JinCasinoModelStatelessFactory >> visitLine: aJinControlLine [ 
"	self error: 'There is no widget for Line yet. '"
	^ nil
]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitLineSpacing: aJinLineSpacing [ 
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

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitOldBorderStyle: aJinOldBorderStyle [ 

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

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitScrollBars: aJinScrollBars [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitShowDatePicker: aJinShowDatePicker [ 
	" this property is used during the building of the text box. nothing to do here "

]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitSpecialEffect: aJinSpecialEffect [ 

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

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitTextAlign: aJinTextAlign [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitTextFontCharSet: aJinTextFontCharSet [ 

]

{ #category : #'visiting - properties' }
JinCasinoModelStatelessFactory >> visitTextFormat: aJinTextFormat [
"	self assert: aJinTextFormat value = 0."
	self visitAccessProperty: aJinTextFormat
]

{ #category : #'visit - control' }
JinCasinoModelStatelessFactory >> visitTextbox: aJinControlTextbox [
	| input |
	"
	
	(aJinControlTextbox showDatePicker = 1
		ifTrue: [ CSNUIInputDate ]
		ifFalse: [ CSNUIInputText ]) new.
	
	Regardless what the documentation says, this property is not enough to know if we shall or not use a datepicker. 
	It is mostly a mix of this and the data type bounded. (by example a column of a table).
	"
	input := CSNUIInputText new.
	input name: aJinControlTextbox nameWithoutSpaces.
	input value: aJinControlTextbox defaultValue.
	^ input
]

{ #category : #'not -yet -implemented' }
JinCasinoModelStatelessFactory >> visitThemeFontIndex: aJinThemeFontIndex [ 

]

{ #category : #'visiting - properties' }
JinCasinoModelStatelessFactory >> visitTop: aJinTop [
	^ CSNUITop new
		attributeValue: aJinTop value;
		name:#top;
		yourself
]

{ #category : #'visiting - properties' }
JinCasinoModelStatelessFactory >> visitVisible: aJinVisible [
	aJinVisible value
		ifTrue: [ ^ self visitAccessProperty: aJinVisible ].
	"^ CSNUIVisibility new
		name: #hidden;
		attributeValue: true;
		yourself"
]

{ #category : #'visiting - properties' }
JinCasinoModelStatelessFactory >> visitWidth: aJinWidth [
	^ CSNUIAbsoluteWidth new
		attributeValue: aJinWidth value;
		name: #width;
		yourself
]

{ #category : #'as yet unclassified' }
JinCasinoModelStatelessFactory >> warn: text [
	Warning signal: text
]

{ #category : #accessing }
JinCasinoModelStatelessFactory >> width: aJinControlCheckbox [ 
	^ CSNUIAbsoluteWidth new
		attributeValue: aJinControlCheckbox width;
		yourself
]
