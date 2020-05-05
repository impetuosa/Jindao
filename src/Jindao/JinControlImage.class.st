"
---
title: Image object (Access)
keywords: vbaac10.chm10436
f1_keywords:
- vbaac10.chm10436
ms.prod: access
api_name:
- Access.Image
ms.assetid: 1bcc8552-94e2-b799-6903-392205cb4341
ms.date: 03/20/2019
localization_priority: Normal
---


# Image object (Access)

This object corresponds to an image control. The image control can add a picture to a form or report. For example, you could include an image control for a logo on an **Invoice** report.

> [!NOTE] 
> The functionality for the **Image** object's **Click** and **DoubleClick** events has been deprecated. If you want an image with click/double-click events, use instead a **Button** control and associate an image with that control to provide better accessibility. **Button** controls are part of the Tab Order loop, but **Image** controls are not. Existing applications will not be affected by this change.

## Remarks

|Control|Tool|
|:------|:----|
|![Image control](../images/t-imgctl_ZA06053959.gif)|![Image tool](../images/imagefrm_ZA06044465.gif)|

You can use the image control or an [Unbound object frame](overview/Access.md) for unbound pictures. The advantage of using the image control is that it's faster to display. The advantage of using the unbound object frame is that you can edit the object directly from the form or report.


## Events

- [Click](Access.Image.Click.md)
- [DblClick](Access.Image.DblClick.md)
- [MouseDown](Access.Image.MouseDown.md)
- [MouseMove](Access.Image.MouseMove.md)
- [MouseUp](Access.Image.MouseUp.md)

## Methods

- [Move](Access.Image.Move.md)
- [Requery](Access.Image.Requery.md)
- [SetFocus](Access.Image.SetFocus.md)
- [SizeToFit](Access.Image.SizeToFit.md)

## Properties

- [Application](Access.Image.Application.md)
- [BackColor](Access.Image.BackColor.md)
- [BackShade](Access.Image.BackShade.md)
- [BackStyle](Access.Image.BackStyle.md)
- [BackThemeColorIndex](Access.Image.BackThemeColorIndex.md)
- [BackTint](Access.Image.BackTint.md)
- [BorderColor](Access.Image.BorderColor.md)
- [BorderShade](Access.Image.BorderShade.md)
- [BorderStyle](Access.Image.BorderStyle.md)
- [BorderThemeColorIndex](Access.Image.BorderThemeColorIndex.md)
- [BorderTint](Access.Image.BorderTint.md)
- [BorderWidth](Access.Image.BorderWidth.md)
- [BottomPadding](Access.Image.BottomPadding.md)
- [Controls](Access.Image.Controls.md)
- [ControlTipText](Access.Image.ControlTipText.md)
- [ControlType](Access.Image.ControlType.md)
- [DisplayWhen](Access.Image.DisplayWhen.md)
- [EventProcPrefix](Access.Image.EventProcPrefix.md)
- [GridlineColor](Access.Image.GridlineColor.md)
- [GridlineShade](Access.Image.GridlineShade.md)
- [GridlineStyleBottom](Access.Image.GridlineStyleBottom.md)
- [GridlineStyleLeft](Access.Image.GridlineStyleLeft.md)
- [GridlineStyleRight](Access.Image.GridlineStyleRight.md)
- [GridlineStyleTop](Access.Image.GridlineStyleTop.md)
- [GridlineThemeColorIndex](Access.Image.GridlineThemeColorIndex.md)
- [GridlineTint](Access.Image.GridlineTint.md)
- [GridlineWidthBottom](Access.Image.GridlineWidthBottom.md)
- [GridlineWidthLeft](Access.Image.GridlineWidthLeft.md)
- [GridlineWidthRight](Access.Image.GridlineWidthRight.md)
- [GridlineWidthTop](Access.Image.GridlineWidthTop.md)
- [Height](Access.Image.Height.md)
- [HelpContextId](Access.Image.HelpContextId.md)
- [HorizontalAnchor](Access.Image.HorizontalAnchor.md)
- [Hyperlink](Access.Image.Hyperlink.md)
- [HyperlinkAddress](Access.Image.HyperlinkAddress.md)
- [HyperlinkSubAddress](Access.Image.HyperlinkSubAddress.md)
- [ImageHeight](Access.Image.ImageHeight.md)
- [ImageWidth](Access.Image.ImageWidth.md)
- [InSelection](Access.Image.InSelection.md)
- [IsVisible](Access.Image.IsVisible.md)
- [Layout](Access.Image.Layout.md)
- [LayoutID](Access.Image.LayoutID.md)
- [Left](Access.Image.Left.md)
- [LeftPadding](Access.Image.LeftPadding.md)
- [Name](Access.Image.Name.md)
- [ObjectPalette](Access.Image.ObjectPalette.md)
- [OldBorderStyle](Access.Image.OldBorderStyle.md)
- [OldValue](Access.Image.OldValue.md)
- [OnClick](Access.Image.OnClick.md)
- [OnDblClick](Access.Image.OnDblClick.md)
- [OnMouseDown](Access.Image.OnMouseDown.md)
- [OnMouseMove](Access.Image.OnMouseMove.md)
- [OnMouseUp](Access.Image.OnMouseUp.md)
- [Parent](Access.Image.Parent.md)
- [Picture](Access.Image.Picture.md)
- [PictureAlignment](Access.Image.PictureAlignment.md)
- [PictureData](Access.Image.PictureData.md)
- [PictureTiling](Access.Image.PictureTiling.md)
- [PictureType](Access.Image.PictureType.md)
- [Properties](Access.Image.Properties.md)
- [RightPadding](Access.Image.RightPadding.md)
- [Section](Access.Image.Section.md)
- [ShortcutMenuBar](Access.Image.ShortcutMenuBar.md)
- [SizeMode](Access.Image.SizeMode.md)
- [SpecialEffect](Access.Image.SpecialEffect.md)
- [Tag](Access.Image.Tag.md)
- [Top](Access.Image.Top.md)
- [TopPadding](Access.Image.TopPadding.md)
- [VerticalAnchor](Access.Image.VerticalAnchor.md)
- [Visible](Access.Image.Visible.md)
- [Width](Access.Image.Width.md)

