"
I am a form. 
"
Class {
	#name : #JinForm,
	#superclass : #JinVBObject,
	#instVars : [
		'src',
		'documentedProperties'
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

{ #category : #visiting }
JinForm >> acceptVisitor: aVisitor [
	aVisitor visitForm: self.
	
]

{ #category : #visiting }
JinForm >> allowAdditions [

	<doc:
	' Responds if the form allows to add information into a bound table'>
	^ self body allowAdditions
]

{ #category : #visiting }
JinForm >> allowDeletions [
	<doc:' Responds if the form allows to delete information from a bound table'>
	^ self body allowDeletions
]

{ #category : #visiting }
JinForm >> allowEdits [

	<doc:
	' Responds if the form allows to modify information from a bound table'>
	^ self body allowEdits
]

{ #category : #visiting }
JinForm >> allowFilters [

	<doc:
	' Responds if the form allows to filter information from a bound table'>
	^ self body allowFilters
]

{ #category : #ast }
JinForm >> ast [

	<doc: 'Returns a VBParser AST of the module, if it has one.'>
	^ self hasModule ifTrue: [ self code ast ]
]

{ #category : #visiting }
JinForm >> children [

	| controls |
	self close.
	controls := self controls collect: [ :c | c yourself ].
	^ controls
]

{ #category : #visiting }
JinForm >> code [
	<doc: 'Returns source of the module, if it has one.'>
	^ self body code
]

{ #category : #visiting }
JinForm >> componentKnownProperties [
	^ self class componentKnownProperties
]

{ #category : #visiting }
JinForm >> contentHash [

	| code |
	[code := self src, self controls asString] on: Error do: [  code:= self name  ].

	^ (MD5 hashMessage: 'Report|Form' ,  code)
		  hex
]

{ #category : #visiting }
JinForm >> controls [

	<doc: 'Returns all the controls defined in the form'>
	^ self body controls
]

{ #category : #visiting }
JinForm >> createControl: aName type: aTypeNumber section: aSection [

	<doc:
	'[https://learn.microsoft.com/en-us/office/vba/api/access.application.createcontrol](https://learn.microsoft.com/en-us/office/vba/api/access.application.createcontrol) Creates a control inside the form. '>
	^ project
		  createControl: aName
		  inForm: self
		  type: aTypeNumber
		  section: aSection
]

{ #category : #visiting }
JinForm >> createControl: aName type: aTypeNumber section: aSection parent: aParentName [
	<doc:
	'[https://learn.microsoft.com/en-us/office/vba/api/access.application.createcontrol](https://learn.microsoft.com/en-us/office/vba/api/access.application.createcontrol) Creates a control inside the form with a specific parent. '>
	^ project
		createControl: aName
		inForm: self
		type: aTypeNumber
		section: aSection
		parent: aParentName
]

{ #category : #visiting }
JinForm >> description [
	^ description
]

{ #category : #visiting }
JinForm >> documentedProperties [

	^ documentedProperties ifNil: [ 
		  documentedProperties := self componentKnownProperties collect: [ 
			                          :p | 
			                          JinAccessFormFastProperty new
				                          accessObject: self body ;
				                          name: p;
				                          yourself ] ]
]

{ #category : #visiting }
JinForm >> ensureItHasNonPageHeaderFooter [
	^ project ensureItHasNonPageHeaderFooter: self 
]

{ #category : #visiting }
JinForm >> formType [

	<doc:
	'Returns the type #(SingleForm ContinuousForm Datasheet PivotTable PivotChart SplitForm) '>
	^ self body formType
]

{ #category : #visiting }
JinForm >> handle [
	self shouldBeImplemented.
]

{ #category : #visiting }
JinForm >> hasHeaderFooter [
	^ self body hasHeaderFooter
]

{ #category : #visiting }
JinForm >> hasModule [
	^ self body hasModule
]

{ #category : #visiting }
JinForm >> hasModule: aValue [
	^ self body hasModule: aValue
]

{ #category : #visiting }
JinForm >> hasPageHeaderFooter [
	^ self body hasPageHeaderFooter
]

{ #category : #visiting }
JinForm >> height [
	^ self body height 
]

{ #category : #visiting }
JinForm >> height: anInteger [
	self body height: anInteger
]

{ #category : #visiting }
JinForm >> installHeaderFooter [

	<doc: 'Installs a header and footer on this form'>
	^ project installHeaderFooterOn: self
]

{ #category : #visiting }
JinForm >> installPageHeaderFooter [

	<doc: 'Installs a PAGE header and footer on this form'>
	^ project ensurePageHeaderFooter: self
]

{ #category : #visiting }
JinForm >> isAccessForm [
	^ true
]

{ #category : #visiting }
JinForm >> isReferredBySymbol: aJinNSNameEntry [

	^ aJinNSNameEntry kind isForm and: [ 
		  aJinNSNameEntry referersTo: self name ]
]

{ #category : #visiting }
JinForm >> isSingleForm [
	^ self body isSingleForm
]

{ #category : #visiting }
JinForm >> module [
	^ self body module
]

{ #category : #accessing }
JinForm >> privateLoadBodyObject [
	^ project openForm: self
]

{ #category : #visiting }
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

{ #category : #visiting }
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

{ #category : #visiting }
JinForm >> sourceCode [

	^ self hasModule
		  ifFalse: [ '' ]
		  ifTrue: [ self code contents ]
]

{ #category : #visiting }
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

{ #category : #visiting }
JinForm >> width [

	<doc: 'Gets the width of the widget. '>
	^ self body width
]

{ #category : #visiting }
JinForm >> width: anInteger [

	<doc: 'Sets the width of the widget. '>
	self body width: anInteger
]
