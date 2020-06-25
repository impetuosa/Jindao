Class {
	#name : #JinForm,
	#superclass : #JinVBObject,
	#category : #'Jindao-Core'
}

{ #category : #accessing }
JinForm class >> propertiesToInfuse [
	^ #(AfterDelConfirm
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
Application
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
Controls
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
Form
FrozenColumns
GridX
GridY
HasModule
HelpContextId
HelpFile
HorizontalDatasheetGridlineStyle
Hwnd
InputParameters
InsideHeight
InsideWidth
KeyPreview
LayoutForPrint
MaxRecButton
MaxRecords
MenuBar
MinMaxButtons
Modal
Module
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
Printer
Properties
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
JinForm >> code [
	^ self body code
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
JinForm >> module [
	^ self body module
]

{ #category : #accessing }
JinForm >> privateLoadBodyObject [
	^ (project openForm: self)
]

{ #category : #'as yet unclassified' }
JinForm >> propertiesToInfuse [
	^ self class propertiesToInfuse
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
