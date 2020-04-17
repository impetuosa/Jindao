"
---
title: Label object (Access)
keywords: vbaac10.chm10271
f1_keywords:
- vbaac10.chm10271
ms.prod: access
api_name:
- Access.Label
ms.assetid: 3d83d916-85d7-b2eb-c9f6-f9a6ff0c9ec7
ms.date: 03/21/2019
localization_priority: Normal
---


# Label object (Access)

This object corresponds to a label control. Labels on a form or report display descriptive text such as titles, captions, or brief instructions.


## Remarks

|Control|Tool|
|:------|:---|
|![Label control](../images/t-label_ZA06053967.gif)|![Label tool](../images/label_ZA06044394.gif)|

Labels have certain characteristics:

- Labels don't display values from fields or expressions.
- Labels are always unbound.
- Labels don't change as you move from record to record.

A label can be attached to another control. When you create a text box, for example, it has an attached label that displays a caption for that text box. This label appears as a column heading in the Datasheet view of a form.

When you create a label by using the **Label** tool, the label stands on its own—it isn't attached to any other control. You use stand-alone labels for information such as the title of a form or report or for other descriptive text. Stand-alone labels don't appear in Datasheet view.


## Events

- [Click](Access.Label.Click.md)
- [DblClick](Access.Label.DblClick.md)
- [MouseDown](Access.Label.MouseDown.md)
- [MouseMove](Access.Label.MouseMove.md)
- [MouseUp](Access.Label.MouseUp.md)

## Methods

- [Move](Access.Label.Move.md)
- [SizeToFit](Access.Label.SizeToFit.md)

## Properties

- [Application](Access.Label.Application.md)
- [BackColor](Access.Label.BackColor.md)
- [BackShade](Access.Label.BackShade.md)
- [BackStyle](Access.Label.BackStyle.md)
- [BackThemeColorIndex](Access.Label.BackThemeColorIndex.md)
- [BackTint](Access.Label.BackTint.md)
- [BorderColor](Access.Label.BorderColor.md)
- [BorderShade](Access.Label.BorderShade.md)
- [BorderStyle](Access.Label.BorderStyle.md)
- [BorderThemeColorIndex](Access.Label.BorderThemeColorIndex.md)
- [BorderTint](Access.Label.BorderTint.md)
- [BorderWidth](Access.Label.BorderWidth.md)
- [BottomMargin](Access.Label.BottomMargin.md)
- [BottomPadding](Access.Label.BottomPadding.md)
- [Caption](Access.Label.Caption.md)
- [ControlTipText](Access.Label.ControlTipText.md)
- [ControlType](Access.Label.ControlType.md)
- [DisplayWhen](Access.Label.DisplayWhen.md)
- [EventProcPrefix](Access.Label.EventProcPrefix.md)
- [FontBold](Access.Label.FontBold.md)
- [FontItalic](Access.Label.FontItalic.md)
- [FontName](Access.Label.FontName.md)
- [FontSize](Access.Label.FontSize.md)
- [FontUnderline](Access.Label.FontUnderline.md)
- [FontWeight](Access.Label.FontWeight.md)
- [ForeColor](Access.Label.ForeColor.md)
- [ForeShade](Access.Label.ForeShade.md)
- [ForeThemeColorIndex](Access.Label.ForeThemeColorIndex.md)
- [ForeTint](Access.Label.ForeTint.md)
- [GridlineColor](Access.Label.GridlineColor.md)
- [GridlineShade](Access.Label.GridlineShade.md)
- [GridlineStyleBottom](Access.Label.GridlineStyleBottom.md)
- [GridlineStyleLeft](Access.Label.GridlineStyleLeft.md)
- [GridlineStyleRight](Access.Label.GridlineStyleRight.md)
- [GridlineStyleTop](Access.Label.GridlineStyleTop.md)
- [GridlineThemeColorIndex](Access.Label.GridlineThemeColorIndex.md)
- [GridlineTint](Access.Label.GridlineTint.md)
- [GridlineWidthBottom](Access.Label.GridlineWidthBottom.md)
- [GridlineWidthLeft](Access.Label.GridlineWidthLeft.md)
- [GridlineWidthRight](Access.Label.GridlineWidthRight.md)
- [GridlineWidthTop](Access.Label.GridlineWidthTop.md)
- [Height](Access.Label.Height.md)
- [HelpContextId](Access.Label.HelpContextId.md)
- [HorizontalAnchor](Access.Label.HorizontalAnchor.md)
- [Hyperlink](Access.Label.Hyperlink.md)
- [HyperlinkAddress](Access.Label.HyperlinkAddress.md)
- [HyperlinkSubAddress](Access.Label.HyperlinkSubAddress.md)
- [InSelection](Access.Label.InSelection.md)
- [IsVisible](Access.Label.IsVisible.md)
- [Layout](Access.Label.Layout.md)
- [LayoutID](Access.Label.LayoutID.md)
- [Left](Access.Label.Left.md)
- [LeftMargin](Access.Label.LeftMargin.md)
- [LeftPadding](Access.Label.LeftPadding.md)
- [LineSpacing](Access.Label.LineSpacing.md)
- [Name](Access.Label.Name.md)
- [NumeralShapes](Access.Label.NumeralShapes.md)
- [OldBorderStyle](Access.Label.OldBorderStyle.md)
- [OnClick](Access.Label.OnClick.md)
- [OnDblClick](Access.Label.OnDblClick.md)
- [OnMouseDown](Access.Label.OnMouseDown.md)
- [OnMouseMove](Access.Label.OnMouseMove.md)
- [OnMouseUp](Access.Label.OnMouseUp.md)
- [Parent](Access.Label.Parent.md)
- [Properties](Access.Label.Properties.md)
- [ReadingOrder](Access.Label.ReadingOrder.md)
- [RightMargin](Access.Label.RightMargin.md)
- [RightPadding](Access.Label.RightPadding.md)
- [Section](Access.Label.Section.md)
- [ShortcutMenuBar](Access.Label.ShortcutMenuBar.md)
- [SmartTags](Access.Label.SmartTags.md)
- [SpecialEffect](Access.Label.SpecialEffect.md)
- [Tag](Access.Label.Tag.md)
- [TextAlign](Access.Label.TextAlign.md)
- [ThemeFontIndex](Access.Label.ThemeFontIndex.md)
- [Top](Access.Label.Top.md)
- [TopMargin](Access.Label.TopMargin.md)
- [TopPadding](Access.Label.TopPadding.md)
- [Vertical](Access.Label.Vertical.md)
- [VerticalAnchor](Access.Label.VerticalAnchor.md)
- [Visible](Access.Label.Visible.md)
- [Width](Access.Label.Width.md)

