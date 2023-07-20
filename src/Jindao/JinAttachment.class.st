"
---
title: Attachment object (Access)
keywords: vbaac10.chm14036
f1_keywords:
- vbaac10.chm14036
ms.prod: access
api_name:
- Access.Attachment
ms.assetid: b0756145-9012-f9b9-7df9-e168defed3bf
ms.date: 02/07/2019
localization_priority: Normal
---


# Attachment object (Access)

This object corresponds to an attachment control. Use an attachment control when you want to manipulate the contents fields of the attachment data type.


## Remarks

> [!NOTE] 
> You can attach files only to databases that you create in Office Access 2007 and later and that use the new .accdb file format. You cannot share attachments between an Office Access 2007 (.accdb) database and a database in the earlier (.mdb) file format.

You can attach a maximum of two gigabytes of data (the maximum size for an Access database). Individual files cannot exceed 256 megabytes in size.


### Supported image file formats

Office Access 2007 and later support the following graphic file formats natively, meaning the attachment control renders them without the need for additional software.

- BMP (Windows Bitmap)   
- RLE (Run Length Encoded Bitmap)   
- DIB (Device Independent Bitmap)    
- GIF (Graphics Interchange Format)    
- JPEG, JPG, JPE (Joint Photographic Experts Group)    
- EXIF (Exchangeable File Format)    
- PNG (Portable Network Graphics)    
- TIFF, TIF (Tagged Image File Format)    
- ICON, ICO (Icon)    
- WMF (Windows Metafile)    
- EMF (Enhanced Metafile)
    

### Supported formats for documents and other files

As a rule, you can attach any file that was created with one of the 2007 Microsoft Office or later system programs. You can also attach log files (.log), text files (.text, .txt), and compressed .zip files.


### File-naming conventions

The names of your attached files can contain any Unicode character supported by the NTFS file system used in Microsoft Windows NT (NTFS). In addition, file names must conform to these guidelines:

- Names must not exceed 255 characters, including the file name extensions.
    
- Names cannot contain the following characters: question marks (?), quotation marks (""), forward or backward slashes (/ \\), opening or closing brackets (< >), asterisks (*), vertical bars or pipes ( | ), colons ( : ), or paragraph marks.
    

### Types of files that Access compresses

Access will compress your attached files unless those files are compressed natively. For example, JPEG files are compressed by the graphics program that created them, so Access does not compress them. The following table lists some supported file types and whether or not Access compresses them.

|File extension|Compressed?|Reason|
|:-----|:-----|:-----|
|.jpg, .jpeg|No|Already compressed|
|.gif|No|Already compressed|
|.png|No|Already compressed|
|.tif, .tiff|Yes||
|.exif|Yes||
| .bmp|Yes||
|.emf|Yes||
|.wmf|Yes||
|.ico|Yes||
|.zip|No|Already compressed|
|.cab|No|Already compressed|
|.docx|No|Already compressed|
|.xlsx|No|Already compressed|
|.xlsb|No|Already compressed|
|.pptx|No|Already compressed|

### Blocked file formats

Office Access 2007 blocks the following types of attached files. At this time, you cannot unblock any of the file types listed here.

|||||
|:-----|:-----|:-----|:-----|
|.ade|.ins|.mda|.scr|
|.adp|.isp|.mdb|.sct|
|.app|.its|.mde|.shb|
|.asp|.js |.mdt|.shs|
|.bas|.jse|.mdw|.tmp|
|.bat|.ksh|.mdz|.url|
|.cer|.lnk|.msc|.vb|
|.chm|.mad|.msi|.vbe|
|.cmd|.maf|.msp|.vbs|
|.com|.mag|.mst|.vsmacros|
|.cpl|.mam|.ops|.vss|
|.crt|.maq|.pcd|.vst|
|.csh|.mar|.pif|.vsw|
|.exe|.mas|.prf|.ws|
|.fxp|.mat|.prg|.wsc|
|.hlp|.mau|.pst|.wsf|
|.hta|.mav|.reg|.wsh|
|.inf|.maw|.scf||


