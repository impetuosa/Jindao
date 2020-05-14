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

## Events

- [AfterUpdate](Access.Attachment.AfterUpdate-event.md)
- [AttachmentCurrent](Access.Attachment.AttachmentCurrent.md)
- [BeforeUpdate](Access.Attachment.BeforeUpdate-event.md)
- [Change](Access.Attachment.Change.md)
- [Click](Access.Attachment.Click.md)
- [DblClick](Access.Attachment.DblClick.md)
- [Dirty](Access.Attachment.Dirty.md)
- [Enter](Access.Attachment.Enter.md)
- [Exit](Access.Attachment.Exit.md)
- [GotFocus](Access.Attachment.GotFocus.md)
- [KeyDown](Access.Attachment.KeyDown.md)
- [KeyPress](Access.Attachment.KeyPress.md)
- [KeyUp](Access.Attachment.KeyUp.md)
- [LostFocus](Access.Attachment.LostFocus.md)
- [MouseDown](Access.Attachment.MouseDown.md)
- [MouseMove](Access.Attachment.MouseMove.md)
- [MouseUp](Access.Attachment.MouseUp.md)

## Methods

- [Back](Access.Attachment.Back.md)
- [Forward](Access.Attachment.Forward.md)
- [Move](Access.Attachment.Move.md)
- [Requery](Access.Attachment.Requery.md)
- [SetFocus](Access.Attachment.SetFocus.md)
- [SizeToFit](Access.Attachment.SizeToFit.md)

## Properties

