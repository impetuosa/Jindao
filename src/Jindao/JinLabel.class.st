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
	#name : #JinLabel,
	#superclass : #JinControlAbstractLabel,
	#category : #'Jindao-FormControls-Generated'
}

{ #category : #generated }
JinLabel class >> mappedTypeName [
	^#'_Label'
]

{ #category : #generated }
JinLabel class >> propertiesToInfuse [
	^ #(BackColor
BackShade
BackStyle
BackThemeColorIndex
BackTint
BorderColor
BorderShade
BorderStyle
BorderThemeColorIndex
BorderTint
BorderWidth
BottomMargin
BottomPadding
Caption
ControlTipText
ControlType
DisplayWhen
EventProcPrefix
FontBold
FontItalic
FontName
FontSize
FontUnderline
FontWeight
ForeColor
ForeShade
ForeThemeColorIndex
ForeTint
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
HyperlinkAddress
HyperlinkSubAddress
InSelection
IsVisible
Left
LeftMargin
LeftPadding
LineSpacing
Name
NumeralShapes
OldBorderStyle
OnClick
OnDblClick
OnMouseDown
OnMouseMove
OnMouseUp
'OnClickMacro' 'OnDblClickMacro' 'OnMouseDownMacro' 'OnMouseMoveMacro' 'OnMouseUpMacro'
ReadingOrder
RightMargin
RightPadding
Section
ShortcutMenuBar
SmartTags
SpecialEffect
Tag
TextAlign
ThemeFontIndex
Top
TopMargin
TopPadding
Vertical
VerticalAnchor
Visible
Width)
]

{ #category : #generated }
JinLabel >> acceptVisitor: aVisitor [
	^ aVisitor visitLabel: self
]

{ #category : #'property - generated' }
JinLabel >> application [
<getter>
	^ (handle propertyNamed: #'Application' ).

]

{ #category : #'property - generated' }
JinLabel >> backColor [
<getter>
	^ (handle propertyNamed: #'BackColor' ).

]

{ #category : #'property - generated' }
JinLabel >> backColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> backShade [
<getter>
	^ (handle propertyNamed: #'BackShade' ).

]

{ #category : #'property - generated' }
JinLabel >> backShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> backStyle [
<getter>
	^ (handle propertyNamed: #'BackStyle' ).

]

{ #category : #'property - generated' }
JinLabel >> backStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> backThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'BackThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinLabel >> backThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> backTint [
<getter>
	^ (handle propertyNamed: #'BackTint' ).

]

{ #category : #'property - generated' }
JinLabel >> backTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> borderColor [
<getter>
	^ (handle propertyNamed: #'BorderColor' ).

]

{ #category : #'property - generated' }
JinLabel >> borderColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> borderShade [
<getter>
	^ (handle propertyNamed: #'BorderShade' ).

]

{ #category : #'property - generated' }
JinLabel >> borderShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> borderStyle [
<getter>
	^ (handle propertyNamed: #'BorderStyle' ).

]

{ #category : #'property - generated' }
JinLabel >> borderStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> borderThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'BorderThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinLabel >> borderThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> borderTint [
<getter>
	^ (handle propertyNamed: #'BorderTint' ).

]

{ #category : #'property - generated' }
JinLabel >> borderTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> borderWidth [
<getter>
	^ (handle propertyNamed: #'BorderWidth' ).

]

{ #category : #'property - generated' }
JinLabel >> borderWidth: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderWidth' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> bottomMargin [
<getter>
	^ (handle propertyNamed: #'BottomMargin' ).

]

{ #category : #'property - generated' }
JinLabel >> bottomMargin: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BottomMargin' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> bottomPadding [
<getter>
	^ (handle propertyNamed: #'BottomPadding' ).

]

{ #category : #'property - generated' }
JinLabel >> bottomPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BottomPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> caption [
<getter>
	^ (handle propertyNamed: #'Caption' ).

]

{ #category : #'property - generated' }
JinLabel >> caption: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Caption' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> controlTipText [
<getter>
	^ (handle propertyNamed: #'ControlTipText' ).

]

{ #category : #'property - generated' }
JinLabel >> controlTipText: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlTipText' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> controlType [
<getter>
	^ (handle propertyNamed: #'ControlType' ).

]

{ #category : #'property - generated' }
JinLabel >> controlType: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlType' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> displayWhen [
<getter>
	^ (handle propertyNamed: #'DisplayWhen' ).

]

{ #category : #'property - generated' }
JinLabel >> displayWhen: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DisplayWhen' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> eventProcPrefix [
<getter>
	^ (handle propertyNamed: #'EventProcPrefix' ).

]

{ #category : #'property - generated' }
JinLabel >> eventProcPrefix: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'EventProcPrefix' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> fontBold [
<getter>
	^ (handle propertyNamed: #'FontBold' ).

]

{ #category : #'property - generated' }
JinLabel >> fontBold: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontBold' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> fontItalic [
<getter>
	^ (handle propertyNamed: #'FontItalic' ).

]

{ #category : #'property - generated' }
JinLabel >> fontItalic: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontItalic' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> fontName [
<getter>
	^ (handle propertyNamed: #'FontName' ).

]

{ #category : #'property - generated' }
JinLabel >> fontName: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontName' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> fontSize [
<getter>
	^ (handle propertyNamed: #'FontSize' ).

]

{ #category : #'property - generated' }
JinLabel >> fontSize: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontSize' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> fontUnderline [
<getter>
	^ (handle propertyNamed: #'FontUnderline' ).

]

{ #category : #'property - generated' }
JinLabel >> fontUnderline: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontUnderline' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> fontWeight [
<getter>
	^ (handle propertyNamed: #'FontWeight' ).

]

{ #category : #'property - generated' }
JinLabel >> fontWeight: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontWeight' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> foreColor [
<getter>
	^ (handle propertyNamed: #'ForeColor' ).

]

{ #category : #'property - generated' }
JinLabel >> foreColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ForeColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> foreShade [
<getter>
	^ (handle propertyNamed: #'ForeShade' ).

]

{ #category : #'property - generated' }
JinLabel >> foreShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ForeShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> foreThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'ForeThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinLabel >> foreThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ForeThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> foreTint [
<getter>
	^ (handle propertyNamed: #'ForeTint' ).

]

{ #category : #'property - generated' }
JinLabel >> foreTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ForeTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> gridlineColor [
<getter>
	^ (handle propertyNamed: #'GridlineColor' ).

]

{ #category : #'property - generated' }
JinLabel >> gridlineColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> gridlineShade [
<getter>
	^ (handle propertyNamed: #'GridlineShade' ).

]

{ #category : #'property - generated' }
JinLabel >> gridlineShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> gridlineStyleBottom [
<getter>
	^ (handle propertyNamed: #'GridlineStyleBottom' ).

]

{ #category : #'property - generated' }
JinLabel >> gridlineStyleBottom: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleBottom' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> gridlineStyleLeft [
<getter>
	^ (handle propertyNamed: #'GridlineStyleLeft' ).

]

{ #category : #'property - generated' }
JinLabel >> gridlineStyleLeft: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleLeft' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> gridlineStyleRight [
<getter>
	^ (handle propertyNamed: #'GridlineStyleRight' ).

]

{ #category : #'property - generated' }
JinLabel >> gridlineStyleRight: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleRight' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> gridlineStyleTop [
<getter>
	^ (handle propertyNamed: #'GridlineStyleTop' ).

]

{ #category : #'property - generated' }
JinLabel >> gridlineStyleTop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleTop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> gridlineThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'GridlineThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinLabel >> gridlineThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> gridlineTint [
<getter>
	^ (handle propertyNamed: #'GridlineTint' ).

]

{ #category : #'property - generated' }
JinLabel >> gridlineTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> gridlineWidthBottom [
<getter>
	^ (handle propertyNamed: #'GridlineWidthBottom' ).

]

{ #category : #'property - generated' }
JinLabel >> gridlineWidthBottom: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthBottom' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> gridlineWidthLeft [
<getter>
	^ (handle propertyNamed: #'GridlineWidthLeft' ).

]

{ #category : #'property - generated' }
JinLabel >> gridlineWidthLeft: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthLeft' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> gridlineWidthRight [
<getter>
	^ (handle propertyNamed: #'GridlineWidthRight' ).

]

{ #category : #'property - generated' }
JinLabel >> gridlineWidthRight: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthRight' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> gridlineWidthTop [
<getter>
	^ (handle propertyNamed: #'GridlineWidthTop' ).

]

{ #category : #'property - generated' }
JinLabel >> gridlineWidthTop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthTop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> height [
<getter>
	^ (handle propertyNamed: #'Height' ).

]

{ #category : #'property - generated' }
JinLabel >> height: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Height' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> helpContextId [
<getter>
	^ (handle propertyNamed: #'HelpContextId' ).

]

{ #category : #'property - generated' }
JinLabel >> helpContextId: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HelpContextId' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> horizontalAnchor [
<getter>
	^ (handle propertyNamed: #'HorizontalAnchor' ).

]

{ #category : #'property - generated' }
JinLabel >> horizontalAnchor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HorizontalAnchor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> hyperlink [
<getter>
	^ (handle propertyNamed: #'Hyperlink' ).

]

{ #category : #'property - generated' }
JinLabel >> hyperlinkAddress [
<getter>
	^ (handle propertyNamed: #'HyperlinkAddress' ).

]

{ #category : #'property - generated' }
JinLabel >> hyperlinkAddress: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HyperlinkAddress' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> hyperlinkSubAddress [
<getter>
	^ (handle propertyNamed: #'HyperlinkSubAddress' ).

]

{ #category : #'property - generated' }
JinLabel >> hyperlinkSubAddress: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HyperlinkSubAddress' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> inSelection [
<getter>
	^ (handle propertyNamed: #'InSelection' ).

]

{ #category : #'property - generated' }
JinLabel >> inSelection: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'InSelection' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> isVisible [
<getter>
	^ (handle propertyNamed: #'IsVisible' ).

]

{ #category : #'property - generated' }
JinLabel >> isVisible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IsVisible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> layout [
<getter>
	^ (handle propertyNamed: #'Layout' ).

]

{ #category : #'property - generated' }
JinLabel >> layoutID [
<getter>
	^ (handle propertyNamed: #'LayoutID' ).

]

{ #category : #'property - generated' }
JinLabel >> left [
<getter>
	^ (handle propertyNamed: #'Left' ).

]

{ #category : #'property - generated' }
JinLabel >> left: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Left' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> leftMargin [
<getter>
	^ (handle propertyNamed: #'LeftMargin' ).

]

{ #category : #'property - generated' }
JinLabel >> leftMargin: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LeftMargin' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> leftPadding [
<getter>
	^ (handle propertyNamed: #'LeftPadding' ).

]

{ #category : #'property - generated' }
JinLabel >> leftPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LeftPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> lineSpacing [
<getter>
	^ (handle propertyNamed: #'LineSpacing' ).

]

{ #category : #'property - generated' }
JinLabel >> lineSpacing: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LineSpacing' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinLabel >> move: aLeft top: aTop width: aWidth height: aHeight [
<method>
"This method can be called with optional parameters. Top,Width,Height"
	^ (handle dispatch: #'Move' withArguments: {aLeft . aTop . aWidth . aHeight} ).

]

{ #category : #'property - generated' }
JinLabel >> name: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Name' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> numeralShapes [
<getter>
	^ (handle propertyNamed: #'NumeralShapes' ).

]

{ #category : #'property - generated' }
JinLabel >> numeralShapes: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'NumeralShapes' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> oldBorderStyle [
<getter>
	^ (handle propertyNamed: #'OldBorderStyle' ).

]

{ #category : #'property - generated' }
JinLabel >> oldBorderStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OldBorderStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> onClick [
<getter>
	^ (handle propertyNamed: #'OnClick' ).

]

{ #category : #'property - generated' }
JinLabel >> onClick: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnClick' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> onDblClick [
<getter>
	^ (handle propertyNamed: #'OnDblClick' ).

]

{ #category : #'property - generated' }
JinLabel >> onDblClick: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnDblClick' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> onMouseDown [
<getter>
	^ (handle propertyNamed: #'OnMouseDown' ).

]

{ #category : #'property - generated' }
JinLabel >> onMouseDown: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseDown' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> onMouseMove [
<getter>
	^ (handle propertyNamed: #'OnMouseMove' ).

]

{ #category : #'property - generated' }
JinLabel >> onMouseMove: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseMove' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> onMouseUp [
<getter>
	^ (handle propertyNamed: #'OnMouseUp' ).

]

{ #category : #'property - generated' }
JinLabel >> onMouseUp: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseUp' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> readingOrder [
<getter>
	^ (handle propertyNamed: #'ReadingOrder' ).

]

{ #category : #'property - generated' }
JinLabel >> readingOrder: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ReadingOrder' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> rightMargin [
<getter>
	^ (handle propertyNamed: #'RightMargin' ).

]

{ #category : #'property - generated' }
JinLabel >> rightMargin: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'RightMargin' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> rightPadding [
<getter>
	^ (handle propertyNamed: #'RightPadding' ).

]

{ #category : #'property - generated' }
JinLabel >> rightPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'RightPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> section [
<getter>
	^ (handle propertyNamed: #'Section' ).

]

{ #category : #'property - generated' }
JinLabel >> section: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Section' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> shortcutMenuBar [
<getter>
	^ (handle propertyNamed: #'ShortcutMenuBar' ).

]

{ #category : #'property - generated' }
JinLabel >> shortcutMenuBar: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ShortcutMenuBar' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinLabel >> sizeToFit [
<method>
	^ (handle dispatch: #'SizeToFit' ).

]

{ #category : #'property - generated' }
JinLabel >> smartTags [
<getter>
	^ (handle propertyNamed: #'SmartTags' ).

]

{ #category : #'property - generated' }
JinLabel >> specialEffect [
<getter>
	^ (handle propertyNamed: #'SpecialEffect' ).

]

{ #category : #'property - generated' }
JinLabel >> specialEffect: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'SpecialEffect' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> tag [
<getter>
	^ (handle propertyNamed: #'Tag' ).

]

{ #category : #'property - generated' }
JinLabel >> tag: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Tag' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> textAlign [
<getter>
	^ (handle propertyNamed: #'TextAlign' ).

]

{ #category : #'property - generated' }
JinLabel >> textAlign: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TextAlign' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> themeFontIndex [
<getter>
	^ (handle propertyNamed: #'ThemeFontIndex' ).

]

{ #category : #'property - generated' }
JinLabel >> themeFontIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ThemeFontIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> top [
<getter>
	^ (handle propertyNamed: #'Top' ).

]

{ #category : #'property - generated' }
JinLabel >> top: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Top' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> topMargin [
<getter>
	^ (handle propertyNamed: #'TopMargin' ).

]

{ #category : #'property - generated' }
JinLabel >> topMargin: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TopMargin' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> topPadding [
<getter>
	^ (handle propertyNamed: #'TopPadding' ).

]

{ #category : #'property - generated' }
JinLabel >> topPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TopPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> vertical [
<getter>
	^ (handle propertyNamed: #'Vertical' ).

]

{ #category : #'property - generated' }
JinLabel >> vertical: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Vertical' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> verticalAnchor [
<getter>
	^ (handle propertyNamed: #'VerticalAnchor' ).

]

{ #category : #'property - generated' }
JinLabel >> verticalAnchor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'VerticalAnchor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> visible [
<getter>
	^ (handle propertyNamed: #'Visible' ).

]

{ #category : #'property - generated' }
JinLabel >> visible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Visible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLabel >> width [
<getter>
	^ (handle propertyNamed: #'Width' ).

]

{ #category : #'property - generated' }
JinLabel >> width: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Width' withArguments: {aParam1} ).

]
