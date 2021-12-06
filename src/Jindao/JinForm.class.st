"
I am a form. 
"
Class {
	#name : #JinForm,
	#superclass : #JinVBObject,
	#instVars : [
		'src'
	],
	#category : #'Jindao-Core'
}

{ #category : #accessing }
JinForm class >> componentKnownProperties [
	^ #(
TabularCharSet	
AfterDelConfirm
AfterFinalRender
AfterInsert
AfterLayout
AfterRender
AfterUpdate
AllowAdditions
AllowDatasheetView
AllowDeletions
AllowEdits
AllowFilters
AllowFormView
AllowLayoutView
AllowPivotChartView
AllowPivotTableView
AutoCenter
AutoResize
BeforeDelConfirm
BeforeInsert
BeforeQuery
BeforeRender
BeforeScreenTip
BeforeUpdate
Bookmark
BorderStyle
Caption
ChartSpace
CloseButton
CommandBeforeExecute
CommandChecked
CommandEnabled
CommandExecute
ControlBox
Count
CurrentRecord
CurrentSectionLeft
CurrentSectionTop
CurrentView
Cycle
DataChange
DataEntry
DataSetChange
DatasheetAlternateBackColor
DatasheetBackColor
DatasheetBorderLineStyle
DatasheetCellsEffect
DatasheetColumnHeaderUnderlineStyle
DatasheetFontHeight
DatasheetFontItalic
DatasheetFontName
DatasheetFontUnderline
DatasheetFontWeight
DatasheetForeColor
DatasheetGridlinesBehavior
DatasheetGridlinesColor
DefaultControl
DefaultView
Dirty
DisplayOnSharePointSite
DividingLines
FastLaserPrinting
FetchDefaults
Filter
FilterOn
FilterOnLoad
FitToScreen
FrozenColumns
GridX
GridY
HasModule
HelpContextId
HelpFile
HorizontalDatasheetGridlineStyle
Hwnd
InputParameters
KeyPreview
LayoutForPrint
MaxRecButton
MaxRecords
MenuBar
MinMaxButtons
Modal
MouseWheel
Moveable
Name
NavigationButtons
NavigationCaption
NewRecord
OnActivate
OnApplyFilter
OnClick
OnClose
OnConnect
OnCurrent
OnDblClick
OnDeactivate
OnDelete
OnDirty
OnDisconnect
OnError
OnFilter
OnGotFocus
OnInsert
OnKeyDown
OnKeyPress
OnKeyUp
OnLoad
OnLostFocus
OnMouseDown
OnMouseMove
OnMouseUp
OnOpen
OnResize
OnTimer
OnUndo
OnUnload
'OnClickMacro' 'OnCloseMacro' 'OnConnectMacro' 'OnCurrentMacro' 'OnDblClickMacro' 'OnDeactivateMacro' 'OnDeleteMacro' 'OnDirtyMacro' 'OnDisconnectMacro' 'OnErrorMacro' 'OnFilterMacro' 'OnGotFocusMacro' 'OnKeyDownMacro' 'OnKeyPressMacro' 'OnKeyUpMacro' 'OnLoadMacro' 'OnLostFocusMacro' 'OnMouseDownMacro' 'OnMouseMoveMacro' 'OnMouseUpMacro' 'OnOpenMacro' 'OnResizeMacro' 'OnTimerMacro' 'OnUndoMacro' 'OnUnloadMacro'
OpenArgs
OrderBy
OrderByOn
OrderByOnLoad
Orientation
Page
Pages
Painting
PaintPalette
PaletteSource
Parent
Picture
PictureAlignment
PictureData
PicturePalette
PictureSizeMode
PictureTiling
PictureType
PivotTable
PivotTableChange
PopUp
PrtDevMode
PrtDevNames
PrtMip
Query
RecordLocks
RecordSelectors
Recordset
RecordsetClone
RecordsetType
RecordSource
RecordSourceQualifier
ResyncCommand
RibbonName
RowHeight
ScrollBars
Section
SelectionChange
SelHeight
SelLeft
SelTop
SelWidth
ServerFilter
ServerFilterByForm
ShortcutMenu
ShortcutMenuBar
SplitFormDatasheet
SplitFormOrientation
SplitFormPrinting
SplitFormSize
SplitFormSplitterBar
SplitFormSplitterBarSave
SubdatasheetExpanded
SubdatasheetHeight
Tag
TimerInterval
Toolbar
UniqueTable
UseDefaultPrinter
VerticalDatasheetGridlineStyle
ViewChange
ViewsAllowed
Visible
Width
WindowHeight
WindowLeft
WindowTop
WindowWidth)
]