- [AddColon](Access.Attachment.AddColon.md)
- [AfterUpdate](Access.Attachment.AfterUpdate-property.md)
- [Application](Access.Attachment.Application.md)
- [AttachmentCount](Access.Attachment.AttachmentCount.md)
- [AutoLabel](Access.Attachment.AutoLabel.md)
- [BackColor](Access.Attachment.BackColor.md)
- [BackShade](Access.Attachment.BackShade.md)
- [BackStyle](Access.Attachment.BackStyle.md)
- [BackThemeColorIndex](Access.Attachment.BackThemeColorIndex.md)
- [BackTint](Access.Attachment.BackTint.md)
- [BeforeUpdate](Access.Attachment.BeforeUpdate-property.md)
- [BorderColor](Access.Attachment.BorderColor.md)
- [BorderShade](Access.Attachment.BorderShade.md)
- [BorderStyle](Access.Attachment.BorderStyle.md)
- [BorderThemeColorIndex](Access.Attachment.BorderThemeColorIndex.md)
- [BorderTint](Access.Attachment.BorderTint.md)
- [BorderWidth](Access.Attachment.BorderWidth.md)
- [BottomPadding](Access.Attachment.BottomPadding.md)
- [ColumnHidden](Access.Attachment.ColumnHidden.md)
- [ColumnOrder](Access.Attachment.ColumnOrder.md)
- [ColumnWidth](Access.Attachment.ColumnWidth.md)
- [Controls](Access.Attachment.Controls.md)
- [ControlSource](Access.Attachment.ControlSource.md)
- [ControlTipText](Access.Attachment.ControlTipText.md)
- [ControlType](Access.Attachment.ControlType.md)
- [CurrentAttachment](Access.Attachment.CurrentAttachment.md)
- [DefaultPicture](Access.Attachment.DefaultPicture.md)
- [DefaultPictureType](Access.Attachment.DefaultPictureType.md)
- [DisplayAs](Access.Attachment.DisplayAs.md)
- [DisplayWhen](Access.Attachment.DisplayWhen.md)
- [Enabled](Access.Attachment.Enabled.md)
- [EventProcPrefix](Access.Attachment.EventProcPrefix.md)
- [FileName](Access.Attachment.FileName.md)
- [FileType](Access.Attachment.FileType.md)
- [FileURL](Access.Attachment.FileURL.md)
- [GridlineColor](Access.Attachment.GridlineColor.md)
- [GridlineShade](Access.Attachment.GridlineShade.md)
- [GridlineStyleBottom](Access.Attachment.GridlineStyleBottom.md)
- [GridlineStyleLeft](Access.Attachment.GridlineStyleLeft.md)
- [GridlineStyleRight](Access.Attachment.GridlineStyleRight.md)
- [GridlineStyleTop](Access.Attachment.GridlineStyleTop.md)
- [GridlineThemeColorIndex](Access.Attachment.GridlineThemeColorIndex.md)
- [GridlineTint](Access.Attachment.GridlineTint.md)
- [GridlineWidthBottom](Access.Attachment.GridlineWidthBottom.md)
- [GridlineWidthLeft](Access.Attachment.GridlineWidthLeft.md)
- [GridlineWidthRight](Access.Attachment.GridlineWidthRight.md)
- [GridlineWidthTop](Access.Attachment.GridlineWidthTop.md)
- [Height](Access.Attachment.Height.md)
- [HelpContextId](Access.Attachment.HelpContextId.md)
- [HorizontalAnchor](Access.Attachment.HorizontalAnchor.md)
- [InSelection](Access.Attachment.InSelection.md)
- [IsVisible](Access.Attachment.IsVisible.md)
- [LabelAlign](Access.Attachment.LabelAlign.md)
- [LabelX](Access.Attachment.LabelX.md)
- [LabelY](Access.Attachment.LabelY.md)
- [Layout](Access.Attachment.Layout.md)
- [LayoutID](Access.Attachment.LayoutID.md)
- [Left](Access.Attachment.Left.md)
- [LeftPadding](Access.Attachment.LeftPadding.md)
- [Locked](Access.Attachment.Locked.md)
- [Name](Access.Attachment.Name.md)
- [OldBorderStyle](Access.Attachment.OldBorderStyle.md)
- [OldValue](Access.Attachment.OldValue.md)
- [OnAttachmentCurrent](Access.Attachment.OnAttachmentCurrent.md)
- [OnChange](Access.Attachment.OnChange.md)
- [OnClick](Access.Attachment.OnClick.md)
- [OnDblClick](Access.Attachment.OnDblClick.md)
- [OnDirty](Access.Attachment.OnDirty.md)
- [OnEnter](Access.Attachment.OnEnter.md)
- [OnExit](Access.Attachment.OnExit.md)
- [OnGotFocus](Access.Attachment.OnGotFocus.md)
- [OnKeyDown](Access.Attachment.OnKeyDown.md)
- [OnKeyPress](Access.Attachment.OnKeyPress.md)
- [OnKeyUp](Access.Attachment.OnKeyUp.md)
- [OnLostFocus](Access.Attachment.OnLostFocus.md)
- [OnMouseDown](Access.Attachment.OnMouseDown.md)
- [OnMouseMove](Access.Attachment.OnMouseMove.md)
- [OnMouseUp](Access.Attachment.OnMouseUp.md)
- [Parent](Access.Attachment.Parent.md)
- [PictureAlignment](Access.Attachment.PictureAlignment.md)
- [PictureSizeMode](Access.Attachment.PictureSizeMode.md)
- [PictureTiling](Access.Attachment.PictureTiling.md)
- [Properties](Access.Attachment.Properties.md)
- [RightPadding](Access.Attachment.RightPadding.md)
- [Section](Access.Attachment.Section.md)
- [ShortcutMenuBar](Access.Attachment.ShortcutMenuBar.md)
- [SpecialEffect](Access.Attachment.SpecialEffect.md)
- [StatusBarText](Access.Attachment.StatusBarText.md)
- [TabIndex](Access.Attachment.TabIndex.md)
- [TabStop](Access.Attachment.TabStop.md)
- [Tag](Access.Attachment.Tag.md)
- [Top](Access.Attachment.Top.md)
- [TopPadding](Access.Attachment.TopPadding.md)
- [VerticalAnchor](Access.Attachment.VerticalAnchor.md)
- [Visible](Access.Attachment.Visible.md)
- [Width](Access.Attachment.Width.md)

## See also

- [Access Object Model Reference](overview/Access/object-model.md)



[!include[Support and feedback](~/includes/feedback-boilerplate.md)]

