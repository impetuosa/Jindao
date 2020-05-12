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
	#name : #JinControlSubForm,
	#superclass : #JinControlAbstractSubForm,
	#category : #'Jindao-DomainObjects-GeneratedControls'
}

{ #category : #generated }
JinControlSubForm class >> mappedTypeName [
	^#'_SubForm'
]

{ #category : #generated }
JinControlSubForm >> acceptVisitor: aVisitor [
	^ aVisitor visitSubForm: self
]

{ #category : #'property - generated' }
JinControlSubForm >> addColon [
<getter>
	^ (handle propertyNamed: #'AddColon' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> addColon: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AddColon' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> application [
<getter>
	^ (handle propertyNamed: #'Application' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> autoLabel [
<getter>
	^ (handle propertyNamed: #'AutoLabel' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> autoLabel: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AutoLabel' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> borderColor [
<getter>
	^ (handle propertyNamed: #'BorderColor' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> borderColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> borderShade [
<getter>
	^ (handle propertyNamed: #'BorderShade' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> borderShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> borderStyle [
<getter>
	^ (handle propertyNamed: #'BorderStyle' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> borderStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> borderThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'BorderThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> borderThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> borderTint [
<getter>
	^ (handle propertyNamed: #'BorderTint' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> borderTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> borderWidth [
<getter>
	^ (handle propertyNamed: #'BorderWidth' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> borderWidth: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderWidth' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> bottomPadding [
<getter>
	^ (handle propertyNamed: #'BottomPadding' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> bottomPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BottomPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> canGrow [
<getter>
	^ (handle propertyNamed: #'CanGrow' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> canGrow: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'CanGrow' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> canShrink [
<getter>
	^ (handle propertyNamed: #'CanShrink' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> canShrink: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'CanShrink' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> controlType [
<getter>
	^ (handle propertyNamed: #'ControlType' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> controlType: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlType' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> controls [
<getter>
	^ (handle propertyNamed: #'Controls' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> displayWhen [
<getter>
	^ (handle propertyNamed: #'DisplayWhen' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> displayWhen: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DisplayWhen' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> enabled [
<getter>
	^ (handle propertyNamed: #'Enabled' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> enabled: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Enabled' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> eventProcPrefix [
<getter>
	^ (handle propertyNamed: #'EventProcPrefix' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> eventProcPrefix: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'EventProcPrefix' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> filterOnEmptyMaster [
<getter>
	^ (handle propertyNamed: #'FilterOnEmptyMaster' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> filterOnEmptyMaster: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FilterOnEmptyMaster' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> form [
<getter>
	^ (handle propertyNamed: #'Form' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> gridlineColor [
<getter>
	^ (handle propertyNamed: #'GridlineColor' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> gridlineColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> gridlineShade [
<getter>
	^ (handle propertyNamed: #'GridlineShade' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> gridlineShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> gridlineStyleBottom [
<getter>
	^ (handle propertyNamed: #'GridlineStyleBottom' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> gridlineStyleBottom: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleBottom' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> gridlineStyleLeft [
<getter>
	^ (handle propertyNamed: #'GridlineStyleLeft' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> gridlineStyleLeft: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleLeft' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> gridlineStyleRight [
<getter>
	^ (handle propertyNamed: #'GridlineStyleRight' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> gridlineStyleRight: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleRight' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> gridlineStyleTop [
<getter>
	^ (handle propertyNamed: #'GridlineStyleTop' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> gridlineStyleTop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleTop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> gridlineThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'GridlineThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> gridlineThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> gridlineTint [
<getter>
	^ (handle propertyNamed: #'GridlineTint' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> gridlineTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> gridlineWidthBottom [
<getter>
	^ (handle propertyNamed: #'GridlineWidthBottom' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> gridlineWidthBottom: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthBottom' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> gridlineWidthLeft [
<getter>
	^ (handle propertyNamed: #'GridlineWidthLeft' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> gridlineWidthLeft: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthLeft' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> gridlineWidthRight [
<getter>
	^ (handle propertyNamed: #'GridlineWidthRight' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> gridlineWidthRight: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthRight' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> gridlineWidthTop [
<getter>
	^ (handle propertyNamed: #'GridlineWidthTop' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> gridlineWidthTop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthTop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> height [
<getter>
	^ (handle propertyNamed: #'Height' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> height: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Height' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> horizontalAnchor [
<getter>
	^ (handle propertyNamed: #'HorizontalAnchor' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> horizontalAnchor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HorizontalAnchor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> inSelection [
<getter>
	^ (handle propertyNamed: #'InSelection' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> inSelection: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'InSelection' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> isVisible [
<getter>
	^ (handle propertyNamed: #'IsVisible' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> isVisible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IsVisible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> labelAlign [
<getter>
	^ (handle propertyNamed: #'LabelAlign' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> labelAlign: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LabelAlign' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> labelX [
<getter>
	^ (handle propertyNamed: #'LabelX' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> labelX: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LabelX' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> labelY [
<getter>
	^ (handle propertyNamed: #'LabelY' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> labelY: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LabelY' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> layout [
<getter>
	^ (handle propertyNamed: #'Layout' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> layoutID [
<getter>
	^ (handle propertyNamed: #'LayoutID' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> left [
<getter>
	^ (handle propertyNamed: #'Left' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> left: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Left' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> leftPadding [
<getter>
	^ (handle propertyNamed: #'LeftPadding' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> leftPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LeftPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> linkChildFields [
<getter>
	^ (handle propertyNamed: #'LinkChildFields' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> linkChildFields: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LinkChildFields' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> linkMasterFields [
<getter>
	^ (handle propertyNamed: #'LinkMasterFields' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> linkMasterFields: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LinkMasterFields' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> locked [
<getter>
	^ (handle propertyNamed: #'Locked' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> locked: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Locked' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlSubForm >> move: aLeft top: aTop width: aWidth height: aHeight [
<method>
"This method can be called with optional parameters. Top,Width,Height"
	^ (handle dispatch: #'Move' withArguments: {aLeft . aTop . aWidth . aHeight} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> name [
	<getter>
	^ handle propertyNamed: #Name
]

{ #category : #'property - generated' }
JinControlSubForm >> name: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Name' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> oldBorderStyle [
<getter>
	^ (handle propertyNamed: #'OldBorderStyle' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> oldBorderStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OldBorderStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> onEnter [
<getter>
	^ (handle propertyNamed: #'OnEnter' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> onEnter: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnEnter' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> onExit [
<getter>
	^ (handle propertyNamed: #'OnExit' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> onExit: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnExit' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> parent [
<getter>
	^ (handle propertyNamed: #'Parent' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> properties [
<getter>
	^ (handle propertyNamed: #'Properties' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> report [
<getter>
	^ (handle propertyNamed: #'Report' ).

]

{ #category : #'method - generated' }
JinControlSubForm >> requery [
<method>
	^ (handle dispatch: #'Requery' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> rightPadding [
<getter>
	^ (handle propertyNamed: #'RightPadding' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> rightPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'RightPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> section [
<getter>
	^ (handle propertyNamed: #'Section' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> section: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Section' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlSubForm >> setFocus [
<method>
	^ (handle dispatch: #'SetFocus' ).

]

{ #category : #'method - generated' }
JinControlSubForm >> sizeToFit [
<method>
	^ (handle dispatch: #'SizeToFit' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> sourceObject [
<getter>
	^ (handle propertyNamed: #'SourceObject' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> sourceObject: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'SourceObject' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> specialEffect [
<getter>
	^ (handle propertyNamed: #'SpecialEffect' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> specialEffect: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'SpecialEffect' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> statusBarText [
<getter>
	^ (handle propertyNamed: #'StatusBarText' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> statusBarText: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'StatusBarText' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> tabIndex [
<getter>
	^ (handle propertyNamed: #'TabIndex' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> tabIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TabIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> tabStop [
<getter>
	^ (handle propertyNamed: #'TabStop' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> tabStop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TabStop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> tag [
<getter>
	^ (handle propertyNamed: #'Tag' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> tag: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Tag' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> top [
<getter>
	^ (handle propertyNamed: #'Top' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> top: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Top' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> topPadding [
<getter>
	^ (handle propertyNamed: #'TopPadding' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> topPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TopPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> verticalAnchor [
<getter>
	^ (handle propertyNamed: #'VerticalAnchor' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> verticalAnchor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'VerticalAnchor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> visible [
<getter>
	^ (handle propertyNamed: #'Visible' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> visible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Visible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlSubForm >> width [
<getter>
	^ (handle propertyNamed: #'Width' ).

]

{ #category : #'property - generated' }
JinControlSubForm >> width: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Width' withArguments: {aParam1} ).

]