"
Class {
	#name : #JinAttachment,
	#superclass : #JinControlAbstractAttachment,
	#category : #'Jindao-FormControls-Builtin'
}

{ #category : #'as yet unclassified' }
JinAttachment class >> componentKnownProperties [
^#(
    AddColon
    AfterUpdate
    AttachmentCount
    AutoLabel
    BackColor
    BackShade
    BackStyle
    BackThemeColorIndex
    BackTint
    BeforeUpdate
	AfterUpdateMacro
	 BeforeUpdateMacro
    BorderColor
    BorderShade
    BorderStyle
    BorderThemeColorIndex
    BorderTint
    BorderWidth
    BottomPadding
    ColumnHidden
    ColumnOrder
    ColumnWidth
    ControlSource
    ControlTipText
    ControlType
    CurrentAttachment
    DefaultPicture
    DefaultPictureType
    DisplayAs
    DisplayWhen
    Enabled
    EventProcPrefix
    FileName
    FileType
    FileURL
    GridlineColor
    GridlineShade
    GridlineStyleBottom
    GridlineStyleLeft
    GridlineStyleRight
    GridlineStyleTop
    GridlineThemeColorIndex
    GridlineTint
    GridlineWidthBottom
    GridlineWidthLeft
    GridlineWidthRight
    GridlineWidthTop
    Height
    HelpContextId
    HorizontalAnchor
    InSelection
    IsVisible
    LabelAlign
    LabelX
    LabelY
    Layout
    LayoutID
    Left
    LeftPadding
    Locked
    Name
    OldBorderStyle
    OldValue
    OnAttachmentCurrent
    OnChange
    OnClick
    OnDblClick
    OnDirty
    OnEnter
    OnExit
    OnGotFocus
    OnKeyDown
    OnKeyPress
    OnKeyUp
    OnLostFocus
    OnMouseDown
    OnMouseMove
    OnMouseUp
'OnAttachmentCurrentMacro' 'OnChangeMacro' 'OnClickMacro' 'OnDblClickMacro' 'OnDirtyMacro' 'OnEnterMacro' 'OnExitMacro' 'OnGotFocusMacro' 'OnKeyDownMacro' 'OnKeyPressMacro' 'OnKeyUpMacro' 'OnLostFocusMacro' 'OnMouseDownMacro' 'OnMouseMoveMacro' 'OnMouseUpMacro'
    PictureAlignment
    PictureSizeMode
    PictureTiling
    RightPadding
    Section
    ShortcutMenuBar
    SpecialEffect
    StatusBarText
    TabIndex
    TabStop
    Tag
    Top
    TopPadding
    VerticalAnchor
    Visible
    Width
)
]

