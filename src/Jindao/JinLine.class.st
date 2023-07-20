"
---
title: Line object (Access)
keywords: vbaac10.chm10352
f1_keywords:
- vbaac10.chm10352
ms.prod: access
api_name:
- Access.Line
ms.assetid: b4a98150-1136-1a28-7d24-7029b371aee7
ms.date: 03/21/2019
localization_priority: Normal
---


# Line object (Access)

The line control displays a horizontal, vertical, or diagonal line on a form or report.


## Remarks

You can use the **BorderWidth** property to change the line width. You can use the **BorderColor** property to change the color of the border or make it transparent. You can change the line style (dots, dashes, and so on) of the border by using the **BorderStyle** property.


## Methods

- [Move](Access.Line.Move.md)
- [SizeToFit](Access.Line.SizeToFit.md)

## Properties

- [Application](Access.Line.Application.md)
- [BorderColor](Access.Line.BorderColor.md)
- [BorderShade](Access.Line.BorderShade.md)
- [BorderStyle](Access.Line.BorderStyle.md)
- [BorderThemeColorIndex](Access.Line.BorderThemeColorIndex.md)
- [BorderTint](Access.Line.BorderTint.md)
- [BorderWidth](Access.Line.BorderWidth.md)
- [ControlType](Access.Line.ControlType.md)
- [DisplayWhen](Access.Line.DisplayWhen.md)
- [EventProcPrefix](Access.Line.EventProcPrefix.md)
- [Height](Access.Line.Height.md)
- [HorizontalAnchor](Access.Line.HorizontalAnchor.md)
- [InSelection](Access.Line.InSelection.md)
- [IsVisible](Access.Line.IsVisible.md)
- [Left](Access.Line.Left.md)
- [LineSlant](Access.Line.LineSlant.md)
- [Name](Access.Line.Name.md)
- [OldBorderStyle](Access.Line.OldBorderStyle.md)
- [Parent](Access.Line.Parent.md)
- [Properties](Access.Line.Properties.md)
- [Section](Access.Line.Section.md)
- [SpecialEffect](Access.Line.SpecialEffect.md)
- [Tag](Access.Line.Tag.md)
- [Top](Access.Line.Top.md)
- [VerticalAnchor](Access.Line.VerticalAnchor.md)
- [Visible](Access.Line.Visible.md)
- [Width](Access.Line.Width.md)

## See also

- [Access Object Model Reference](overview/Access/object-model.md)


[!include[Support and feedback](~/includes/feedback-boilerplate.md)]
"
Class {
	#name : #JinLine,
	#superclass : #JinControlAbstractLine,
	#category : #'Jindao-FormControls-Builtin'
}

{ #category : #generated }
JinLine class >> componentKnownProperties [
	^ #(
    BorderColor
    BorderShade
    BorderStyle
    BorderThemeColorIndex
    BorderTint
    BorderWidth
    ControlType
    DisplayWhen
    EventProcPrefix
    Height
    HorizontalAnchor
    InSelection
    IsVisible
    Left
    LineSlant
    Name
    OldBorderStyle
    Section
    SpecialEffect
    Tag
    Top
    VerticalAnchor
    Visible
    Width
)
]

