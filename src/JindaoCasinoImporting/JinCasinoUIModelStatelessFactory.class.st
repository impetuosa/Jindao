Class {
	#name : #JinCasinoUIModelStatelessFactory,
	#superclass : #JinVisitor,
	#category : #JindaoCasinoImporting
}

{ #category : #accessing }
JinCasinoUIModelStatelessFactory >> disabled [
	^ CSNUIDisabled new
		disabled: true;
		yourself
]

{ #category : #accessing }
JinCasinoUIModelStatelessFactory >> height: aJinControlCheckbox [
	^ CSNUIAbsoluteHeight new
		attributeValue: aJinControlCheckbox height;
		yourself
]

{ #category : #'as yet unclassified' }
JinCasinoUIModelStatelessFactory >> importAccessProperty: aProperty inTheContextOf: anImportedControl [
	| attribute |
	attribute := aProperty acceptVisitor: self.
	(attribute isNil or: [ attribute = self ])
		ifTrue: [ ^ nil ].
	anImportedControl mooseModel add: attribute. 
	anImportedControl addAttribute: attribute.
	^ attribute
]

{ #category : #'as yet unclassified' }
JinCasinoUIModelStatelessFactory >> importControl: aControl inTheContextOf: aWidget [
	| control intro |
	control := self importModelFrom: aControl.
	control ifNotNil: [
	aWidget mooseModel add: control.
	intro := self
		resolveLayoutContainer: aControl layoutID
		section: aControl section
		type: aControl layoutName
		inTheContextOf: aWidget.
	intro addWidget: control.].
	^ control
	
]

{ #category : #'as yet unclassified' }
JinCasinoUIModelStatelessFactory >> importForm: aForm inTheContextOf: aProject [
	| layout container page |
	layout := CSNLVerticalLayout new.
	aProject mooseModel add: layout.
	container := CSNUIPanel new.
	aProject mooseModel add: container.
	container layout: layout.
	page := JinCasinoPage new
		realClassName: aForm class name;
		name: aForm nameWithoutSpaces;
		project: aProject;
		yourself.
	page kindOfPage: aForm formType.
	page mainContainer: container.
	aProject mooseModel add: page.
	^ page
]

{ #category : #'as yet unclassified' }
JinCasinoUIModelStatelessFactory >> importModelFrom: aControl [
	^ aControl acceptVisitor: self. 
]

{ #category : #'as yet unclassified' }
JinCasinoUIModelStatelessFactory >> importOrGetSchema: aJinQuery inTheContextOf: aCSNUICWModel [
	^ aCSNUICWModel entities
		detect: [ :e | e species = MDRelationalSchema ]
		ifNone: [ | sch |
			sch := MDRelationalSchema new.
			sch name: 'Default Access Schema'.
			aCSNUICWModel add: sch.
			sch ]
]

{ #category : #'as yet unclassified' }
JinCasinoUIModelStatelessFactory >> importProject: aProject model: aModel [
	^ JinCasinoProject new
		name: aProject name;
		model: aModel ;
		yourself
]

{ #category : #'as yet unclassified' }
JinCasinoUIModelStatelessFactory >> importQueryEntity: aJinQuery inTheContextOf: aCSNUICWModel [
	| schema element columns |
	schema := self
		importOrGetSchema: aJinQuery
		inTheContextOf: aCSNUICWModel.
	^ schema elements
		detect: [ :e | e name = aJinQuery name ]
		ifNone: [ element := MDRelationalView new.
			element name: aJinQuery name.
			element sql: aJinQuery sql.

			columns := aJinQuery fields
				collect: [ :f | 
					| col |
					col := MDColumn new
						name: f name;
						type: (self mapType: f typeName);
						yourself.
					element addElement: col.
					
					col ].
			schema addElement: element.
			aCSNUICWModel addAll: columns.
			aCSNUICWModel add: element.
			element ]
]

{ #category : #'as yet unclassified' }
JinCasinoUIModelStatelessFactory >> importSubform: aJinControlSubForm inTheContextOf: aForm [
	| wu |

	wu := JinCasinoWidgetUsage new
		name: aJinControlSubForm name ;
		widgetName: aJinControlSubForm sourceObjectWithoutSpaces;
		yourself.
	aForm mooseModel add: wu.
	aForm addWidget: wu
]

{ #category : #'as yet unclassified' }
JinCasinoUIModelStatelessFactory >> importTableEntity: aJinTable inTheContextOf: aCSNUICWModel [
	| schema element columns |
	schema := self
		importOrGetSchema: aJinTable
		inTheContextOf: aCSNUICWModel.
	^ schema elements
		detect: [ :e | e name = aJinTable name ]
		ifNone: [ element := MDRelationalTable new.
			element name: aJinTable name.
			columns := aJinTable fields
				collect: [ :f | 
					| col |
					col := MDColumn new
						name: f name;
						type: (self mapType: f typeName);
						yourself.
					element addElement: col.
					col ].
			schema addElement: element.
			aCSNUICWModel addAll: columns.
			aCSNUICWModel add: element.
			element ]
]

{ #category : #'as yet unclassified' }
JinCasinoUIModelStatelessFactory >> mapType: aTypeName [
	^ aTypeName 
]

{ #category : #'as yet unclassified' }
JinCasinoUIModelStatelessFactory >> resolveLayoutContainer: aLayoutId section: aSection type: aLayoutTypeName inTheContextOf: aContainer [
	| layoutedContainer section |
	
	section := (aContainer section: aSection) .
	^ section widgets
		detect: [ :c | 
			c isContainer
				and:
					[ c layout isNotNil and: [ (c propertyNamed: 'LayoutID') = aLayoutId ] ] ]
		ifNone: [ 
			layoutedContainer := CSNUIPanel new.
			" (aLayoutId = 0
				ifTrue: [ CSNUIPanel ]
				ifFalse: [ CSNUIFieldset ]) new."
			layoutedContainer propertyNamed: 'LayoutID' put: aLayoutId.
			layoutedContainer
				layout:
					(aLayoutId = 0
						ifTrue: [ CSNLAbsolutePositionLayout ]
						ifFalse: [ CSNLTabulateLayout ]) new.
			section mooseModel add: layoutedContainer.
			section mooseModel add: layoutedContainer layout.
			section addWidget: layoutedContainer.
			layoutedContainer ]
]

{ #category : #'visiting - properties' }
JinCasinoUIModelStatelessFactory >> toPixelSize: aValue [
	^ aValue / 10
]

{ #category : #'visiting - properties' }
JinCasinoUIModelStatelessFactory >> visitAccessProperty: aProperty [ 
	"nothing to do"
	^ nil
]

{ #category : #'visit - control' }
JinCasinoUIModelStatelessFactory >> visitAttachment: aJinControlAttachment [
	| input |
	input := CSNUIInputFile new.
	input name: aJinControlAttachment nameWithoutSpaces.
	^ input
]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitBackColor: aJinBackColor [ 
	
]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitBackShade: aJinBackShade [ 
	"CAnnot read type yet "
]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitBackStyle: aJinBackStyle [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitBackThemeColorIndex: aJinBackThemeColorIndex [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitBackTint: aJinBackTint [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitBorderColor: aJinBorderColor [ 
]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitBorderLineStyle: aJinBorderLineStyle [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitBorderShade: aJinBorderShade [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitBorderStyle: aJinBorderStyle [ 	
]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitBorderThemeColorIndex: aJinBorderThemeColorIndex [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitBorderTint: aJinBorderTint [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitBorderWidth: aJinBorderWidth [ 
]

{ #category : #'visit - control' }
JinCasinoUIModelStatelessFactory >> visitCheckbox: aJinControlCheckbox [ 
	| input |
	input := CSNUIInputCheckbox new. 
	input name: aJinControlCheckbox nameWithoutSpaces.
	[input value: aJinControlCheckbox value.] on: Win32Error do: [ :e | e passIfNotError0x80020009  ].
	^ input 
]

{ #category : #'visit - control' }
JinCasinoUIModelStatelessFactory >> visitCombobox: aJinControlCombobox [
	| input |
	input := CSNUISelect new.
	input name: aJinControlCombobox nameWithoutSpaces.
	input value: aJinControlCombobox defaultValue.
	^ input
]

{ #category : #'visit - control' }
JinCasinoUIModelStatelessFactory >> visitCommandButton: aJinControlCommandButton [
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
JinCasinoUIModelStatelessFactory >> visitControlSource: aJinControlSource [ 
	self visitAccessProperty: aJinControlSource 
]

{ #category : #'visiting - properties' }
JinCasinoUIModelStatelessFactory >> visitControlType: aJinControlType [ 
	 self visitAccessProperty: aJinControlType
]

{ #category : #'as yet unclassified' }
JinCasinoUIModelStatelessFactory >> visitCustomControl: aJinControlGeneric [
	aJinControlGeneric type = 'OptionGroup'
		ifTrue: [ ^ nil ].
	aJinControlGeneric type = 'OptionButton'
		ifTrue: [ ^ nil ].
	(aJinControlGeneric handle propertyNamed: #OLEClass)
		= 'WMEBoutons020000.BoutonGenerique'
		ifTrue: [ | input |
			input := CSNUIButton new.
			input name: aJinControlGeneric nameWithoutSpaces.
			input
				addAttribute:
					(CSNUILabel new
						attributeValue: (aJinControlGeneric handle propertyNamed: 'ControlTipText');
						yourself).
			^ input ].
	(aJinControlGeneric handle propertyNamed: #OLEClass)
		= 'WMEBoutons020000.BoutonLibelle'
		ifTrue: [ | input |
			input := CSNUIButton new.
			input name: aJinControlGeneric nameWithoutSpaces.
			input
				addAttribute:
					(CSNUILabel new
						attributeValue: (aJinControlGeneric handle propertyNamed: 'Name');
						yourself).
			^ input ].
		
	(aJinControlGeneric handle propertyNamed: #OLEClass) = 	'Microsoft Web Browser' ifTrue: [ ^ nil ].
	(aJinControlGeneric handle propertyNamed: #OLEClass)
		= 'ImageComboCtl'
		ifTrue: [ ^ nil ].
	(aJinControlGeneric handle propertyNamed: #OLEClass) = 'TreeCtrl'
		ifTrue: [ ^ nil ].
	(aJinControlGeneric handle propertyNamed: #OLEClass)
		= 'ImageListCtrl'
		ifTrue: [ ^ nil ].
	self halt
]

{ #category : #'visiting - properties' }
JinCasinoUIModelStatelessFactory >> visitDatasheetCaption: aJinDatasheetCaption [
	aJinDatasheetCaption value
		ifNotEmpty: [ :val | 
			self halt. 
			^ CSNUILabel new
				attributeValue: val;
				yourself ]
]

{ #category : #'visiting - properties' }
JinCasinoUIModelStatelessFactory >> visitDecimalPlaces: aJinDecimalPlaces [
"	self assert: aJinDecimalPlaces value = 255."
	self visitAccessProperty: aJinDecimalPlaces 
]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitDisplayAsHyperlink: aJinDisplayAsHyperlink [ 

]

{ #category : #'visiting - properties' }
JinCasinoUIModelStatelessFactory >> visitEventProcPrefix: aJinEventProcPrefix [ 
	 self visitAccessProperty: aJinEventProcPrefix
]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitFontBold: aJinFontBold [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitFontItalic: aJinFontItalic [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitFontName: aJinFontName [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitFontSize: aJinFontSize [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitFontUnderline: aJinFontUnderline [ 
]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitFontWeight: aJinFontWeight [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitForeColor: aJinForeColor [ 
]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitForeShade: aJinForeShade [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitForeThemeColorIndex: aJinForeThemeColorIndex [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitForeTint: aJinForeTint [ 

]

{ #category : #'visiting - properties' }
JinCasinoUIModelStatelessFactory >> visitFormat: aJinFormat [ 
"	self assert: aJinFormat value = ''.
	self visitAccessProperty: aJinFormat "
]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitGridlineStyleBottom: aJinGridlineStyleBottom [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitGridlineStyleLeft: aJinGridlineStyleLeft [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitGridlineStyleRight: aJinGridlineStyleRight [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitGridlineStyleTop: aJinGridlineStyleTop [ 

]

{ #category : #'visiting - properties' }
JinCasinoUIModelStatelessFactory >> visitHeight: aJinHeight [
	^ CSNUIAbsoluteHeight new
		attributeValue:  (self toPixelSize: aJinHeight  value);
		name: #height;
		yourself
]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitHyperlinkTarget: aJinHyperlinkTarget [ 

]

{ #category : #'visit - control' }
JinCasinoUIModelStatelessFactory >> visitImage: aJinControlImage [
	| input |
	input := CSNUIImage new.
	input name: aJinControlImage nameWithoutSpaces.
	
	^ input
]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitIsHyperlink: aJinIsHyperlink [ 

]

{ #category : #'visit - control' }
JinCasinoUIModelStatelessFactory >> visitLabel: aJinControlLabel [
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
JinCasinoUIModelStatelessFactory >> visitLabelName: aJinLabelName [

]

{ #category : #'visiting - properties' }
JinCasinoUIModelStatelessFactory >> visitLeft: aJinLeft [
	^ CSNUILeft new
		attributeValue: (self toPixelSize: aJinLeft value);
		name: #left;
		yourself
]

{ #category : #'visit - control' }
JinCasinoUIModelStatelessFactory >> visitLine: aJinControlLine [ 
"	self error: 'There is no widget for Line yet. '"
	^ nil
]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitLineSpacing: aJinLineSpacing [ 
]

{ #category : #'visit - control' }
JinCasinoUIModelStatelessFactory >> visitListBox: aJinControlListBox [
	| input |
	input := CSNUIOrderedList new.
	input name: aJinControlListBox nameWithoutSpaces.
	^ input
]

{ #category : #'visiting - properties' }
JinCasinoUIModelStatelessFactory >> visitName: aJinName [
	self visitAccessProperty: aJinName
]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitOldBorderStyle: aJinOldBorderStyle [ 

]

{ #category : #'visit - control' }
JinCasinoUIModelStatelessFactory >> visitPage: aJinControlPage [
	| input |
	input := CSNUITab new.
	input name: aJinControlPage nameWithoutSpaces.
	^ input
]

{ #category : #'visit - control' }
JinCasinoUIModelStatelessFactory >> visitRectangle: aJinControlRectangle [
	| input |
	input := CSNUIPanel new.
	input name: aJinControlRectangle nameWithoutSpaces.
	^ input
]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitScrollBars: aJinScrollBars [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitShowDatePicker: aJinShowDatePicker [ 
	" this property is used during the building of the text box. nothing to do here "

]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitSpecialEffect: aJinSpecialEffect [ 

]

{ #category : #'visit - control' }
JinCasinoUIModelStatelessFactory >> visitSubForm: aJinControlSubForm [
	| input |
	input := CSNUIFieldset new.
	input name: aJinControlSubForm nameWithoutSpaces.
	^ input
]

{ #category : #'visit - control' }
JinCasinoUIModelStatelessFactory >> visitTabControl: aJinControlTabControl [
	| input |
	input := CSNUITabManager new.
	input name: aJinControlTabControl nameWithoutSpaces.
	^ input
]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitTextAlign: aJinTextAlign [ 

]

{ #category : #'not -yet -implemented' }
JinCasinoUIModelStatelessFactory >> visitTextFontCharSet: aJinTextFontCharSet [ 

]

{ #category : #'visiting - properties' }
JinCasinoUIModelStatelessFactory >> visitTextFormat: aJinTextFormat [
"	self assert: aJinTextFormat value = 0."
	self visitAccessProperty: aJinTextFormat
]

{ #category : #'visit - control' }
JinCasinoUIModelStatelessFactory >> visitTextbox: aJinControlTextbox [
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
JinCasinoUIModelStatelessFactory >> visitThemeFontIndex: aJinThemeFontIndex [ 

]

{ #category : #'visiting - properties' }
JinCasinoUIModelStatelessFactory >> visitTop: aJinTop [
	^ CSNUITop new
		attributeValue: (self toPixelSize: aJinTop value);
		name:#top;
		yourself
]

{ #category : #'visiting - properties' }
JinCasinoUIModelStatelessFactory >> visitVisible: aJinVisible [
	aJinVisible value
		ifTrue: [ ^ self visitAccessProperty: aJinVisible ].
	"^ CSNUIVisibility new
		name: #hidden;
		attributeValue: true;
		yourself"
]

{ #category : #'visiting - properties' }
JinCasinoUIModelStatelessFactory >> visitWidth: aJinWidth [
	^ CSNUIAbsoluteWidth new
		attributeValue: (self toPixelSize: aJinWidth value);
		name: #width;
		yourself
]

{ #category : #'as yet unclassified' }
JinCasinoUIModelStatelessFactory >> warn: text [
	Warning signal: text
]

{ #category : #accessing }
JinCasinoUIModelStatelessFactory >> width: aJinControlCheckbox [ 
	^ CSNUIAbsoluteWidth new
		attributeValue: aJinControlCheckbox width;
		yourself
]
