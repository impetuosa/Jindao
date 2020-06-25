Class {
	#name : #JinReport,
	#superclass : #JinForm,
	#category : #'Jindao-Core'
}

{ #category : #accessing }
JinReport class >> propertiesToInfuse [
	^ #(
    ActiveControl
    AllowLayoutView
    AllowReportView
    AutoCenter
    AutoResize
    BorderStyle
    Caption
    CloseButton
    ControlBox
    Controls
    Count
    CurrentRecord
    CurrentView
    CurrentX
    CurrentY
    Cycle
    DateGrouping
    DefaultControl
    DefaultView
    Dirty
    DisplayOnSharePointSite
    DrawMode
    DrawStyle
    DrawWidth
    FastLaserPrinting
    FillColor
    FillStyle
    Filter
    FilterOn
    FilterOnLoad
    FitToPage
    FontBold
    FontItalic
    FontName
    FontSize
    FontUnderline
    ForeColor
    FormatCount
    GridX
    GridY
    GroupLevel
    GrpKeepTogether
    HasData
    HasModule
    Height
    HelpContextId
    HelpFile
    Hwnd
    InputParameters
    KeyPreview
    LayoutForPrint
    Left
    MenuBar
    MinMaxButtons
    Modal
    Module
    MouseWheel
    Moveable
    MoveLayout
    Name
    NextRecord
    OnActivate
    OnApplyFilter
    OnClick
    OnClose
    OnCurrent
    OnDblClick
    OnDeactivate
    OnError
    OnFilter
    OnGotFocus
    OnKeyDown
    OnKeyPress
    OnKeyUp
    OnLoad
    OnLostFocus
    OnMouseDown
    OnMouseMove
    OnMouseUp
    OnNoData
    OnOpen
    OnPage
    OnResize
    OnTimer
    OnUnload
    OpenArgs
    OrderBy
    OrderByOn
    OrderByOnLoad
    Orientation
    Page
    PageFooter
    PageHeader
    Pages
    Painting
    PaintPalette
    PaletteSource
    Parent
    Picture
    PictureAlignment
    PictureData
    PicturePages
    PicturePalette
    PictureSizeMode
    PictureTiling
    PictureType
    PopUp
    PrintCount
    Printer
    PrintSection
    Properties
    PrtDevMode
    PrtDevNames
    PrtMip
    RecordLocks
    Recordset
    RecordSource
    RecordSourceQualifier
    Report
    RibbonName
    ScaleHeight
    ScaleLeft
    ScaleMode
    ScaleTop
    ScaleWidth
    ScrollBars
    Section
    ServerFilter
    Shape
    ShortcutMenuBar
    ShowPageMargins
    Tag
    TimerInterval
    Toolbar
    Top
    UseDefaultPrinter
    Visible
    Width
    WindowHeight
    WindowLeft
    WindowTop
    WindowWidth
)
]

{ #category : #accessing }
JinReport class >> typeNumber [
	^ 3
]

{ #category : #'as yet unclassified' }
JinReport >> acceptVisitor: aVisitor [
	aVisitor visitReport: self 
]

{ #category : #'as yet unclassified' }
JinReport >> addGroupLevel: anExpression header: aBoolean footer: anOtherBoolean [
	^ project
		createGroupLevel: self
		expression: anExpression
		header: aBoolean
		footer: anOtherBoolean
]

{ #category : #'as yet unclassified' }
JinReport >> createControl: aName type: aTypeNumber section: aSection [
	^ project
		createControl: aName
		inReport: self 
		type: aTypeNumber
		section: aSection
]

{ #category : #'as yet unclassified' }
JinReport >> groupLevelNumber: anInteger [ 
	^ self body groupLevelNumber: anInteger 
]

{ #category : #'as yet unclassified' }
JinReport >> groupLevels [
	^ self body groupLevels 
]

{ #category : #'as yet unclassified' }
JinReport >> installHeaderFooter [
	^ project installReportHeaderFooterOn: self
]

{ #category : #'as yet unclassified' }
JinReport >> name: aString [ 
	description name: aString 
]

{ #category : #accessing }
JinReport >> privateLoadBodyObject [
	^ (project openReport: self)
]

{ #category : #'as yet unclassified' }
JinReport >> vbeComponentName [
	^ 'Report_' , self name
]
