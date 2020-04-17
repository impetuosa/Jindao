"
---
title: Rectangle object (Access)
keywords: vbaac10.chm10320
f1_keywords:
- vbaac10.chm10320
ms.prod: access
api_name:
- Access.Rectangle
ms.assetid: ea624e43-c6a6-36ee-2b0b-4530a0cff3ef
ms.date: 03/21/2019
localization_priority: Normal
---


# Rectangle object (Access)

This object corresponds to a rectangle control. The rectangle control displays a rectangle on a form or report.


## Remarks

|Control|Tool|
|:------|:---|
|![Rectangle control](../images/t-rect_ZA06047747.gif)|![Rectangle tool](../images/rectangl_ZA06044569.gif)|

You can move a rectangle and the controls in it as a single unit by dragging the mouse pointer diagonally across the entire rectangle to select all the controls. The entire selection can then be moved to a new position.


## Events

- [Click](Access.Rectangle.Click.md)
- [DblClick](Access.Rectangle.DblClick.md)
- [MouseDown](Access.Rectangle.MouseDown.md)
- [MouseMove](Access.Rectangle.MouseMove.md)
- [MouseUp](Access.Rectangle.MouseUp.md)

## Methods

- [Move](Access.Rectangle.Move.md)
- [SizeToFit](Access.Rectangle.SizeToFit.md)

## Properties

- [Application](Access.Rectangle.Application.md)
- [BackColor](Access.Rectangle.BackColor.md)
- [BackShade](Access.Rectangle.BackShade.md)
- [BackStyle](Access.Rectangle.BackStyle.md)
- [BackThemeColorIndex](Access.Rectangle.BackThemeColorIndex.md)
- [BackTint](Access.Rectangle.BackTint.md)
- [BorderColor](Access.Rectangle.BorderColor.md)
- [BorderShade](Access.Rectangle.BorderShade.md)
- [BorderStyle](Access.Rectangle.BorderStyle.md)
- [BorderThemeColorIndex](Access.Rectangle.BorderThemeColorIndex.md)
- [BorderTint](Access.Rectangle.BorderTint.md)
- [BorderWidth](Access.Rectangle.BorderWidth.md)
- [ControlType](Access.Rectangle.ControlType.md)
- [DisplayWhen](Access.Rectangle.DisplayWhen.md)
- [EventProcPrefix](Access.Rectangle.EventProcPrefix.md)
- [Height](Access.Rectangle.Height.md)
- [HorizontalAnchor](Access.Rectangle.HorizontalAnchor.md)
- [InSelection](Access.Rectangle.InSelection.md)
- [IsVisible](Access.Rectangle.IsVisible.md)
- [Left](Access.Rectangle.Left.md)
- [Name](Access.Rectangle.Name.md)
- [OldBorderStyle](Access.Rectangle.OldBorderStyle.md)
- [OnClick](Access.Rectangle.OnClick.md)
- [OnDblClick](Access.Rectangle.OnDblClick.md)
- [OnMouseDown](Access.Rectangle.OnMouseDown.md)
- [OnMouseMove](Access.Rectangle.OnMouseMove.md)
- [OnMouseUp](Access.Rectangle.OnMouseUp.md)
- [Parent](Access.Rectangle.Parent.md)
- [Properties](Access.Rectangle.Properties.md)
- [Section](Access.Rectangle.Section.md)
- [SpecialEffect](Access.Rectangle.SpecialEffect.md)
- [Tag](Access.Rectangle.Tag.md)
- [Top](Access.Rectangle.Top.md)
- [VerticalAnchor](Access.Rectangle.VerticalAnchor.md)
- [Visible](Access.Rectangle.Visible.md)
- [Width](Access.Rectangle.Width.md)

## See also

- [Access Object Model Reference](overview/Access/object-model.md)


[!include[Support and feedback](~/includes/feedback-boilerplate.md)]
"
Class {
	#name : #JinControlRectangle,
	#superclass : #JinControlAbstractRectangle,
	#category : #'Jindao-DomainObjects-GeneratedControls'
}