{ #category : #generated }
JinLine class >> mappedTypeName [
	^#'_Line'
]

{ #category : #generated }
JinLine >> acceptVisitor: aVisitor [

	<doc: 'Accepts visitor'>
	^ aVisitor visitLine: self
]

{ #category : #'property - generated' }
JinLine >> application [
<getter>
	^ (handle propertyNamed: #'Application' ).

]

{ #category : #'property - generated' }
JinLine >> borderColor [
<getter>
	^ (handle propertyNamed: #'BorderColor' ).

]

{ #category : #'property - generated' }
JinLine >> borderColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLine >> borderShade [
<getter>
	^ (handle propertyNamed: #'BorderShade' ).

]

{ #category : #'property - generated' }
JinLine >> borderShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLine >> borderStyle [
<getter>
	^ (handle propertyNamed: #'BorderStyle' ).

]

{ #category : #'property - generated' }
JinLine >> borderStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLine >> borderThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'BorderThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinLine >> borderThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLine >> borderTint [
<getter>
	^ (handle propertyNamed: #'BorderTint' ).

]

{ #category : #'property - generated' }
JinLine >> borderTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLine >> borderWidth [
<getter>
	^ (handle propertyNamed: #'BorderWidth' ).

]

{ #category : #'property - generated' }
JinLine >> borderWidth: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderWidth' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLine >> controlType [
<getter>
	^ (handle propertyNamed: #'ControlType' ).

]

{ #category : #'property - generated' }
JinLine >> controlType: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlType' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLine >> displayWhen [
<getter>
	^ (handle propertyNamed: #'DisplayWhen' ).

]

{ #category : #'property - generated' }
JinLine >> displayWhen: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DisplayWhen' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLine >> eventProcPrefix [
<getter>
	^ (handle propertyNamed: #'EventProcPrefix' ).

]

{ #category : #'property - generated' }
JinLine >> eventProcPrefix: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'EventProcPrefix' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLine >> height [
<getter>
	^ (handle propertyNamed: #'Height' ).

]

{ #category : #'property - generated' }
JinLine >> height: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Height' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLine >> horizontalAnchor [
<getter>
	^ (handle propertyNamed: #'HorizontalAnchor' ).

]

{ #category : #'property - generated' }
JinLine >> horizontalAnchor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HorizontalAnchor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLine >> inSelection [
<getter>
	^ (handle propertyNamed: #'InSelection' ).

]

{ #category : #'property - generated' }
JinLine >> inSelection: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'InSelection' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLine >> isVisible [
<getter>
	^ (handle propertyNamed: #'IsVisible' ).

]

{ #category : #'property - generated' }
JinLine >> isVisible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IsVisible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLine >> left [
<getter>
	^ (handle propertyNamed: #'Left' ).

]

{ #category : #'property - generated' }
JinLine >> left: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Left' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLine >> lineSlant [
<getter>
	^ (handle propertyNamed: #'LineSlant' ).

]

{ #category : #'property - generated' }
JinLine >> lineSlant: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LineSlant' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinLine >> move: aLeft top: aTop width: aWidth height: aHeight [
<method>
"This method can be called with optional parameters. Top,Width,Height"
	^ (handle dispatch: #'Move' withArguments: {aLeft . aTop . aWidth . aHeight} ).

]

{ #category : #'property - generated' }
JinLine >> name: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Name' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLine >> oldBorderStyle [
<getter>
	^ (handle propertyNamed: #'OldBorderStyle' ).

]

{ #category : #'property - generated' }
JinLine >> oldBorderStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OldBorderStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLine >> section [
<getter>
	^ (handle propertyNamed: #'Section' ).

]

{ #category : #'property - generated' }
JinLine >> section: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Section' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinLine >> sizeToFit [
<method>
	^ (handle dispatch: #'SizeToFit' ).

]

{ #category : #'property - generated' }
JinLine >> specialEffect [
<getter>
	^ (handle propertyNamed: #'SpecialEffect' ).

]

{ #category : #'property - generated' }
JinLine >> specialEffect: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'SpecialEffect' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLine >> tag [
<getter>
	^ (handle propertyNamed: #'Tag' ).

]

{ #category : #'property - generated' }
JinLine >> tag: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Tag' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLine >> top [
<getter>
	^ (handle propertyNamed: #'Top' ).

]

{ #category : #'property - generated' }
JinLine >> top: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Top' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLine >> verticalAnchor [
<getter>
	^ (handle propertyNamed: #'VerticalAnchor' ).

]

{ #category : #'property - generated' }
JinLine >> verticalAnchor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'VerticalAnchor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLine >> visible [
<getter>
	^ (handle propertyNamed: #'Visible' ).

]

{ #category : #'property - generated' }
JinLine >> visible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Visible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinLine >> width [
<getter>
	^ (handle propertyNamed: #'Width' ).

]

{ #category : #'property - generated' }
JinLine >> width: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Width' withArguments: {aParam1} ).

]