"
Class {
	#name : #JinControlAttachment,
	#superclass : #JinControlAbstractAttachment,
	#category : #'Jindao-DomainObjects-GeneratedControls'
}

{ #category : #generated }
JinControlAttachment class >> mappedTypeName [
	^#'_Attachment'
]

{ #category : #generated }
JinControlAttachment >> acceptVisitor: aVisitor [
	^ aVisitor visitAttachment: self
]

{ #category : #'property - generated' }
JinControlAttachment >> addColon [
<getter>
	^ (handle propertyNamed: #'AddColon' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> addColon: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AddColon' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> application [
<getter>
	^ (handle propertyNamed: #'Application' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> attachmentCount [
<getter>
	^ (handle propertyNamed: #'AttachmentCount' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> autoLabel [
<getter>
	^ (handle propertyNamed: #'AutoLabel' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> autoLabel: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AutoLabel' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlAttachment >> back [
<method>
	^ (handle dispatch: #'Back' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> backColor [
<getter>
	^ (handle propertyNamed: #'BackColor' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> backColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> backShade [
<getter>
	^ (handle propertyNamed: #'BackShade' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> backShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> backStyle [
<getter>
	^ (handle propertyNamed: #'BackStyle' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> backStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> backThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'BackThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> backThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> backTint [
<getter>
	^ (handle propertyNamed: #'BackTint' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> backTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> borderColor [
<getter>
	^ (handle propertyNamed: #'BorderColor' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> borderColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> borderShade [
<getter>
	^ (handle propertyNamed: #'BorderShade' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> borderShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> borderStyle [
<getter>
	^ (handle propertyNamed: #'BorderStyle' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> borderStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> borderThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'BorderThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> borderThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> borderTint [
<getter>
	^ (handle propertyNamed: #'BorderTint' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> borderTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> borderWidth [
<getter>
	^ (handle propertyNamed: #'BorderWidth' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> borderWidth: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderWidth' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> bottomPadding [
<getter>
	^ (handle propertyNamed: #'BottomPadding' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> bottomPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BottomPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> columnHidden [
<getter>
	^ (handle propertyNamed: #'ColumnHidden' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> columnHidden: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ColumnHidden' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> columnOrder [
<getter>
	^ (handle propertyNamed: #'ColumnOrder' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> columnOrder: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ColumnOrder' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> columnWidth [
<getter>
	^ (handle propertyNamed: #'ColumnWidth' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> columnWidth: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ColumnWidth' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> controlSource [
<getter>
	^ (handle propertyNamed: #'ControlSource' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> controlSource: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlSource' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> controlTipText [
<getter>
	^ (handle propertyNamed: #'ControlTipText' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> controlTipText: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlTipText' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> controlType [
<getter>
	^ (handle propertyNamed: #'ControlType' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> controlType: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlType' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> controls [
<getter>
	^ (handle propertyNamed: #'Controls' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> currentAttachment [
<getter>
	^ (handle propertyNamed: #'CurrentAttachment' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> currentAttachment: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'CurrentAttachment' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> defaultPicture [
<getter>
	^ (handle propertyNamed: #'DefaultPicture' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> defaultPicture: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DefaultPicture' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> defaultPictureType [
<getter>
	^ (handle propertyNamed: #'DefaultPictureType' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> defaultPictureType: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DefaultPictureType' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> displayAs [
<getter>
	^ (handle propertyNamed: #'DisplayAs' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> displayAs: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DisplayAs' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> displayWhen [
<getter>
	^ (handle propertyNamed: #'DisplayWhen' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> displayWhen: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DisplayWhen' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> enabled [
<getter>
	^ (handle propertyNamed: #'Enabled' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> enabled: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Enabled' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> eventProcPrefix [
<getter>
	^ (handle propertyNamed: #'EventProcPrefix' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> eventProcPrefix: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'EventProcPrefix' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> fileName: aVar [
<getter>
"This method can be called with optional parameters. var"
	^ (handle propertyNamed: #'FileName' withArguments: {aVar} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> fileType: aVar [
<getter>
"This method can be called with optional parameters. var"
	^ (handle propertyNamed: #'FileType' withArguments: {aVar} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> fileURL: aVar [
<getter>
"This method can be called with optional parameters. var"
	^ (handle propertyNamed: #'FileURL' withArguments: {aVar} ).

]

{ #category : #'method - generated' }
JinControlAttachment >> forward [
<method>
	^ (handle dispatch: #'Forward' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> gridlineColor [
<getter>
	^ (handle propertyNamed: #'GridlineColor' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> gridlineColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> gridlineShade [
<getter>
	^ (handle propertyNamed: #'GridlineShade' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> gridlineShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> gridlineStyleBottom [
<getter>
	^ (handle propertyNamed: #'GridlineStyleBottom' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> gridlineStyleBottom: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleBottom' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> gridlineStyleLeft [
<getter>
	^ (handle propertyNamed: #'GridlineStyleLeft' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> gridlineStyleLeft: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleLeft' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> gridlineStyleRight [
<getter>
	^ (handle propertyNamed: #'GridlineStyleRight' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> gridlineStyleRight: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleRight' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> gridlineStyleTop [
<getter>
	^ (handle propertyNamed: #'GridlineStyleTop' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> gridlineStyleTop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleTop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> gridlineThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'GridlineThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> gridlineThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> gridlineTint [
<getter>
	^ (handle propertyNamed: #'GridlineTint' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> gridlineTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> gridlineWidthBottom [
<getter>
	^ (handle propertyNamed: #'GridlineWidthBottom' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> gridlineWidthBottom: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthBottom' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> gridlineWidthLeft [
<getter>
	^ (handle propertyNamed: #'GridlineWidthLeft' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> gridlineWidthLeft: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthLeft' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> gridlineWidthRight [
<getter>
	^ (handle propertyNamed: #'GridlineWidthRight' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> gridlineWidthRight: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthRight' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> gridlineWidthTop [
<getter>
	^ (handle propertyNamed: #'GridlineWidthTop' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> gridlineWidthTop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthTop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> height [
<getter>
	^ (handle propertyNamed: #'Height' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> height: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Height' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> helpContextId [
<getter>
	^ (handle propertyNamed: #'HelpContextId' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> helpContextId: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HelpContextId' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> horizontalAnchor [
<getter>
	^ (handle propertyNamed: #'HorizontalAnchor' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> horizontalAnchor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HorizontalAnchor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> inSelection [
<getter>
	^ (handle propertyNamed: #'InSelection' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> inSelection: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'InSelection' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> isVisible [
<getter>
	^ (handle propertyNamed: #'IsVisible' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> isVisible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IsVisible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> labelAlign [
<getter>
	^ (handle propertyNamed: #'LabelAlign' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> labelAlign: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LabelAlign' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> labelX [
<getter>
	^ (handle propertyNamed: #'LabelX' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> labelX: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LabelX' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> labelY [
<getter>
	^ (handle propertyNamed: #'LabelY' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> labelY: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LabelY' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> layout [
<getter>
	^ (handle propertyNamed: #'Layout' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> layoutID [
<getter>
	^ (handle propertyNamed: #'LayoutID' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> left [
<getter>
	^ (handle propertyNamed: #'Left' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> left: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Left' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> leftPadding [
<getter>
	^ (handle propertyNamed: #'LeftPadding' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> leftPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LeftPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> locked [
<getter>
	^ (handle propertyNamed: #'Locked' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> locked: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Locked' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlAttachment >> move: aLeft top: aTop width: aWidth height: aHeight [
<method>
"This method can be called with optional parameters. Top,Width,Height"
	^ (handle dispatch: #'Move' withArguments: {aLeft . aTop . aWidth . aHeight} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> name [
<getter>
	^ (handle propertyNamed: #'Name' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> name: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Name' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> oldBorderStyle [
<getter>
	^ (handle propertyNamed: #'OldBorderStyle' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> oldBorderStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OldBorderStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> oldValue [
<getter>
	^ (handle propertyNamed: #'OldValue' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onAttachmentCurrent [
<getter>
	^ (handle propertyNamed: #'OnAttachmentCurrent' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onAttachmentCurrent: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnAttachmentCurrent' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onChange [
<getter>
	^ (handle propertyNamed: #'OnChange' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onChange: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnChange' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onClick [
<getter>
	^ (handle propertyNamed: #'OnClick' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onClick: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnClick' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onDblClick [
<getter>
	^ (handle propertyNamed: #'OnDblClick' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onDblClick: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnDblClick' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onDirty [
<getter>
	^ (handle propertyNamed: #'OnDirty' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onDirty: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnDirty' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onEnter [
<getter>
	^ (handle propertyNamed: #'OnEnter' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onEnter: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnEnter' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onExit [
<getter>
	^ (handle propertyNamed: #'OnExit' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onExit: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnExit' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onGotFocus [
<getter>
	^ (handle propertyNamed: #'OnGotFocus' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onGotFocus: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnGotFocus' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onKeyDown [
<getter>
	^ (handle propertyNamed: #'OnKeyDown' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onKeyDown: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyDown' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onKeyPress [
<getter>
	^ (handle propertyNamed: #'OnKeyPress' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onKeyPress: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyPress' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onKeyUp [
<getter>
	^ (handle propertyNamed: #'OnKeyUp' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onKeyUp: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyUp' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onLostFocus [
<getter>
	^ (handle propertyNamed: #'OnLostFocus' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onLostFocus: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnLostFocus' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onMouseDown [
<getter>
	^ (handle propertyNamed: #'OnMouseDown' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onMouseDown: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseDown' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onMouseMove [
<getter>
	^ (handle propertyNamed: #'OnMouseMove' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onMouseMove: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseMove' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onMouseUp [
<getter>
	^ (handle propertyNamed: #'OnMouseUp' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> onMouseUp: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseUp' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> parent [
<getter>
	^ (handle propertyNamed: #'Parent' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> pictureAlignment [
<getter>
	^ (handle propertyNamed: #'PictureAlignment' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> pictureAlignment: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'PictureAlignment' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> pictureSizeMode [
<getter>
	^ (handle propertyNamed: #'PictureSizeMode' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> pictureSizeMode: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'PictureSizeMode' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> pictureTiling [
<getter>
	^ (handle propertyNamed: #'PictureTiling' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> pictureTiling: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'PictureTiling' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlAttachment >> requery [
<method>
	^ (handle dispatch: #'Requery' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> rightPadding [
<getter>
	^ (handle propertyNamed: #'RightPadding' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> rightPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'RightPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> section [
<getter>
	^ (handle propertyNamed: #'Section' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> section: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Section' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlAttachment >> setFocus [
<method>
	^ (handle dispatch: #'SetFocus' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> shortcutMenuBar [
<getter>
	^ (handle propertyNamed: #'ShortcutMenuBar' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> shortcutMenuBar: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ShortcutMenuBar' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlAttachment >> sizeToFit [
<method>
	^ (handle dispatch: #'SizeToFit' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> specialEffect [
<getter>
	^ (handle propertyNamed: #'SpecialEffect' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> specialEffect: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'SpecialEffect' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> statusBarText [
<getter>
	^ (handle propertyNamed: #'StatusBarText' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> statusBarText: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'StatusBarText' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> tabIndex [
<getter>
	^ (handle propertyNamed: #'TabIndex' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> tabIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TabIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> tabStop [
<getter>
	^ (handle propertyNamed: #'TabStop' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> tabStop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TabStop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> tag [
<getter>
	^ (handle propertyNamed: #'Tag' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> tag: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Tag' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> top [
<getter>
	^ (handle propertyNamed: #'Top' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> top: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Top' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> topPadding [
<getter>
	^ (handle propertyNamed: #'TopPadding' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> topPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TopPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> verticalAnchor [
<getter>
	^ (handle propertyNamed: #'VerticalAnchor' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> verticalAnchor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'VerticalAnchor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> visible [
<getter>
	^ (handle propertyNamed: #'Visible' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> visible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Visible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAttachment >> width [
<getter>
	^ (handle propertyNamed: #'Width' ).

]

{ #category : #'property - generated' }
JinControlAttachment >> width: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Width' withArguments: {aParam1} ).

]