{ #category : #generated }
JinAttachment class >> mappedTypeName [
	^#'_Attachment'
]

{ #category : #generated }
JinAttachment >> acceptVisitor: aVisitor [

	<doc: 'Accepts visitor'>
	^ aVisitor visitAttachment: self
]

{ #category : #'property - generated' }
JinAttachment >> addColon [
<getter>
	^ (handle propertyNamed: #'AddColon' ).

]

{ #category : #'property - generated' }
JinAttachment >> addColon: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AddColon' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> application [
<getter>
	^ (handle propertyNamed: #'Application' ).

]

{ #category : #'property - generated' }
JinAttachment >> attachmentCount [
<getter>
	^ (handle propertyNamed: #'AttachmentCount' ).

]

{ #category : #'property - generated' }
JinAttachment >> autoLabel [
<getter>
	^ (handle propertyNamed: #'AutoLabel' ).

]

{ #category : #'property - generated' }
JinAttachment >> autoLabel: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AutoLabel' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinAttachment >> back [
<method>
	^ (handle dispatch: #'Back' ).

]

{ #category : #'property - generated' }
JinAttachment >> backColor [
<getter>
	^ (handle propertyNamed: #'BackColor' ).

]

{ #category : #'property - generated' }
JinAttachment >> backColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> backShade [
<getter>
	^ (handle propertyNamed: #'BackShade' ).

]

{ #category : #'property - generated' }
JinAttachment >> backShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> backStyle [
<getter>
	^ (handle propertyNamed: #'BackStyle' ).

]

{ #category : #'property - generated' }
JinAttachment >> backStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> backThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'BackThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinAttachment >> backThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> backTint [
<getter>
	^ (handle propertyNamed: #'BackTint' ).

]

{ #category : #'property - generated' }
JinAttachment >> backTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> borderColor [
<getter>
	^ (handle propertyNamed: #'BorderColor' ).

]

{ #category : #'property - generated' }
JinAttachment >> borderColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> borderShade [
<getter>
	^ (handle propertyNamed: #'BorderShade' ).

]

{ #category : #'property - generated' }
JinAttachment >> borderShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> borderStyle [
<getter>
	^ (handle propertyNamed: #'BorderStyle' ).

]

{ #category : #'property - generated' }
JinAttachment >> borderStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> borderThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'BorderThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinAttachment >> borderThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> borderTint [
<getter>
	^ (handle propertyNamed: #'BorderTint' ).

]

{ #category : #'property - generated' }
JinAttachment >> borderTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> borderWidth [
<getter>
	^ (handle propertyNamed: #'BorderWidth' ).

]

{ #category : #'property - generated' }
JinAttachment >> borderWidth: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderWidth' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> bottomPadding [
<getter>
	^ (handle propertyNamed: #'BottomPadding' ).

]

{ #category : #'property - generated' }
JinAttachment >> bottomPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BottomPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> columnHidden [
<getter>
	^ (handle propertyNamed: #'ColumnHidden' ).

]

{ #category : #'property - generated' }
JinAttachment >> columnHidden: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ColumnHidden' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> columnOrder [
<getter>
	^ (handle propertyNamed: #'ColumnOrder' ).

]

{ #category : #'property - generated' }
JinAttachment >> columnOrder: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ColumnOrder' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> columnWidth [
<getter>
	^ (handle propertyNamed: #'ColumnWidth' ).

]

{ #category : #'property - generated' }
JinAttachment >> columnWidth: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ColumnWidth' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> controlSource [
<getter>
	^ (handle propertyNamed: #'ControlSource' ).

]

{ #category : #'property - generated' }
JinAttachment >> controlSource: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlSource' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> controlTipText [
<getter>
	^ (handle propertyNamed: #'ControlTipText' ).

]

{ #category : #'property - generated' }
JinAttachment >> controlTipText: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlTipText' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> controlType [
<getter>
	^ (handle propertyNamed: #'ControlType' ).

]

{ #category : #'property - generated' }
JinAttachment >> controlType: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlType' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> controls [
<getter>
	^ (handle propertyNamed: #'Controls' ).

]

{ #category : #'property - generated' }
JinAttachment >> currentAttachment [
<getter>
	^ (handle propertyNamed: #'CurrentAttachment' ).

]

{ #category : #'property - generated' }
JinAttachment >> currentAttachment: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'CurrentAttachment' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> defaultPicture [
<getter>
	^ (handle propertyNamed: #'DefaultPicture' ).

]

{ #category : #'property - generated' }
JinAttachment >> defaultPicture: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DefaultPicture' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> defaultPictureType [
<getter>
	^ (handle propertyNamed: #'DefaultPictureType' ).

]

{ #category : #'property - generated' }
JinAttachment >> defaultPictureType: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DefaultPictureType' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> displayAs [
<getter>
	^ (handle propertyNamed: #'DisplayAs' ).

]

{ #category : #'property - generated' }
JinAttachment >> displayAs: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DisplayAs' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> displayWhen [
<getter>
	^ (handle propertyNamed: #'DisplayWhen' ).

]

{ #category : #'property - generated' }
JinAttachment >> displayWhen: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DisplayWhen' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> enabled [
<getter>
	^ (handle propertyNamed: #'Enabled' ).

]

{ #category : #'property - generated' }
JinAttachment >> enabled: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Enabled' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> eventProcPrefix [
<getter>
	^ (handle propertyNamed: #'EventProcPrefix' ).

]

{ #category : #'property - generated' }
JinAttachment >> eventProcPrefix: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'EventProcPrefix' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> fileName: aVar [
<getter>
"This method can be called with optional parameters. var"
	^ (handle propertyNamed: #'FileName' withArguments: {aVar} ).

]

{ #category : #'property - generated' }
JinAttachment >> fileType: aVar [
<getter>
"This method can be called with optional parameters. var"
	^ (handle propertyNamed: #'FileType' withArguments: {aVar} ).

]

{ #category : #'property - generated' }
JinAttachment >> fileURL: aVar [
<getter>
"This method can be called with optional parameters. var"
	^ (handle propertyNamed: #'FileURL' withArguments: {aVar} ).

]

{ #category : #'method - generated' }
JinAttachment >> forward [
<method>
	^ (handle dispatch: #'Forward' ).

]

{ #category : #'property - generated' }
JinAttachment >> gridlineColor [
<getter>
	^ (handle propertyNamed: #'GridlineColor' ).

]

{ #category : #'property - generated' }
JinAttachment >> gridlineColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> gridlineShade [
<getter>
	^ (handle propertyNamed: #'GridlineShade' ).

]

{ #category : #'property - generated' }
JinAttachment >> gridlineShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> gridlineStyleBottom [
<getter>
	^ (handle propertyNamed: #'GridlineStyleBottom' ).

]

{ #category : #'property - generated' }
JinAttachment >> gridlineStyleBottom: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleBottom' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> gridlineStyleLeft [
<getter>
	^ (handle propertyNamed: #'GridlineStyleLeft' ).

]

{ #category : #'property - generated' }
JinAttachment >> gridlineStyleLeft: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleLeft' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> gridlineStyleRight [
<getter>
	^ (handle propertyNamed: #'GridlineStyleRight' ).

]

{ #category : #'property - generated' }
JinAttachment >> gridlineStyleRight: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleRight' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> gridlineStyleTop [
<getter>
	^ (handle propertyNamed: #'GridlineStyleTop' ).

]

{ #category : #'property - generated' }
JinAttachment >> gridlineStyleTop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleTop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> gridlineThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'GridlineThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinAttachment >> gridlineThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> gridlineTint [
<getter>
	^ (handle propertyNamed: #'GridlineTint' ).

]

{ #category : #'property - generated' }
JinAttachment >> gridlineTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> gridlineWidthBottom [
<getter>
	^ (handle propertyNamed: #'GridlineWidthBottom' ).

]

{ #category : #'property - generated' }
JinAttachment >> gridlineWidthBottom: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthBottom' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> gridlineWidthLeft [
<getter>
	^ (handle propertyNamed: #'GridlineWidthLeft' ).

]

{ #category : #'property - generated' }
JinAttachment >> gridlineWidthLeft: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthLeft' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> gridlineWidthRight [
<getter>
	^ (handle propertyNamed: #'GridlineWidthRight' ).

]

{ #category : #'property - generated' }
JinAttachment >> gridlineWidthRight: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthRight' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> gridlineWidthTop [
<getter>
	^ (handle propertyNamed: #'GridlineWidthTop' ).

]

{ #category : #'property - generated' }
JinAttachment >> gridlineWidthTop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthTop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> height [
<getter>
	^ (handle propertyNamed: #'Height' ).

]

{ #category : #'property - generated' }
JinAttachment >> height: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Height' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> helpContextId [
<getter>
	^ (handle propertyNamed: #'HelpContextId' ).

]

{ #category : #'property - generated' }
JinAttachment >> helpContextId: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HelpContextId' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> horizontalAnchor [
<getter>
	^ (handle propertyNamed: #'HorizontalAnchor' ).

]

{ #category : #'property - generated' }
JinAttachment >> horizontalAnchor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HorizontalAnchor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> inSelection [
<getter>
	^ (handle propertyNamed: #'InSelection' ).

]

{ #category : #'property - generated' }
JinAttachment >> inSelection: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'InSelection' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> isVisible [
<getter>
	^ (handle propertyNamed: #'IsVisible' ).

]

{ #category : #'property - generated' }
JinAttachment >> isVisible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IsVisible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> labelAlign [
<getter>
	^ (handle propertyNamed: #'LabelAlign' ).

]

{ #category : #'property - generated' }
JinAttachment >> labelAlign: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LabelAlign' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> labelX [
<getter>
	^ (handle propertyNamed: #'LabelX' ).

]

{ #category : #'property - generated' }
JinAttachment >> labelX: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LabelX' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> labelY [
<getter>
	^ (handle propertyNamed: #'LabelY' ).

]

{ #category : #'property - generated' }
JinAttachment >> labelY: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LabelY' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> layout [
<getter>
	^ (handle propertyNamed: #'Layout' ).

]

{ #category : #'property - generated' }
JinAttachment >> layoutID [
<getter>
	^ (handle propertyNamed: #'LayoutID' ).

]

{ #category : #'property - generated' }
JinAttachment >> left [
<getter>
	^ (handle propertyNamed: #'Left' ).

]

{ #category : #'property - generated' }
JinAttachment >> left: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Left' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> leftPadding [
<getter>
	^ (handle propertyNamed: #'LeftPadding' ).

]

{ #category : #'property - generated' }
JinAttachment >> leftPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LeftPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> locked [
<getter>
	^ (handle propertyNamed: #'Locked' ).

]

{ #category : #'property - generated' }
JinAttachment >> locked: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Locked' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinAttachment >> move: aLeft top: aTop width: aWidth height: aHeight [
<method>
"This method can be called with optional parameters. Top,Width,Height"
	^ (handle dispatch: #'Move' withArguments: {aLeft . aTop . aWidth . aHeight} ).

]

{ #category : #'property - generated' }
JinAttachment >> name: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Name' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> oldBorderStyle [
<getter>
	^ (handle propertyNamed: #'OldBorderStyle' ).

]

{ #category : #'property - generated' }
JinAttachment >> oldBorderStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OldBorderStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> oldValue [
<getter>
	^ (handle propertyNamed: #'OldValue' ).

]

{ #category : #'property - generated' }
JinAttachment >> onAttachmentCurrent [
<getter>
	^ (handle propertyNamed: #'OnAttachmentCurrent' ).

]

{ #category : #'property - generated' }
JinAttachment >> onAttachmentCurrent: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnAttachmentCurrent' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> onChange [
<getter>
	^ (handle propertyNamed: #'OnChange' ).

]

{ #category : #'property - generated' }
JinAttachment >> onChange: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnChange' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> onClick [
<getter>
	^ (handle propertyNamed: #'OnClick' ).

]

{ #category : #'property - generated' }
JinAttachment >> onClick: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnClick' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> onDblClick [
<getter>
	^ (handle propertyNamed: #'OnDblClick' ).

]

{ #category : #'property - generated' }
JinAttachment >> onDblClick: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnDblClick' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> onDirty [
<getter>
	^ (handle propertyNamed: #'OnDirty' ).

]

{ #category : #'property - generated' }
JinAttachment >> onDirty: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnDirty' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> onEnter [
<getter>
	^ (handle propertyNamed: #'OnEnter' ).

]

{ #category : #'property - generated' }
JinAttachment >> onEnter: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnEnter' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> onExit [
<getter>
	^ (handle propertyNamed: #'OnExit' ).

]

{ #category : #'property - generated' }
JinAttachment >> onExit: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnExit' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> onGotFocus [
<getter>
	^ (handle propertyNamed: #'OnGotFocus' ).

]

{ #category : #'property - generated' }
JinAttachment >> onGotFocus: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnGotFocus' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> onKeyDown [
<getter>
	^ (handle propertyNamed: #'OnKeyDown' ).

]

{ #category : #'property - generated' }
JinAttachment >> onKeyDown: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyDown' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> onKeyPress [
<getter>
	^ (handle propertyNamed: #'OnKeyPress' ).

]

{ #category : #'property - generated' }
JinAttachment >> onKeyPress: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyPress' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> onKeyUp [
<getter>
	^ (handle propertyNamed: #'OnKeyUp' ).

]

{ #category : #'property - generated' }
JinAttachment >> onKeyUp: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyUp' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> onLostFocus [
<getter>
	^ (handle propertyNamed: #'OnLostFocus' ).

]

{ #category : #'property - generated' }
JinAttachment >> onLostFocus: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnLostFocus' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> onMouseDown [
<getter>
	^ (handle propertyNamed: #'OnMouseDown' ).

]

{ #category : #'property - generated' }
JinAttachment >> onMouseDown: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseDown' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> onMouseMove [
<getter>
	^ (handle propertyNamed: #'OnMouseMove' ).

]

{ #category : #'property - generated' }
JinAttachment >> onMouseMove: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseMove' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> onMouseUp [
<getter>
	^ (handle propertyNamed: #'OnMouseUp' ).

]

{ #category : #'property - generated' }
JinAttachment >> onMouseUp: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseUp' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> pictureAlignment [
<getter>
	^ (handle propertyNamed: #'PictureAlignment' ).

]

{ #category : #'property - generated' }
JinAttachment >> pictureAlignment: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'PictureAlignment' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> pictureSizeMode [
<getter>
	^ (handle propertyNamed: #'PictureSizeMode' ).

]

{ #category : #'property - generated' }
JinAttachment >> pictureSizeMode: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'PictureSizeMode' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> pictureTiling [
<getter>
	^ (handle propertyNamed: #'PictureTiling' ).

]

{ #category : #'property - generated' }
JinAttachment >> pictureTiling: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'PictureTiling' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinAttachment >> requery [
<method>
	^ (handle dispatch: #'Requery' ).

]

{ #category : #'property - generated' }
JinAttachment >> rightPadding [
<getter>
	^ (handle propertyNamed: #'RightPadding' ).

]

{ #category : #'property - generated' }
JinAttachment >> rightPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'RightPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> section [
	<getter>
	^ handle propertyNamed: #Section
]

{ #category : #'property - generated' }
JinAttachment >> section: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Section' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinAttachment >> setFocus [
<method>
	^ (handle dispatch: #'SetFocus' ).

]

{ #category : #'property - generated' }
JinAttachment >> shortcutMenuBar [
<getter>
	^ (handle propertyNamed: #'ShortcutMenuBar' ).

]

{ #category : #'property - generated' }
JinAttachment >> shortcutMenuBar: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ShortcutMenuBar' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinAttachment >> sizeToFit [
<method>
	^ (handle dispatch: #'SizeToFit' ).

]

{ #category : #'property - generated' }
JinAttachment >> specialEffect [
<getter>
	^ (handle propertyNamed: #'SpecialEffect' ).

]

{ #category : #'property - generated' }
JinAttachment >> specialEffect: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'SpecialEffect' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> statusBarText [
<getter>
	^ (handle propertyNamed: #'StatusBarText' ).

]

{ #category : #'property - generated' }
JinAttachment >> statusBarText: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'StatusBarText' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> tabIndex [
<getter>
	^ (handle propertyNamed: #'TabIndex' ).

]

{ #category : #'property - generated' }
JinAttachment >> tabIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TabIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> tabStop [
<getter>
	^ (handle propertyNamed: #'TabStop' ).

]

{ #category : #'property - generated' }
JinAttachment >> tabStop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TabStop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> tag [
<getter>
	^ (handle propertyNamed: #'Tag' ).

]

{ #category : #'property - generated' }
JinAttachment >> tag: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Tag' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> top [
<getter>
	^ (handle propertyNamed: #'Top' ).

]

{ #category : #'property - generated' }
JinAttachment >> top: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Top' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> topPadding [
<getter>
	^ (handle propertyNamed: #'TopPadding' ).

]

{ #category : #'property - generated' }
JinAttachment >> topPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TopPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> verticalAnchor [
<getter>
	^ (handle propertyNamed: #'VerticalAnchor' ).

]

{ #category : #'property - generated' }
JinAttachment >> verticalAnchor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'VerticalAnchor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> visible [
<getter>
	^ (handle propertyNamed: #'Visible' ).

]

{ #category : #'property - generated' }
JinAttachment >> visible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Visible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAttachment >> width [
<getter>
	^ (handle propertyNamed: #'Width' ).

]

{ #category : #'property - generated' }
JinAttachment >> width: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Width' withArguments: {aParam1} ).

]
