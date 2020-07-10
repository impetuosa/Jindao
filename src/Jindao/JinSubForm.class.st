"
---
title: SubForm object (Access)
keywords: vbaac10.chm11985
f1_keywords:
- vbaac10.chm11985
ms.prod: access
api_name:
- Access.SubForm
ms.assetid: 60f961fa-dcf4-e1d1-8c50-9e88963f9dec
ms.date: 03/21/2019
localization_priority: Normal
---


# SubForm object (Access)

This object corresponds to a subform control. The subform control embeds a form in a form.


## Remarks

|Control|Tool|
|:------|:---|
|![Subform control](../images/t-subfrm_ZA06054004.gif)|![Subform tool](../images/subfrmrp_ZA06044634.gif)|

> [!NOTE]
> For example, you can use a form with a subform to present one-to-many relationships, such as one product category with the items that fall into that category. In this case, the main form can display the category ID, name, and description; the subform can display the available products in that category.

Instead of creating the main form, and then adding the subform control to it, you can simultaneously create the main form and subform with a wizard. You can also create a subform by dragging an existing form or report from the Database window to the main form.
    

## Events

- [Enter](Access.SubForm.Enter.md)
- [Exit](Access.SubForm.Exit.md)

## Methods

- [Move](Access.SubForm.Move.md)
- [Requery](Access.SubForm.Requery.md)
- [SetFocus](Access.SubForm.SetFocus.md)
- [SizeToFit](Access.SubForm.SizeToFit.md)

## Properties

- [AddColon](Access.SubForm.AddColon.md)
- [Application](Access.SubForm.Application.md)
- [AutoLabel](Access.SubForm.AutoLabel.md)
- [BorderColor](Access.SubForm.BorderColor.md)
- [BorderShade](Access.SubForm.BorderShade.md)
- [BorderStyle](Access.SubForm.BorderStyle.md)
- [BorderThemeColorIndex](Access.SubForm.BorderThemeColorIndex.md)
- [BorderTint](Access.SubForm.BorderTint.md)
- [BorderWidth](Access.SubForm.BorderWidth.md)
- [BottomPadding](Access.SubForm.BottomPadding.md)
- [CanGrow](Access.SubForm.CanGrow.md)
- [CanShrink](Access.SubForm.CanShrink.md)
- [Controls](Access.SubForm.Controls.md)
- [ControlType](Access.SubForm.ControlType.md)
- [DisplayWhen](Access.SubForm.DisplayWhen.md)
- [Enabled](Access.SubForm.Enabled.md)
- [EventProcPrefix](Access.SubForm.EventProcPrefix.md)
- [FilterOnEmptyMaster](Access.SubForm.FilterOnEmptyMaster.md)
- [Form](Access.SubForm.Form.md)
- [GridlineColor](Access.SubForm.GridlineColor.md)
- [GridlineShade](Access.SubForm.GridlineShade.md)
- [GridlineStyleBottom](Access.SubForm.GridlineStyleBottom.md)
- [GridlineStyleLeft](Access.SubForm.GridlineStyleLeft.md)
- [GridlineStyleRight](Access.SubForm.GridlineStyleRight.md)
- [GridlineStyleTop](Access.SubForm.GridlineStyleTop.md)
- [GridlineThemeColorIndex](Access.SubForm.GridlineThemeColorIndex.md)
- [GridlineTint](Access.SubForm.GridlineTint.md)
- [GridlineWidthBottom](Access.SubForm.GridlineWidthBottom.md)
- [GridlineWidthLeft](Access.SubForm.GridlineWidthLeft.md)
- [GridlineWidthRight](Access.SubForm.GridlineWidthRight.md)
- [GridlineWidthTop](Access.SubForm.GridlineWidthTop.md)
- [Height](Access.SubForm.Height.md)
- [HorizontalAnchor](Access.SubForm.HorizontalAnchor.md)
- [InSelection](Access.SubForm.InSelection.md)
- [IsVisible](Access.SubForm.IsVisible.md)
- [LabelAlign](Access.SubForm.LabelAlign.md)
- [LabelX](Access.SubForm.LabelX.md)
- [LabelY](Access.SubForm.LabelY.md)
- [Layout](Access.SubForm.Layout.md)
- [LayoutID](Access.SubForm.LayoutID.md)
- [Left](Access.SubForm.Left.md)
- [LeftPadding](Access.SubForm.LeftPadding.md)
- [LinkChildFields](Access.SubForm.LinkChildFields.md)
- [LinkMasterFields](Access.SubForm.LinkMasterFields.md)
- [Locked](Access.SubForm.Locked.md)
- [Name](Access.SubForm.Name.md)
- [OldBorderStyle](Access.SubForm.OldBorderStyle.md)
- [OnEnter](Access.SubForm.OnEnter.md)
- [OnExit](Access.SubForm.OnExit.md)
- [Parent](Access.SubForm.Parent.md)
- [Properties](Access.SubForm.Properties.md)
- [Report](Access.SubForm.Report.md)
- [RightPadding](Access.SubForm.RightPadding.md)
- [Section](Access.SubForm.Section.md)
- [SourceObject](Access.SubForm.SourceObject.md)
- [SpecialEffect](Access.SubForm.SpecialEffect.md)
- [StatusBarText](Access.SubForm.StatusBarText.md)
- [TabIndex](Access.SubForm.TabIndex.md)
- [TabStop](Access.SubForm.TabStop.md)
- [Tag](Access.SubForm.Tag.md)
- [Top](Access.SubForm.Top.md)
- [TopPadding](Access.SubForm.TopPadding.md)
- [VerticalAnchor](Access.SubForm.VerticalAnchor.md)
- [Visible](Access.SubForm.Visible.md)
- [Width](Access.SubForm.Width.md)