## See also

- [Access Object Model Reference](overview/Access/object-model.md)



[!include[Support and feedback](~/includes/feedback-boilerplate.md)]

"
Class {
	#name : #JinControlImage,
	#superclass : #JinControlAbstractImage,
	#category : #'Jindao-DomainObjects-GeneratedControls'
}

{ #category : #generated }
JinControlImage class >> mappedTypeName [
	^#'_Image'
]

{ #category : #generated }
JinControlImage >> acceptVisitor: aVisitor [
	^ aVisitor visitImage: self
]

{ #category : #'property - generated' }
JinControlImage >> application [
<getter>
	^ (handle propertyNamed: #'Application' ).

]

{ #category : #'property - generated' }
JinControlImage >> backColor [
<getter>
	^ (handle propertyNamed: #'BackColor' ).

]

{ #category : #'property - generated' }
JinControlImage >> backColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> backShade [
<getter>
	^ (handle propertyNamed: #'BackShade' ).

]

{ #category : #'property - generated' }
JinControlImage >> backShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> backStyle [
<getter>
	^ (handle propertyNamed: #'BackStyle' ).

]

{ #category : #'property - generated' }
JinControlImage >> backStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> backThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'BackThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinControlImage >> backThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> backTint [
<getter>
	^ (handle propertyNamed: #'BackTint' ).

]

{ #category : #'property - generated' }
JinControlImage >> backTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> borderColor [
<getter>
	^ (handle propertyNamed: #'BorderColor' ).

]

{ #category : #'property - generated' }
JinControlImage >> borderColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> borderShade [
<getter>
	^ (handle propertyNamed: #'BorderShade' ).

]

{ #category : #'property - generated' }
JinControlImage >> borderShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> borderStyle [
<getter>
	^ (handle propertyNamed: #'BorderStyle' ).

]

{ #category : #'property - generated' }
JinControlImage >> borderStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> borderThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'BorderThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinControlImage >> borderThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> borderTint [
<getter>
	^ (handle propertyNamed: #'BorderTint' ).

]

{ #category : #'property - generated' }
JinControlImage >> borderTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> borderWidth [
<getter>
	^ (handle propertyNamed: #'BorderWidth' ).

]

{ #category : #'property - generated' }
JinControlImage >> borderWidth: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderWidth' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> bottomPadding [
<getter>
	^ (handle propertyNamed: #'BottomPadding' ).

]

{ #category : #'property - generated' }
JinControlImage >> bottomPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BottomPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> controlTipText [
<getter>
	^ (handle propertyNamed: #'ControlTipText' ).

]

{ #category : #'property - generated' }
JinControlImage >> controlTipText: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlTipText' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> controlType [
<getter>
	^ (handle propertyNamed: #'ControlType' ).

]

{ #category : #'property - generated' }
JinControlImage >> controlType: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlType' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> controls [
<getter>
	^ (handle propertyNamed: #'Controls' ).

]

{ #category : #'property - generated' }
JinControlImage >> displayWhen [
<getter>
	^ (handle propertyNamed: #'DisplayWhen' ).

]

{ #category : #'property - generated' }
JinControlImage >> displayWhen: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DisplayWhen' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> eventProcPrefix [
<getter>
	^ (handle propertyNamed: #'EventProcPrefix' ).

]

{ #category : #'property - generated' }
JinControlImage >> eventProcPrefix: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'EventProcPrefix' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> gridlineColor [
<getter>
	^ (handle propertyNamed: #'GridlineColor' ).

]

{ #category : #'property - generated' }
JinControlImage >> gridlineColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> gridlineShade [
<getter>
	^ (handle propertyNamed: #'GridlineShade' ).

]

{ #category : #'property - generated' }
JinControlImage >> gridlineShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> gridlineStyleBottom [
<getter>
	^ (handle propertyNamed: #'GridlineStyleBottom' ).

]

{ #category : #'property - generated' }
JinControlImage >> gridlineStyleBottom: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleBottom' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> gridlineStyleLeft [
<getter>
	^ (handle propertyNamed: #'GridlineStyleLeft' ).

]

{ #category : #'property - generated' }
JinControlImage >> gridlineStyleLeft: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleLeft' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> gridlineStyleRight [
<getter>
	^ (handle propertyNamed: #'GridlineStyleRight' ).

]

{ #category : #'property - generated' }
JinControlImage >> gridlineStyleRight: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleRight' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> gridlineStyleTop [
<getter>
	^ (handle propertyNamed: #'GridlineStyleTop' ).

]

{ #category : #'property - generated' }
JinControlImage >> gridlineStyleTop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleTop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> gridlineThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'GridlineThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinControlImage >> gridlineThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> gridlineTint [
<getter>
	^ (handle propertyNamed: #'GridlineTint' ).

]

{ #category : #'property - generated' }
JinControlImage >> gridlineTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> gridlineWidthBottom [
<getter>
	^ (handle propertyNamed: #'GridlineWidthBottom' ).

]

{ #category : #'property - generated' }
JinControlImage >> gridlineWidthBottom: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthBottom' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> gridlineWidthLeft [
<getter>
	^ (handle propertyNamed: #'GridlineWidthLeft' ).

]

{ #category : #'property - generated' }
JinControlImage >> gridlineWidthLeft: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthLeft' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> gridlineWidthRight [
<getter>
	^ (handle propertyNamed: #'GridlineWidthRight' ).

]

{ #category : #'property - generated' }
JinControlImage >> gridlineWidthRight: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthRight' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> gridlineWidthTop [
<getter>
	^ (handle propertyNamed: #'GridlineWidthTop' ).

]

{ #category : #'property - generated' }
JinControlImage >> gridlineWidthTop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthTop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> height [
<getter>
	^ (handle propertyNamed: #'Height' ).

]

{ #category : #'property - generated' }
JinControlImage >> height: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Height' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> helpContextId [
<getter>
	^ (handle propertyNamed: #'HelpContextId' ).

]

{ #category : #'property - generated' }
JinControlImage >> helpContextId: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HelpContextId' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> horizontalAnchor [
<getter>
	^ (handle propertyNamed: #'HorizontalAnchor' ).

]

{ #category : #'property - generated' }
JinControlImage >> horizontalAnchor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HorizontalAnchor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> hyperlink [
<getter>
	^ (handle propertyNamed: #'Hyperlink' ).

]

{ #category : #'property - generated' }
JinControlImage >> hyperlinkAddress [
<getter>
	^ (handle propertyNamed: #'HyperlinkAddress' ).

]

{ #category : #'property - generated' }
JinControlImage >> hyperlinkAddress: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HyperlinkAddress' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> hyperlinkSubAddress [
<getter>
	^ (handle propertyNamed: #'HyperlinkSubAddress' ).

]

{ #category : #'property - generated' }
JinControlImage >> hyperlinkSubAddress: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HyperlinkSubAddress' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> imageHeight [
<getter>
	^ (handle propertyNamed: #'ImageHeight' ).

]

{ #category : #'property - generated' }
JinControlImage >> imageHeight: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ImageHeight' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> imageWidth [
<getter>
	^ (handle propertyNamed: #'ImageWidth' ).

]

{ #category : #'property - generated' }
JinControlImage >> imageWidth: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ImageWidth' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> inSelection [
<getter>
	^ (handle propertyNamed: #'InSelection' ).

]

{ #category : #'property - generated' }
JinControlImage >> inSelection: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'InSelection' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> isVisible [
<getter>
	^ (handle propertyNamed: #'IsVisible' ).

]

{ #category : #'property - generated' }
JinControlImage >> isVisible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IsVisible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> layout [
<getter>
	^ (handle propertyNamed: #'Layout' ).

]

{ #category : #'property - generated' }
JinControlImage >> layoutID [
<getter>
	^ (handle propertyNamed: #'LayoutID' ).

]

{ #category : #'property - generated' }
JinControlImage >> left [
<getter>
	^ (handle propertyNamed: #'Left' ).

]

{ #category : #'property - generated' }
JinControlImage >> left: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Left' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> leftPadding [
<getter>
	^ (handle propertyNamed: #'LeftPadding' ).

]

{ #category : #'property - generated' }
JinControlImage >> leftPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LeftPadding' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlImage >> move: aLeft top: aTop width: aWidth height: aHeight [
<method>
"This method can be called with optional parameters. Top,Width,Height"
	^ (handle dispatch: #'Move' withArguments: {aLeft . aTop . aWidth . aHeight} ).

]

{ #category : #'property - generated' }
JinControlImage >> name [
<getter>
	^ (handle propertyNamed: #'Name' ).

]

{ #category : #'property - generated' }
JinControlImage >> name: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Name' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> objectPalette [
<getter>
	^ (handle propertyNamed: #'ObjectPalette' ).

]

{ #category : #'property - generated' }
JinControlImage >> objectPalette: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ObjectPalette' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> oldBorderStyle [
<getter>
	^ (handle propertyNamed: #'OldBorderStyle' ).

]

{ #category : #'property - generated' }
JinControlImage >> oldBorderStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OldBorderStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> oldValue [
<getter>
	^ (handle propertyNamed: #'OldValue' ).

]

{ #category : #'property - generated' }
JinControlImage >> onClick [
<getter>
	^ (handle propertyNamed: #'OnClick' ).

]

{ #category : #'property - generated' }
JinControlImage >> onClick: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnClick' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> onDblClick [
<getter>
	^ (handle propertyNamed: #'OnDblClick' ).

]

{ #category : #'property - generated' }
JinControlImage >> onDblClick: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnDblClick' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> onMouseDown [
<getter>
	^ (handle propertyNamed: #'OnMouseDown' ).

]

{ #category : #'property - generated' }
JinControlImage >> onMouseDown: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseDown' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> onMouseMove [
<getter>
	^ (handle propertyNamed: #'OnMouseMove' ).

]

{ #category : #'property - generated' }
JinControlImage >> onMouseMove: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseMove' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> onMouseUp [
<getter>
	^ (handle propertyNamed: #'OnMouseUp' ).

]

{ #category : #'property - generated' }
JinControlImage >> onMouseUp: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseUp' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> parent [
<getter>
	^ (handle propertyNamed: #'Parent' ).

]

{ #category : #'property - generated' }
JinControlImage >> picture [
<getter>
	^ (handle propertyNamed: #'Picture' ).

]

{ #category : #'property - generated' }
JinControlImage >> picture: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Picture' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> pictureAlignment [
<getter>
	^ (handle propertyNamed: #'PictureAlignment' ).

]

{ #category : #'property - generated' }
JinControlImage >> pictureAlignment: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'PictureAlignment' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> pictureData [
<getter>
	^ (handle propertyNamed: #'PictureData' ).

]

{ #category : #'property - generated' }
JinControlImage >> pictureData: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'PictureData' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> pictureTiling [
<getter>
	^ (handle propertyNamed: #'PictureTiling' ).

]

{ #category : #'property - generated' }
JinControlImage >> pictureTiling: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'PictureTiling' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> pictureType [
<getter>
	^ (handle propertyNamed: #'PictureType' ).

]

{ #category : #'property - generated' }
JinControlImage >> pictureType: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'PictureType' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> properties [
<getter>
	^ (handle propertyNamed: #'Properties' ).

]

{ #category : #'method - generated' }
JinControlImage >> requery [
<method>
	^ (handle dispatch: #'Requery' ).

]

{ #category : #'property - generated' }
JinControlImage >> rightPadding [
<getter>
	^ (handle propertyNamed: #'RightPadding' ).

]

{ #category : #'property - generated' }
JinControlImage >> rightPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'RightPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> section [
<getter>
	^ (handle propertyNamed: #'Section' ).

]

{ #category : #'property - generated' }
JinControlImage >> section: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Section' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlImage >> setFocus [
<method>
	^ (handle dispatch: #'SetFocus' ).

]

{ #category : #'property - generated' }
JinControlImage >> shortcutMenuBar [
<getter>
	^ (handle propertyNamed: #'ShortcutMenuBar' ).

]

{ #category : #'property - generated' }
JinControlImage >> shortcutMenuBar: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ShortcutMenuBar' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> sizeMode [
<getter>
	^ (handle propertyNamed: #'SizeMode' ).

]

{ #category : #'property - generated' }
JinControlImage >> sizeMode: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'SizeMode' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlImage >> sizeToFit [
<method>
	^ (handle dispatch: #'SizeToFit' ).

]

{ #category : #'property - generated' }
JinControlImage >> specialEffect [
<getter>
	^ (handle propertyNamed: #'SpecialEffect' ).

]

{ #category : #'property - generated' }
JinControlImage >> specialEffect: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'SpecialEffect' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> tag [
<getter>
	^ (handle propertyNamed: #'Tag' ).

]

{ #category : #'property - generated' }
JinControlImage >> tag: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Tag' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> top [
<getter>
	^ (handle propertyNamed: #'Top' ).

]

{ #category : #'property - generated' }
JinControlImage >> top: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Top' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> topPadding [
<getter>
	^ (handle propertyNamed: #'TopPadding' ).

]

{ #category : #'property - generated' }
JinControlImage >> topPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TopPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> verticalAnchor [
<getter>
	^ (handle propertyNamed: #'VerticalAnchor' ).

]

{ #category : #'property - generated' }
JinControlImage >> verticalAnchor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'VerticalAnchor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> visible [
<getter>
	^ (handle propertyNamed: #'Visible' ).

]

{ #category : #'property - generated' }
JinControlImage >> visible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Visible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlImage >> width [
<getter>
	^ (handle propertyNamed: #'Width' ).

]

{ #category : #'property - generated' }
JinControlImage >> width: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Width' withArguments: {aParam1} ).

]