{ #category : #generated }
JinControlRectangle class >> mappedTypeName [
	^#'_Rectangle'
]

{ #category : #generated }
JinControlRectangle >> acceptVisitor: aVisitor [
	^ aVisitor visitRectangle: self
]

{ #category : #'property - generated' }
JinControlRectangle >> application [
<getter>
	^ (handle propertyNamed: #'Application' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> backColor [
<getter>
	^ (handle propertyNamed: #'BackColor' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> backColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> backShade [
<getter>
	^ (handle propertyNamed: #'BackShade' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> backShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> backStyle [
<getter>
	^ (handle propertyNamed: #'BackStyle' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> backStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> backThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'BackThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> backThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> backTint [
<getter>
	^ (handle propertyNamed: #'BackTint' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> backTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> borderColor [
<getter>
	^ (handle propertyNamed: #'BorderColor' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> borderColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> borderShade [
<getter>
	^ (handle propertyNamed: #'BorderShade' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> borderShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> borderStyle [
<getter>
	^ (handle propertyNamed: #'BorderStyle' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> borderStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> borderThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'BorderThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> borderThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> borderTint [
<getter>
	^ (handle propertyNamed: #'BorderTint' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> borderTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> borderWidth [
<getter>
	^ (handle propertyNamed: #'BorderWidth' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> borderWidth: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderWidth' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> controlType [
<getter>
	^ (handle propertyNamed: #'ControlType' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> controlType: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlType' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> displayWhen [
<getter>
	^ (handle propertyNamed: #'DisplayWhen' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> displayWhen: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DisplayWhen' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> eventProcPrefix [
<getter>
	^ (handle propertyNamed: #'EventProcPrefix' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> eventProcPrefix: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'EventProcPrefix' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> height [
<getter>
	^ (handle propertyNamed: #'Height' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> height: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Height' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> horizontalAnchor [
<getter>
	^ (handle propertyNamed: #'HorizontalAnchor' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> horizontalAnchor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HorizontalAnchor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> inSelection [
<getter>
	^ (handle propertyNamed: #'InSelection' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> inSelection: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'InSelection' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> isVisible [
<getter>
	^ (handle propertyNamed: #'IsVisible' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> isVisible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IsVisible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> left [
<getter>
	^ (handle propertyNamed: #'Left' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> left: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Left' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlRectangle >> move: aLeft top: aTop width: aWidth height: aHeight [
<method>
"This method can be called with optional parameters. Top,Width,Height"
	^ (handle dispatch: #'Move' withArguments: {aLeft . aTop . aWidth . aHeight} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> name [
<getter>
	^ (handle propertyNamed: #'Name' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> name: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Name' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> oldBorderStyle [
<getter>
	^ (handle propertyNamed: #'OldBorderStyle' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> oldBorderStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OldBorderStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> onClick [
<getter>
	^ (handle propertyNamed: #'OnClick' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> onClick: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnClick' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> onDblClick [
<getter>
	^ (handle propertyNamed: #'OnDblClick' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> onDblClick: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnDblClick' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> onMouseDown [
<getter>
	^ (handle propertyNamed: #'OnMouseDown' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> onMouseDown: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseDown' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> onMouseMove [
<getter>
	^ (handle propertyNamed: #'OnMouseMove' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> onMouseMove: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseMove' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> onMouseUp [
<getter>
	^ (handle propertyNamed: #'OnMouseUp' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> onMouseUp: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseUp' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> parent [
<getter>
	^ (handle propertyNamed: #'Parent' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> properties [
<getter>
	^ (handle propertyNamed: #'Properties' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> section [
<getter>
	^ (handle propertyNamed: #'Section' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> section: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Section' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlRectangle >> sizeToFit [
<method>
	^ (handle dispatch: #'SizeToFit' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> specialEffect [
<getter>
	^ (handle propertyNamed: #'SpecialEffect' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> specialEffect: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'SpecialEffect' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> tag [
<getter>
	^ (handle propertyNamed: #'Tag' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> tag: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Tag' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> top [
<getter>
	^ (handle propertyNamed: #'Top' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> top: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Top' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> verticalAnchor [
<getter>
	^ (handle propertyNamed: #'VerticalAnchor' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> verticalAnchor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'VerticalAnchor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> visible [
<getter>
	^ (handle propertyNamed: #'Visible' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> visible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Visible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlRectangle >> width [
<getter>
	^ (handle propertyNamed: #'Width' ).

]

{ #category : #'property - generated' }
JinControlRectangle >> width: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Width' withArguments: {aParam1} ).

]