## See also

- [Access Object Model Reference](overview/Access/object-model.md)


[!include[Support and feedback](~/includes/feedback-boilerplate.md)]
"
Class {
	#name : #JinSubForm,
	#superclass : #JinControlAbstractSubForm,
	#category : #'Jindao-FormControls-Builtin'
}

{ #category : #generated }
JinSubForm class >> componentKnownProperties [
"https://docs.microsoft.com/en-us/office/vba/api/access.subform"
	^ #(
    AddColon
    AutoLabel
    BorderColor
    BorderShade
    BorderStyle
    BorderThemeColorIndex
    BorderTint
    BorderWidth
    BottomPadding
    CanGrow
    CanShrink
    ControlType
    DisplayWhen
    Enabled
    EventProcPrefix
    FilterOnEmptyMaster
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
    LinkChildFields
    LinkMasterFields
    Locked
    Name
    OldBorderStyle
    OnEnter
    OnExit
'OnEnterMacro' 'OnExitMacro'
    RightPadding
    Section
    SourceObject
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
JinSubForm class >> mappedTypeName [
	^#'_SubForm'
]

{ #category : #generated }
JinSubForm >> acceptVisitor: aVisitor [
	^ aVisitor visitSubForm: self
]

{ #category : #'property - generated' }
JinSubForm >> addColon [
<getter>
	^ (handle propertyNamed: #'AddColon' ).

]

{ #category : #'property - generated' }
JinSubForm >> addColon: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AddColon' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> application [
<getter>
	^ (handle propertyNamed: #'Application' ).

]

{ #category : #'property - generated' }
JinSubForm >> autoLabel [
<getter>
	^ (handle propertyNamed: #'AutoLabel' ).

]

{ #category : #'property - generated' }
JinSubForm >> autoLabel: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AutoLabel' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> borderColor [
<getter>
	^ (handle propertyNamed: #'BorderColor' ).

]

{ #category : #'property - generated' }
JinSubForm >> borderColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> borderShade [
<getter>
	^ (handle propertyNamed: #'BorderShade' ).

]

{ #category : #'property - generated' }
JinSubForm >> borderShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> borderStyle [
<getter>
	^ (handle propertyNamed: #'BorderStyle' ).

]

{ #category : #'property - generated' }
JinSubForm >> borderStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> borderThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'BorderThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinSubForm >> borderThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> borderTint [
<getter>
	^ (handle propertyNamed: #'BorderTint' ).

]

{ #category : #'property - generated' }
JinSubForm >> borderTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> borderWidth [
<getter>
	^ (handle propertyNamed: #'BorderWidth' ).

]

{ #category : #'property - generated' }
JinSubForm >> borderWidth: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderWidth' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> bottomPadding [
<getter>
	^ (handle propertyNamed: #'BottomPadding' ).

]

{ #category : #'property - generated' }
JinSubForm >> bottomPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BottomPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> canGrow [
<getter>
	^ (handle propertyNamed: #'CanGrow' ).

]

{ #category : #'property - generated' }
JinSubForm >> canGrow: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'CanGrow' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> canShrink [
<getter>
	^ (handle propertyNamed: #'CanShrink' ).

]

{ #category : #'property - generated' }
JinSubForm >> canShrink: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'CanShrink' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> controlType [
<getter>
	^ (handle propertyNamed: #'ControlType' ).

]

{ #category : #'property - generated' }
JinSubForm >> controlType: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlType' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> controls [
<getter>
	^ (handle propertyNamed: #'Controls' ).

]

{ #category : #'property - generated' }
JinSubForm >> displayWhen [
<getter>
	^ (handle propertyNamed: #'DisplayWhen' ).

]

{ #category : #'property - generated' }
JinSubForm >> displayWhen: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DisplayWhen' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> enabled [
<getter>
	^ (handle propertyNamed: #'Enabled' ).

]

{ #category : #'property - generated' }
JinSubForm >> enabled: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Enabled' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> eventProcPrefix [
<getter>
	^ (handle propertyNamed: #'EventProcPrefix' ).

]

{ #category : #'property - generated' }
JinSubForm >> eventProcPrefix: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'EventProcPrefix' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> filterOnEmptyMaster [
<getter>
	^ (handle propertyNamed: #'FilterOnEmptyMaster' ).

]

{ #category : #'property - generated' }
JinSubForm >> filterOnEmptyMaster: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FilterOnEmptyMaster' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> form [
<getter>
	^ (handle propertyNamed: #'Form' ).

]

{ #category : #'property - generated' }
JinSubForm >> gridlineColor [
<getter>
	^ (handle propertyNamed: #'GridlineColor' ).

]

{ #category : #'property - generated' }
JinSubForm >> gridlineColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> gridlineShade [
<getter>
	^ (handle propertyNamed: #'GridlineShade' ).

]

{ #category : #'property - generated' }
JinSubForm >> gridlineShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> gridlineStyleBottom [
<getter>
	^ (handle propertyNamed: #'GridlineStyleBottom' ).

]

{ #category : #'property - generated' }
JinSubForm >> gridlineStyleBottom: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleBottom' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> gridlineStyleLeft [
<getter>
	^ (handle propertyNamed: #'GridlineStyleLeft' ).

]

{ #category : #'property - generated' }
JinSubForm >> gridlineStyleLeft: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleLeft' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> gridlineStyleRight [
<getter>
	^ (handle propertyNamed: #'GridlineStyleRight' ).

]

{ #category : #'property - generated' }
JinSubForm >> gridlineStyleRight: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleRight' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> gridlineStyleTop [
<getter>
	^ (handle propertyNamed: #'GridlineStyleTop' ).

]

{ #category : #'property - generated' }
JinSubForm >> gridlineStyleTop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleTop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> gridlineThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'GridlineThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinSubForm >> gridlineThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> gridlineTint [
<getter>
	^ (handle propertyNamed: #'GridlineTint' ).

]

{ #category : #'property - generated' }
JinSubForm >> gridlineTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> gridlineWidthBottom [
<getter>
	^ (handle propertyNamed: #'GridlineWidthBottom' ).

]

{ #category : #'property - generated' }
JinSubForm >> gridlineWidthBottom: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthBottom' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> gridlineWidthLeft [
<getter>
	^ (handle propertyNamed: #'GridlineWidthLeft' ).

]

{ #category : #'property - generated' }
JinSubForm >> gridlineWidthLeft: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthLeft' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> gridlineWidthRight [
<getter>
	^ (handle propertyNamed: #'GridlineWidthRight' ).

]

{ #category : #'property - generated' }
JinSubForm >> gridlineWidthRight: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthRight' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> gridlineWidthTop [
<getter>
	^ (handle propertyNamed: #'GridlineWidthTop' ).

]

{ #category : #'property - generated' }
JinSubForm >> gridlineWidthTop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthTop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> height [
<getter>
	^ (handle propertyNamed: #'Height' ).

]

{ #category : #'property - generated' }
JinSubForm >> height: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Height' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> horizontalAnchor [
<getter>
	^ (handle propertyNamed: #'HorizontalAnchor' ).

]

{ #category : #'property - generated' }
JinSubForm >> horizontalAnchor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HorizontalAnchor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> inSelection [
<getter>
	^ (handle propertyNamed: #'InSelection' ).

]

{ #category : #'property - generated' }
JinSubForm >> inSelection: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'InSelection' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> isVisible [
<getter>
	^ (handle propertyNamed: #'IsVisible' ).

]

{ #category : #'property - generated' }
JinSubForm >> isVisible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IsVisible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> labelAlign [
<getter>
	^ (handle propertyNamed: #'LabelAlign' ).

]

{ #category : #'property - generated' }
JinSubForm >> labelAlign: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LabelAlign' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> labelX [
<getter>
	^ (handle propertyNamed: #'LabelX' ).

]

{ #category : #'property - generated' }
JinSubForm >> labelX: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LabelX' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> labelY [
<getter>
	^ (handle propertyNamed: #'LabelY' ).

]

{ #category : #'property - generated' }
JinSubForm >> labelY: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LabelY' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> layout [
<getter>
	^ (handle propertyNamed: #'Layout' ).

]

{ #category : #'property - generated' }
JinSubForm >> layoutID [
<getter>
	^ (handle propertyNamed: #'LayoutID' ).

]

{ #category : #'property - generated' }
JinSubForm >> left [
<getter>
	^ (handle propertyNamed: #'Left' ).

]

{ #category : #'property - generated' }
JinSubForm >> left: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Left' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> leftPadding [
<getter>
	^ (handle propertyNamed: #'LeftPadding' ).

]

{ #category : #'property - generated' }
JinSubForm >> leftPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LeftPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> linkChildFields [
<getter>
	^ (handle propertyNamed: #'LinkChildFields' ).

]

{ #category : #'property - generated' }
JinSubForm >> linkChildFields: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LinkChildFields' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> linkMasterFields [
<getter>
	^ (handle propertyNamed: #'LinkMasterFields' ).

]

{ #category : #'property - generated' }
JinSubForm >> linkMasterFields: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LinkMasterFields' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> locked [
<getter>
	^ (handle propertyNamed: #'Locked' ).

]

{ #category : #'property - generated' }
JinSubForm >> locked: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Locked' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinSubForm >> move: aLeft top: aTop width: aWidth height: aHeight [
<method>
"This method can be called with optional parameters. Top,Width,Height"
	^ (handle dispatch: #'Move' withArguments: {aLeft . aTop . aWidth . aHeight} ).

]

{ #category : #'property - generated' }
JinSubForm >> name: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Name' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> oldBorderStyle [
<getter>
	^ (handle propertyNamed: #'OldBorderStyle' ).

]

{ #category : #'property - generated' }
JinSubForm >> oldBorderStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OldBorderStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> onEnter [
<getter>
	^ (handle propertyNamed: #'OnEnter' ).

]

{ #category : #'property - generated' }
JinSubForm >> onEnter: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnEnter' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> onExit [
<getter>
	^ (handle propertyNamed: #'OnExit' ).

]

{ #category : #'property - generated' }
JinSubForm >> onExit: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnExit' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> report [
<getter>
	^ (handle propertyNamed: #'Report' ).

]

{ #category : #'method - generated' }
JinSubForm >> requery [
<method>
	^ (handle dispatch: #'Requery' ).

]

{ #category : #'property - generated' }
JinSubForm >> rightPadding [
<getter>
	^ (handle propertyNamed: #'RightPadding' ).

]

{ #category : #'property - generated' }
JinSubForm >> rightPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'RightPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> section [
<getter>
	^ (handle propertyNamed: #'Section' ).

]

{ #category : #'property - generated' }
JinSubForm >> section: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Section' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinSubForm >> setFocus [
<method>
	^ (handle dispatch: #'SetFocus' ).

]

{ #category : #'method - generated' }
JinSubForm >> sizeToFit [
<method>
	^ (handle dispatch: #'SizeToFit' ).

]

{ #category : #'property - generated' }
JinSubForm >> sourceObject [
<getter>
	^ (handle propertyNamed: #'SourceObject' ).

]

{ #category : #'property - generated' }
JinSubForm >> sourceObject: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'SourceObject' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> specialEffect [
<getter>
	^ (handle propertyNamed: #'SpecialEffect' ).

]

{ #category : #'property - generated' }
JinSubForm >> specialEffect: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'SpecialEffect' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> statusBarText [
<getter>
	^ (handle propertyNamed: #'StatusBarText' ).

]

{ #category : #'property - generated' }
JinSubForm >> statusBarText: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'StatusBarText' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> tabIndex [
<getter>
	^ (handle propertyNamed: #'TabIndex' ).

]

{ #category : #'property - generated' }
JinSubForm >> tabIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TabIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> tabStop [
<getter>
	^ (handle propertyNamed: #'TabStop' ).

]

{ #category : #'property - generated' }
JinSubForm >> tabStop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TabStop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> tag [
<getter>
	^ (handle propertyNamed: #'Tag' ).

]

{ #category : #'property - generated' }
JinSubForm >> tag: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Tag' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> top [
<getter>
	^ (handle propertyNamed: #'Top' ).

]

{ #category : #'property - generated' }
JinSubForm >> top: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Top' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> topPadding [
<getter>
	^ (handle propertyNamed: #'TopPadding' ).

]

{ #category : #'property - generated' }
JinSubForm >> topPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TopPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> verticalAnchor [
<getter>
	^ (handle propertyNamed: #'VerticalAnchor' ).

]

{ #category : #'property - generated' }
JinSubForm >> verticalAnchor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'VerticalAnchor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> visible [
<getter>
	^ (handle propertyNamed: #'Visible' ).

]

{ #category : #'property - generated' }
JinSubForm >> visible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Visible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinSubForm >> width [
<getter>
	^ (handle propertyNamed: #'Width' ).

]

{ #category : #'property - generated' }
JinSubForm >> width: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Width' withArguments: {aParam1} ).

]
