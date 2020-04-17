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
	#name : #JinControlLine,
	#superclass : #JinControlAbstractLine,
	#category : #'Jindao-DomainObjects-GeneratedControls'
}

{ #category : #generated }
JinControlLine class >> mappedTypeName [
	^#'_Line'
]

{ #category : #generated }
JinControlLine >> acceptVisitor: aVisitor [
	^ aVisitor visitLine: self
]

{ #category : #'property - generated' }
JinControlLine >> application [
<getter>
	^ (handle propertyNamed: #'Application' ).

]

{ #category : #'property - generated' }
JinControlLine >> borderColor [
<getter>
	^ (handle propertyNamed: #'BorderColor' ).

]

{ #category : #'property - generated' }
JinControlLine >> borderColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLine >> borderShade [
<getter>
	^ (handle propertyNamed: #'BorderShade' ).

]

{ #category : #'property - generated' }
JinControlLine >> borderShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLine >> borderStyle [
<getter>
	^ (handle propertyNamed: #'BorderStyle' ).

]

{ #category : #'property - generated' }
JinControlLine >> borderStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLine >> borderThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'BorderThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinControlLine >> borderThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLine >> borderTint [
<getter>
	^ (handle propertyNamed: #'BorderTint' ).

]

{ #category : #'property - generated' }
JinControlLine >> borderTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLine >> borderWidth [
<getter>
	^ (handle propertyNamed: #'BorderWidth' ).

]

{ #category : #'property - generated' }
JinControlLine >> borderWidth: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderWidth' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLine >> controlType [
<getter>
	^ (handle propertyNamed: #'ControlType' ).

]

{ #category : #'property - generated' }
JinControlLine >> controlType: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlType' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLine >> displayWhen [
<getter>
	^ (handle propertyNamed: #'DisplayWhen' ).

]

{ #category : #'property - generated' }
JinControlLine >> displayWhen: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DisplayWhen' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLine >> eventProcPrefix [
<getter>
	^ (handle propertyNamed: #'EventProcPrefix' ).

]

{ #category : #'property - generated' }
JinControlLine >> eventProcPrefix: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'EventProcPrefix' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLine >> height [
<getter>
	^ (handle propertyNamed: #'Height' ).

]

{ #category : #'property - generated' }
JinControlLine >> height: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Height' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLine >> horizontalAnchor [
<getter>
	^ (handle propertyNamed: #'HorizontalAnchor' ).

]

{ #category : #'property - generated' }
JinControlLine >> horizontalAnchor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HorizontalAnchor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLine >> inSelection [
<getter>
	^ (handle propertyNamed: #'InSelection' ).

]

{ #category : #'property - generated' }
JinControlLine >> inSelection: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'InSelection' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLine >> isVisible [
<getter>
	^ (handle propertyNamed: #'IsVisible' ).

]

{ #category : #'property - generated' }
JinControlLine >> isVisible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IsVisible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLine >> left [
<getter>
	^ (handle propertyNamed: #'Left' ).

]

{ #category : #'property - generated' }
JinControlLine >> left: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Left' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLine >> lineSlant [
<getter>
	^ (handle propertyNamed: #'LineSlant' ).

]

{ #category : #'property - generated' }
JinControlLine >> lineSlant: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LineSlant' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlLine >> move: aLeft top: aTop width: aWidth height: aHeight [
<method>
"This method can be called with optional parameters. Top,Width,Height"
	^ (handle dispatch: #'Move' withArguments: {aLeft . aTop . aWidth . aHeight} ).

]

{ #category : #'property - generated' }
JinControlLine >> name [
<getter>
	^ (handle propertyNamed: #'Name' ).

]

{ #category : #'property - generated' }
JinControlLine >> name: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Name' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLine >> oldBorderStyle [
<getter>
	^ (handle propertyNamed: #'OldBorderStyle' ).

]

{ #category : #'property - generated' }
JinControlLine >> oldBorderStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OldBorderStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLine >> parent [
<getter>
	^ (handle propertyNamed: #'Parent' ).

]

{ #category : #'property - generated' }
JinControlLine >> properties [
<getter>
	^ (handle propertyNamed: #'Properties' ).

]

{ #category : #'property - generated' }
JinControlLine >> section [
<getter>
	^ (handle propertyNamed: #'Section' ).

]

{ #category : #'property - generated' }
JinControlLine >> section: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Section' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlLine >> sizeToFit [
<method>
	^ (handle dispatch: #'SizeToFit' ).

]

{ #category : #'property - generated' }
JinControlLine >> specialEffect [
<getter>
	^ (handle propertyNamed: #'SpecialEffect' ).

]

{ #category : #'property - generated' }
JinControlLine >> specialEffect: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'SpecialEffect' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLine >> tag [
<getter>
	^ (handle propertyNamed: #'Tag' ).

]

{ #category : #'property - generated' }
JinControlLine >> tag: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Tag' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLine >> top [
<getter>
	^ (handle propertyNamed: #'Top' ).

]

{ #category : #'property - generated' }
JinControlLine >> top: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Top' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLine >> verticalAnchor [
<getter>
	^ (handle propertyNamed: #'VerticalAnchor' ).

]

{ #category : #'property - generated' }
JinControlLine >> verticalAnchor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'VerticalAnchor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLine >> visible [
<getter>
	^ (handle propertyNamed: #'Visible' ).

]

{ #category : #'property - generated' }
JinControlLine >> visible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Visible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlLine >> width [
<getter>
	^ (handle propertyNamed: #'Width' ).

]

{ #category : #'property - generated' }
JinControlLine >> width: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Width' withArguments: {aParam1} ).

]