{ #category : #accessing }
JinForm class >> formTypeEnum [
	"Single Form 	0 	(Default) Displays one record at a time.
Continuous Forms 	1 	Displays multiple records (as many as will fit in the current window), each in its own copy of the form's detail section.
Datasheet 	2 	Displays the form fields arranged in rows and columns like a spreadsheet.
PivotTable 	3 	Displays the form as a PivotTable.
PivotChart 	4 	Displays the form as a PivotChart.
Split Form 	5"

	^ #(SingleForm ContinuousForm Datasheet PivotTable PivotChart SplitForm)
]

{ #category : #accessing }
JinForm class >> typeNumber [
	^ 2
]

{ #category : #'as yet unclassified' }
JinForm >> acceptVisitor: aVisitor [
	aVisitor visitForm: self.
	
]

{ #category : #'as yet unclassified' }
JinForm >> addControl: aJinLabel [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
JinForm >> allowAdditions [
	^ self body allowAdditions
]

{ #category : #'as yet unclassified' }
JinForm >> allowDeletions [
	^ self body allowDeletions
]

{ #category : #'as yet unclassified' }
JinForm >> allowEdits [
	^ self body allowEdits
]

{ #category : #'as yet unclassified' }
JinForm >> allowFilters [
	^ self body allowFilters
]

{ #category : #ast }
JinForm >> ast [

	^ self hasModule ifTrue: [ self code ast ]
]

{ #category : #'as yet unclassified' }
JinForm >> children [

	| controls |
	self close.
	controls := self controls collect: [ :c | c yourself ].
	^ controls
]

{ #category : #'as yet unclassified' }
JinForm >> code [
	^ self body code
]

{ #category : #'as yet unclassified' }
JinForm >> componentKnownProperties [
	^ self class componentKnownProperties
]

{ #category : #'as yet unclassified' }
JinForm >> contentHash [

	| code |
	[code := self src, self controls asString] on: Error do: [  code:= self name  ].

	^ (MD5 hashMessage: 'Report|Form' ,  code)
		  hex
]

{ #category : #'as yet unclassified' }
JinForm >> controls [
	^ self body controls 
]

{ #category : #'as yet unclassified' }
JinForm >> createControl: aName type: aTypeNumber section: aSection [
	^ project
		createControl: aName
		inForm: self 
		type: aTypeNumber
		section: aSection
]

{ #category : #'as yet unclassified' }
JinForm >> createControl: aName type: aTypeNumber section: aSection parent: aParentName [
	^ project
		createControl: aName
		inForm: self
		type: aTypeNumber
		section: aSection
		parent: aParentName
]

{ #category : #'as yet unclassified' }
JinForm >> description [
	^ description
]

{ #category : #'as yet unclassified' }
JinForm >> ensureItHasNonPageHeaderFooter [
	^ project ensureItHasNonPageHeaderFooter: self 
]

{ #category : #'as yet unclassified' }
JinForm >> formType [
	^ self body formType 
]

{ #category : #'as yet unclassified' }
JinForm >> handle [
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
JinForm >> hasHeaderFooter [
	^ self body hasHeaderFooter
]

{ #category : #'as yet unclassified' }
JinForm >> hasModule [
	^ self body hasModule
]

{ #category : #'as yet unclassified' }
JinForm >> hasModule: aValue [
	^ self body hasModule: aValue
]

{ #category : #'as yet unclassified' }
JinForm >> hasPageHeaderFooter [
	^ self body hasPageHeaderFooter
]

{ #category : #'as yet unclassified' }
JinForm >> height [
	^ self body height 
]

{ #category : #'as yet unclassified' }
JinForm >> height: anInteger [
	self body height: anInteger
]

{ #category : #'as yet unclassified' }
JinForm >> installHeaderFooter [
	^ project installHeaderFooterOn: self
]

{ #category : #'as yet unclassified' }
JinForm >> installPageHeaderFooter [
	^ project ensurePageHeaderFooter: self 
]

{ #category : #'as yet unclassified' }
JinForm >> isAccessForm [
	^ true
]

{ #category : #'as yet unclassified' }
JinForm >> isSingleForm [
	^ self body isSingleForm
]

{ #category : #'as yet unclassified' }
JinForm >> module [
	^ self body module
]

{ #category : #accessing }
JinForm >> privateLoadBodyObject [
	^ project openForm: self
]

{ #category : #'as yet unclassified' }
JinForm >> recordSource [
	| source |
	source := self body recordSource trimBoth.
	source ifEmpty: [ ^ nil ].
	^ (source includesSubstring: 'select' caseSensitive: false)
		ifTrue: [ ^ nil ]
		ifFalse: [ project tables
				detect: [ :t | t name = source ]
				ifNone: [ project queries detect: [ :q | q name = source ] ] ]
]

{ #category : #'as yet unclassified' }
JinForm >> recordSourceFull [
	| source |
	source := self body recordSource trimBoth.
	source ifEmpty: [ ^ nil ].
	^ (source includesSubstring: 'select' caseSensitive: false)
		ifTrue: [ ^ source ]
		ifFalse: [ project tables
				detect: [ :t | t name includesSubstring: source caseSensitive: false ]
				ifNone: [ project queries
						detect: [ :q | q name includesSubstring: source caseSensitive: false ]
						ifNone: [ nil ] ] ]
]

{ #category : #'as yet unclassified' }
JinForm >> sourceCode [

	^ self hasModule
		  ifFalse: [ '' ]
		  ifTrue: [ self code contents ]
]

{ #category : #'as yet unclassified' }
JinForm >> src [

	^ src ifNil: [ 
		  src := self body code.
		  src = '' ifFalse: [ src := src contents ].
		  src ]
]

{ #category : #accessing }
JinForm >> vbeComponentName [
	^ 'Form_' , self name
]

{ #category : #'as yet unclassified' }
JinForm >> width [
	^ self body width
]

{ #category : #'as yet unclassified' }
JinForm >> width: anInteger [
	self body width: anInteger
]