## See also

- [Access Object Model Reference](overview/Access/object-model.md)



[!include[Support and feedback](~/includes/feedback-boilerplate.md)]

"
Class {
	#name : #JinControlLabel,
	#superclass : #JinControlAbstractLabel,
	#category : #'Jindao-DomainObjects-GeneratedControls'
}

{ #category : #generated }
JinControlLabel class >> mappedTypeName [
	^#'_Label'
]

{ #category : #generated }
JinControlLabel >> acceptVisitor: aVisitor [
	^ aVisitor visitLabel: self
]

{ #category : #'property - generated' }
JinControlLabel >> application [
<getter>
	^ (handle propertyNamed: #'Application' ).

]

{ #category : #'property - generated' }
JinControlLabel >> backColor [
<getter>
	^ (handle propertyNamed: #'BackColor' ).

]

{ #category : #'property - generated' }
JinControlLabel >> backColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> backShade [
<getter>
	^ (handle propertyNamed: #'BackShade' ).

]

{ #category : #'property - generated' }
JinControlLabel >> backShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> backStyle [
<getter>
	^ (handle propertyNamed: #'BackStyle' ).

]

{ #category : #'property - generated' }
JinControlLabel >> backStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> backThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'BackThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinControlLabel >> backThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> backTint [
<getter>
	^ (handle propertyNamed: #'BackTint' ).

]

{ #category : #'property - generated' }
JinControlLabel >> backTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> borderColor [
<getter>
	^ (handle propertyNamed: #'BorderColor' ).

]

{ #category : #'property - generated' }
JinControlLabel >> borderColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> borderShade [
<getter>
	^ (handle propertyNamed: #'BorderShade' ).

]

{ #category : #'property - generated' }
JinControlLabel >> borderShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> borderStyle [
<getter>
	^ (handle propertyNamed: #'BorderStyle' ).

]

{ #category : #'property - generated' }
JinControlLabel >> borderStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> borderThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'BorderThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinControlLabel >> borderThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> borderTint [
<getter>
	^ (handle propertyNamed: #'BorderTint' ).

]

{ #category : #'property - generated' }
JinControlLabel >> borderTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> borderWidth [
<getter>
	^ (handle propertyNamed: #'BorderWidth' ).

]

{ #category : #'property - generated' }
JinControlLabel >> borderWidth: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderWidth' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> bottomMargin [
<getter>
	^ (handle propertyNamed: #'BottomMargin' ).

]

{ #category : #'property - generated' }
JinControlLabel >> bottomMargin: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BottomMargin' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> bottomPadding [
<getter>
	^ (handle propertyNamed: #'BottomPadding' ).

]

{ #category : #'property - generated' }
JinControlLabel >> bottomPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BottomPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> caption [
<getter>
	^ (handle propertyNamed: #'Caption' ).

]

{ #category : #'property - generated' }
JinControlLabel >> caption: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Caption' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> controlTipText [
<getter>
	^ (handle propertyNamed: #'ControlTipText' ).

]

{ #category : #'property - generated' }
JinControlLabel >> controlTipText: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlTipText' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> controlType [
<getter>
	^ (handle propertyNamed: #'ControlType' ).

]

{ #category : #'property - generated' }
JinControlLabel >> controlType: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlType' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> displayWhen [
<getter>
	^ (handle propertyNamed: #'DisplayWhen' ).

]

{ #category : #'property - generated' }
JinControlLabel >> displayWhen: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DisplayWhen' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> eventProcPrefix [
<getter>
	^ (handle propertyNamed: #'EventProcPrefix' ).

]

{ #category : #'property - generated' }
JinControlLabel >> eventProcPrefix: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'EventProcPrefix' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> fontBold [
<getter>
	^ (handle propertyNamed: #'FontBold' ).

]

{ #category : #'property - generated' }
JinControlLabel >> fontBold: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontBold' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> fontItalic [
<getter>
	^ (handle propertyNamed: #'FontItalic' ).

]

{ #category : #'property - generated' }
JinControlLabel >> fontItalic: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontItalic' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> fontName [
<getter>
	^ (handle propertyNamed: #'FontName' ).

]

{ #category : #'property - generated' }
JinControlLabel >> fontName: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontName' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> fontSize [
<getter>
	^ (handle propertyNamed: #'FontSize' ).

]

{ #category : #'property - generated' }
JinControlLabel >> fontSize: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontSize' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> fontUnderline [
<getter>
	^ (handle propertyNamed: #'FontUnderline' ).

]

{ #category : #'property - generated' }
JinControlLabel >> fontUnderline: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontUnderline' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> fontWeight [
<getter>
	^ (handle propertyNamed: #'FontWeight' ).

]

{ #category : #'property - generated' }
JinControlLabel >> fontWeight: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontWeight' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> foreColor [
<getter>
	^ (handle propertyNamed: #'ForeColor' ).

]

{ #category : #'property - generated' }
JinControlLabel >> foreColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ForeColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> foreShade [
<getter>
	^ (handle propertyNamed: #'ForeShade' ).

]

{ #category : #'property - generated' }
JinControlLabel >> foreShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ForeShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> foreThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'ForeThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinControlLabel >> foreThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ForeThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> foreTint [
<getter>
	^ (handle propertyNamed: #'ForeTint' ).

]

{ #category : #'property - generated' }
JinControlLabel >> foreTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ForeTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> gridlineColor [
<getter>
	^ (handle propertyNamed: #'GridlineColor' ).

]

{ #category : #'property - generated' }
JinControlLabel >> gridlineColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> gridlineShade [
<getter>
	^ (handle propertyNamed: #'GridlineShade' ).

]

{ #category : #'property - generated' }
JinControlLabel >> gridlineShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> gridlineStyleBottom [
<getter>
	^ (handle propertyNamed: #'GridlineStyleBottom' ).

]

{ #category : #'property - generated' }
JinControlLabel >> gridlineStyleBottom: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleBottom' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> gridlineStyleLeft [
<getter>
	^ (handle propertyNamed: #'GridlineStyleLeft' ).

]

{ #category : #'property - generated' }
JinControlLabel >> gridlineStyleLeft: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleLeft' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> gridlineStyleRight [
<getter>
	^ (handle propertyNamed: #'GridlineStyleRight' ).

]

{ #category : #'property - generated' }
JinControlLabel >> gridlineStyleRight: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleRight' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> gridlineStyleTop [
<getter>
	^ (handle propertyNamed: #'GridlineStyleTop' ).

]

{ #category : #'property - generated' }
JinControlLabel >> gridlineStyleTop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleTop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> gridlineThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'GridlineThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinControlLabel >> gridlineThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> gridlineTint [
<getter>
	^ (handle propertyNamed: #'GridlineTint' ).

]

{ #category : #'property - generated' }
JinControlLabel >> gridlineTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> gridlineWidthBottom [
<getter>
	^ (handle propertyNamed: #'GridlineWidthBottom' ).

]

{ #category : #'property - generated' }
JinControlLabel >> gridlineWidthBottom: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthBottom' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> gridlineWidthLeft [
<getter>
	^ (handle propertyNamed: #'GridlineWidthLeft' ).

]

{ #category : #'property - generated' }
JinControlLabel >> gridlineWidthLeft: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthLeft' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> gridlineWidthRight [
<getter>
	^ (handle propertyNamed: #'GridlineWidthRight' ).

]

{ #category : #'property - generated' }
JinControlLabel >> gridlineWidthRight: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthRight' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> gridlineWidthTop [
<getter>
	^ (handle propertyNamed: #'GridlineWidthTop' ).

]

{ #category : #'property - generated' }
JinControlLabel >> gridlineWidthTop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthTop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> height [
<getter>
	^ (handle propertyNamed: #'Height' ).

]

{ #category : #'property - generated' }
JinControlLabel >> height: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Height' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> helpContextId [
<getter>
	^ (handle propertyNamed: #'HelpContextId' ).

]

{ #category : #'property - generated' }
JinControlLabel >> helpContextId: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HelpContextId' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> horizontalAnchor [
<getter>
	^ (handle propertyNamed: #'HorizontalAnchor' ).

]

{ #category : #'property - generated' }
JinControlLabel >> horizontalAnchor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HorizontalAnchor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> hyperlink [
<getter>
	^ (handle propertyNamed: #'Hyperlink' ).

]

{ #category : #'property - generated' }
JinControlLabel >> hyperlinkAddress [
<getter>
	^ (handle propertyNamed: #'HyperlinkAddress' ).

]

{ #category : #'property - generated' }
JinControlLabel >> hyperlinkAddress: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HyperlinkAddress' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> hyperlinkSubAddress [
<getter>
	^ (handle propertyNamed: #'HyperlinkSubAddress' ).

]

{ #category : #'property - generated' }
JinControlLabel >> hyperlinkSubAddress: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HyperlinkSubAddress' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> inSelection [
<getter>
	^ (handle propertyNamed: #'InSelection' ).

]

{ #category : #'property - generated' }
JinControlLabel >> inSelection: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'InSelection' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> isVisible [
<getter>
	^ (handle propertyNamed: #'IsVisible' ).

]

{ #category : #'property - generated' }
JinControlLabel >> isVisible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IsVisible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> layout [
<getter>
	^ (handle propertyNamed: #'Layout' ).

]

{ #category : #'property - generated' }
JinControlLabel >> layoutID [
<getter>
	^ (handle propertyNamed: #'LayoutID' ).

]

{ #category : #'property - generated' }
JinControlLabel >> left [
<getter>
	^ (handle propertyNamed: #'Left' ).

]

{ #category : #'property - generated' }
JinControlLabel >> left: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Left' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> leftMargin [
<getter>
	^ (handle propertyNamed: #'LeftMargin' ).

]

{ #category : #'property - generated' }
JinControlLabel >> leftMargin: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LeftMargin' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> leftPadding [
<getter>
	^ (handle propertyNamed: #'LeftPadding' ).

]

{ #category : #'property - generated' }
JinControlLabel >> leftPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LeftPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> lineSpacing [
<getter>
	^ (handle propertyNamed: #'LineSpacing' ).

]

{ #category : #'property - generated' }
JinControlLabel >> lineSpacing: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LineSpacing' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlLabel >> move: aLeft top: aTop width: aWidth height: aHeight [
<method>
"This method can be called with optional parameters. Top,Width,Height"
	^ (handle dispatch: #'Move' withArguments: {aLeft . aTop . aWidth . aHeight} ).

]

{ #category : #'property - generated' }
JinControlLabel >> name [
<getter>
	^ (handle propertyNamed: #'Name' ).

]

{ #category : #'property - generated' }
JinControlLabel >> name: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Name' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> numeralShapes [
<getter>
	^ (handle propertyNamed: #'NumeralShapes' ).

]

{ #category : #'property - generated' }
JinControlLabel >> numeralShapes: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'NumeralShapes' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> oldBorderStyle [
<getter>
	^ (handle propertyNamed: #'OldBorderStyle' ).

]

{ #category : #'property - generated' }
JinControlLabel >> oldBorderStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OldBorderStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> onClick [
<getter>
	^ (handle propertyNamed: #'OnClick' ).

]

{ #category : #'property - generated' }
JinControlLabel >> onClick: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnClick' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> onDblClick [
<getter>
	^ (handle propertyNamed: #'OnDblClick' ).

]

{ #category : #'property - generated' }
JinControlLabel >> onDblClick: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnDblClick' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> onMouseDown [
<getter>
	^ (handle propertyNamed: #'OnMouseDown' ).

]

{ #category : #'property - generated' }
JinControlLabel >> onMouseDown: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseDown' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> onMouseMove [
<getter>
	^ (handle propertyNamed: #'OnMouseMove' ).

]

{ #category : #'property - generated' }
JinControlLabel >> onMouseMove: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseMove' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> onMouseUp [
<getter>
	^ (handle propertyNamed: #'OnMouseUp' ).

]

{ #category : #'property - generated' }
JinControlLabel >> onMouseUp: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseUp' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> parent [
<getter>
	^ (handle propertyNamed: #'Parent' ).

]

{ #category : #'property - generated' }
JinControlLabel >> properties [
<getter>
	^ (handle propertyNamed: #'Properties' ).

]

{ #category : #'property - generated' }
JinControlLabel >> readingOrder [
<getter>
	^ (handle propertyNamed: #'ReadingOrder' ).

]

{ #category : #'property - generated' }
JinControlLabel >> readingOrder: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ReadingOrder' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> rightMargin [
<getter>
	^ (handle propertyNamed: #'RightMargin' ).

]

{ #category : #'property - generated' }
JinControlLabel >> rightMargin: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'RightMargin' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> rightPadding [
<getter>
	^ (handle propertyNamed: #'RightPadding' ).

]

{ #category : #'property - generated' }
JinControlLabel >> rightPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'RightPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> section [
<getter>
	^ (handle propertyNamed: #'Section' ).

]

{ #category : #'property - generated' }
JinControlLabel >> section: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Section' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> shortcutMenuBar [
<getter>
	^ (handle propertyNamed: #'ShortcutMenuBar' ).

]

{ #category : #'property - generated' }
JinControlLabel >> shortcutMenuBar: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ShortcutMenuBar' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlLabel >> sizeToFit [
<method>
	^ (handle dispatch: #'SizeToFit' ).

]

{ #category : #'property - generated' }
JinControlLabel >> smartTags [
<getter>
	^ (handle propertyNamed: #'SmartTags' ).

]

{ #category : #'property - generated' }
JinControlLabel >> specialEffect [
<getter>
	^ (handle propertyNamed: #'SpecialEffect' ).

]

{ #category : #'property - generated' }
JinControlLabel >> specialEffect: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'SpecialEffect' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> tag [
<getter>
	^ (handle propertyNamed: #'Tag' ).

]

{ #category : #'property - generated' }
JinControlLabel >> tag: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Tag' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> textAlign [
<getter>
	^ (handle propertyNamed: #'TextAlign' ).

]

{ #category : #'property - generated' }
JinControlLabel >> textAlign: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TextAlign' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> themeFontIndex [
<getter>
	^ (handle propertyNamed: #'ThemeFontIndex' ).

]

{ #category : #'property - generated' }
JinControlLabel >> themeFontIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ThemeFontIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> top [
<getter>
	^ (handle propertyNamed: #'Top' ).

]

{ #category : #'property - generated' }
JinControlLabel >> top: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Top' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> topMargin [
<getter>
	^ (handle propertyNamed: #'TopMargin' ).

]

{ #category : #'property - generated' }
JinControlLabel >> topMargin: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TopMargin' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> topPadding [
<getter>
	^ (handle propertyNamed: #'TopPadding' ).

]

{ #category : #'property - generated' }
JinControlLabel >> topPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TopPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> vertical [
<getter>
	^ (handle propertyNamed: #'Vertical' ).

]

{ #category : #'property - generated' }
JinControlLabel >> vertical: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Vertical' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> verticalAnchor [
<getter>
	^ (handle propertyNamed: #'VerticalAnchor' ).

]

{ #category : #'property - generated' }
JinControlLabel >> verticalAnchor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'VerticalAnchor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> visible [
<getter>
	^ (handle propertyNamed: #'Visible' ).

]

{ #category : #'property - generated' }
JinControlLabel >> visible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Visible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLabel >> width [
<getter>
	^ (handle propertyNamed: #'Width' ).

]

{ #category : #'property - generated' }
JinControlLabel >> width: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Width' withArguments: {aParam1} ).

]
