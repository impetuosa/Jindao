"
---
title: TextBox object (Access)
keywords: vbaac10.chm11201
f1_keywords:
- vbaac10.chm11201
ms.prod: access
api_name:
- Access.TextBox
ms.assetid: d74fbe9a-0d40-7d28-956f-a2bfd0cfee45
ms.date: 03/21/2019
localization_priority: Normal
---


# TextBox object (Access)

This object represents a text box control on a form or report. Text boxes are used to display data from a record source, display the results of a calculation, or accept input from a user.

## Remarks

|Control|Tool|
|:-----|:-----|
|![Text box control](../images/t-txtbox_ZA06054010.gif)|![Text box tool](../images/textbox_ZA06044637.gif)|

Text boxes can be either bound or unbound. You use a bound text box to display data from a particular field. You use an unbound text box to display the results of a calculation, or to accept input from a user (as in the following code example).


## Example

The following code example uses a form with a text box to receive user input. The code displays a message when the user inputs data and then presses Enter.

```vb

Private Sub txtValue1_BeforeUpdate(Cancel As Integer)

MsgBox ""The Text box is being updated.""

End Sub

```

## Events

- [AfterUpdate](Access.TextBox.AfterUpdate-event.md)
- [BeforeUpdate](Access.TextBox.BeforeUpdate-event.md)
- [Change](Access.TextBox.Change.md)
- [Click](Access.TextBox.Click.md)
- [DblClick](Access.TextBox.DblClick.md)
- [Dirty](Access.TextBox.Dirty.md)
- [Enter](Access.TextBox.Enter.md)
- [Exit](Access.TextBox.Exit.md)
- [GotFocus](Access.TextBox.GotFocus.md)
- [KeyDown](Access.TextBox.KeyDown.md)
- [KeyPress](Access.TextBox.KeyPress.md)
- [KeyUp](Access.TextBox.KeyUp.md)
- [LostFocus](Access.TextBox.LostFocus.md)
- [MouseDown](Access.TextBox.MouseDown.md)
- [MouseMove](Access.TextBox.MouseMove.md)
- [MouseUp](Access.TextBox.MouseUp.md)
- [Undo](Access.TextBox.Undo(even).md)

## Methods

- [Move](Access.TextBox.Move.md)
- [Requery](Access.TextBox.Requery.md)
- [SetFocus](Access.TextBox.SetFocus.md)
- [SizeToFit](Access.TextBox.SizeToFit.md)
- [Undo](Access.TextBox.Undo(method).md)

## Properties

- [AddColon](Access.TextBox.AddColon.md)
- [AfterUpdate](Access.TextBox.AfterUpdate-property.md)
- [AllowAutoCorrect](Access.TextBox.AllowAutoCorrect.md)
- [Application](Access.TextBox.Application.md)
- [AsianLineBreak](Access.TextBox.AsianLineBreak.md)
- [AutoLabel](Access.TextBox.AutoLabel.md)
- [AutoTab](Access.TextBox.AutoTab.md)
- [BackColor](Access.TextBox.BackColor.md)
- [BackShade](Access.TextBox.BackShade.md)
- [BackStyle](Access.TextBox.BackStyle.md)
- [BackThemeColorIndex](Access.TextBox.BackThemeColorIndex.md)
- [BackTint](Access.TextBox.BackTint.md)
- [BeforeUpdate](Access.TextBox.BeforeUpdate-property.md)
- [BorderColor](Access.TextBox.BorderColor.md)
- [BorderShade](Access.TextBox.BorderShade.md)
- [BorderStyle](Access.TextBox.BorderStyle.md)
- [BorderThemeColorIndex](Access.TextBox.BorderThemeColorIndex.md)
- [BorderTint](Access.TextBox.BorderTint.md)
- [BorderWidth](Access.TextBox.BorderWidth.md)
- [BottomMargin](Access.TextBox.BottomMargin.md)
- [BottomPadding](Access.TextBox.BottomPadding.md)
- [CanGrow](Access.TextBox.CanGrow.md)
- [CanShrink](Access.TextBox.CanShrink.md)
- [ColumnHidden](Access.TextBox.ColumnHidden.md)
- [ColumnOrder](Access.TextBox.ColumnOrder.md)
- [ColumnWidth](Access.TextBox.ColumnWidth.md)
- [Controls](Access.TextBox.Controls.md)
- [ControlSource](Access.TextBox.ControlSource.md)
- [ControlTipText](Access.TextBox.ControlTipText.md)
- [ControlType](Access.TextBox.ControlType.md)
- [DecimalPlaces](Access.TextBox.DecimalPlaces.md)
- [DefaultValue](Access.TextBox.DefaultValue.md)
- [DisplayAsHyperlink](Access.TextBox.DisplayAsHyperlink.md)
- [DisplayWhen](Access.TextBox.DisplayWhen.md)
- [Enabled](Access.TextBox.Enabled.md)
- [EnterKeyBehavior](Access.TextBox.EnterKeyBehavior.md)
- [EventProcPrefix](Access.TextBox.EventProcPrefix.md)
- [FilterLookup](Access.TextBox.FilterLookup.md)
- [FontBold](Access.TextBox.FontBold.md)
- [FontItalic](Access.TextBox.FontItalic.md)
- [FontName](Access.TextBox.FontName.md)
- [FontSize](Access.TextBox.FontSize.md)
- [FontUnderline](Access.TextBox.FontUnderline.md)
- [FontWeight](Access.TextBox.FontWeight.md)
- [ForeColor](Access.TextBox.ForeColor.md)
- [ForeShade](Access.TextBox.ForeShade.md)
- [ForeThemeColorIndex](Access.TextBox.ForeThemeColorIndex.md)
- [ForeTint](Access.TextBox.ForeTint.md)
- [Format](Access.TextBox.Format.md)
- [FormatConditions](Access.TextBox.FormatConditions.md)
- [FuriganaControl](Access.TextBox.FuriganaControl.md)
- [GridlineColor](Access.TextBox.GridlineColor.md)
- [GridlineShade](Access.TextBox.GridlineShade.md)
- [GridlineStyleBottom](Access.TextBox.GridlineStyleBottom.md)
- [GridlineStyleLeft](Access.TextBox.GridlineStyleLeft.md)
- [GridlineStyleRight](Access.TextBox.GridlineStyleRight.md)
- [GridlineStyleTop](Access.TextBox.GridlineStyleTop.md)
- [GridlineThemeColorIndex](Access.TextBox.GridlineThemeColorIndex.md)
- [GridlineTint](Access.TextBox.GridlineTint.md)
- [GridlineWidthBottom](Access.TextBox.GridlineWidthBottom.md)
- [GridlineWidthLeft](Access.TextBox.GridlineWidthLeft.md)
- [GridlineWidthRight](Access.TextBox.GridlineWidthRight.md)
- [GridlineWidthTop](Access.TextBox.GridlineWidthTop.md)
- [Height](Access.TextBox.Height.md)
- [HelpContextId](Access.TextBox.HelpContextId.md)
- [HideDuplicates](Access.TextBox.HideDuplicates.md)
- [HorizontalAnchor](Access.TextBox.HorizontalAnchor.md)
- [Hyperlink](Access.TextBox.Hyperlink.md)
- [IMEHold](Access.TextBox.IMEHold.md)
- [IMEMode](Access.TextBox.IMEMode.md)
- [IMESentenceMode](Access.TextBox.IMESentenceMode.md)
- [InputMask](Access.TextBox.InputMask.md)
- [InSelection](Access.TextBox.InSelection.md)
- [IsHyperlink](Access.TextBox.IsHyperlink.md)
- [IsVisible](Access.TextBox.IsVisible.md)
- [KeyboardLanguage](Access.TextBox.KeyboardLanguage.md)
- [LabelAlign](Access.TextBox.LabelAlign.md)
- [LabelX](Access.TextBox.LabelX.md)
- [LabelY](Access.TextBox.LabelY.md)
- [Layout](Access.TextBox.Layout.md)
- [LayoutID](Access.TextBox.LayoutID.md)
- [Left](Access.TextBox.Left.md)
- [LeftMargin](Access.TextBox.LeftMargin.md)
- [LeftPadding](Access.TextBox.LeftPadding.md)
- [LineSpacing](Access.TextBox.LineSpacing.md)
- [Locked](Access.TextBox.Locked.md)
- [Name](Access.TextBox.Name.md)
- [NumeralShapes](Access.TextBox.NumeralShapes.md)
- [OldBorderStyle](Access.TextBox.OldBorderStyle.md)
- [OldValue](Access.TextBox.OldValue.md)
- [OnChange](Access.TextBox.OnChange.md)
- [OnClick](Access.TextBox.OnClick.md)
- [OnDblClick](Access.TextBox.OnDblClick.md)
- [OnDirty](Access.TextBox.OnDirty.md)
- [OnEnter](Access.TextBox.OnEnter.md)
- [OnExit](Access.TextBox.OnExit.md)
- [OnGotFocus](Access.TextBox.OnGotFocus.md)
- [OnKeyDown](Access.TextBox.OnKeyDown.md)
- [OnKeyPress](Access.TextBox.OnKeyPress.md)
- [OnKeyUp](Access.TextBox.OnKeyUp.md)
- [OnLostFocus](Access.TextBox.OnLostFocus.md)
- [OnMouseDown](Access.TextBox.OnMouseDown.md)
- [OnMouseMove](Access.TextBox.OnMouseMove.md)
- [OnMouseUp](Access.TextBox.OnMouseUp.md)
- [OnUndo](Access.TextBox.OnUndo.md)
- [Parent](Access.TextBox.Parent.md)
- [PostalAddress](Access.TextBox.PostalAddress.md)
- [Properties](Access.TextBox.Properties.md)
- [ReadingOrder](Access.TextBox.ReadingOrder.md)
- [RightMargin](Access.TextBox.RightMargin.md)
- [RightPadding](Access.TextBox.RightPadding.md)
- [RunningSum](Access.TextBox.RunningSum.md)
- [ScrollBarAlign](Access.TextBox.ScrollBarAlign.md)
- [ScrollBars](Access.TextBox.ScrollBars.md)
- [Section](Access.TextBox.Section.md)
- [SelLength](Access.TextBox.SelLength.md)
- [SelStart](Access.TextBox.SelStart.md)
- [SelText](Access.TextBox.SelText.md)
- [ShortcutMenuBar](Access.TextBox.ShortcutMenuBar.md)
- [ShowDatePicker](Access.TextBox.ShowDatePicker.md)
- [SmartTags](Access.TextBox.SmartTags.md)
- [SpecialEffect](Access.TextBox.SpecialEffect.md)
- [StatusBarText](Access.TextBox.StatusBarText.md)
- [TabIndex](Access.TextBox.TabIndex.md)
- [TabStop](Access.TextBox.TabStop.md)
- [Tag](Access.TextBox.Tag.md)
- [Text](Access.TextBox.Text.md)
- [TextAlign](Access.TextBox.TextAlign.md)
- [TextFormat](Access.TextBox.TextFormat.md)
- [ThemeFontIndex](Access.TextBox.ThemeFontIndex.md)
- [Top](Access.TextBox.Top.md)
- [TopMargin](Access.TextBox.TopMargin.md)
- [TopPadding](Access.TextBox.TopPadding.md)
- [ValidationRule](Access.TextBox.ValidationRule.md)
- [ValidationText](Access.TextBox.ValidationText.md)
- [Value](Access.TextBox.Value.md)
- [Vertical](Access.TextBox.Vertical.md)
- [VerticalAnchor](Access.TextBox.VerticalAnchor.md)
- [Visible](Access.TextBox.Visible.md)
- [Width](Access.TextBox.Width.md)

## See also

- [Access Object Model Reference](overview/Access/object-model.md)


[!include[Support and feedback](~/includes/feedback-boilerplate.md)]

"
Class {
	#name : #JinTextbox,
	#superclass : #JinControlAbstractTextbox,
	#category : #'Jindao-DomainObjects-GeneratedControls'
}

{ #category : #generated }
JinTextbox class >> mappedTypeName [
	^#'_Textbox'
]

{ #category : #generated }
JinTextbox >> acceptVisitor: aVisitor [
	^ aVisitor visitTextbox: self
]

{ #category : #'property - generated' }
JinTextbox >> addColon [
<getter>
	^ (handle propertyNamed: #'AddColon' ).

]

{ #category : #'property - generated' }
JinTextbox >> addColon: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AddColon' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> allowAutoCorrect [
<getter>
	^ (handle propertyNamed: #'AllowAutoCorrect' ).

]

{ #category : #'property - generated' }
JinTextbox >> allowAutoCorrect: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AllowAutoCorrect' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> application [
<getter>
	^ (handle propertyNamed: #'Application' ).

]

{ #category : #'property - generated' }
JinTextbox >> asianLineBreak [
<getter>
	^ (handle propertyNamed: #'AsianLineBreak' ).

]

{ #category : #'property - generated' }
JinTextbox >> asianLineBreak: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AsianLineBreak' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> autoLabel [
<getter>
	^ (handle propertyNamed: #'AutoLabel' ).

]

{ #category : #'property - generated' }
JinTextbox >> autoLabel: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AutoLabel' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> autoTab [
<getter>
	^ (handle propertyNamed: #'AutoTab' ).

]

{ #category : #'property - generated' }
JinTextbox >> autoTab: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AutoTab' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> backColor [
<getter>
	^ (handle propertyNamed: #'BackColor' ).

]

{ #category : #'property - generated' }
JinTextbox >> backColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> backShade [
<getter>
	^ (handle propertyNamed: #'BackShade' ).

]

{ #category : #'property - generated' }
JinTextbox >> backShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> backStyle [
<getter>
	^ (handle propertyNamed: #'BackStyle' ).

]

{ #category : #'property - generated' }
JinTextbox >> backStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> backThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'BackThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinTextbox >> backThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> backTint [
<getter>
	^ (handle propertyNamed: #'BackTint' ).

]

{ #category : #'property - generated' }
JinTextbox >> backTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> borderColor [
<getter>
	^ (handle propertyNamed: #'BorderColor' ).

]

{ #category : #'property - generated' }
JinTextbox >> borderColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> borderShade [
<getter>
	^ (handle propertyNamed: #'BorderShade' ).

]

{ #category : #'property - generated' }
JinTextbox >> borderShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> borderStyle [
<getter>
	^ (handle propertyNamed: #'BorderStyle' ).

]

{ #category : #'property - generated' }
JinTextbox >> borderStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> borderThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'BorderThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinTextbox >> borderThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> borderTint [
<getter>
	^ (handle propertyNamed: #'BorderTint' ).

]

{ #category : #'property - generated' }
JinTextbox >> borderTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> borderWidth [
<getter>
	^ (handle propertyNamed: #'BorderWidth' ).

]

{ #category : #'property - generated' }
JinTextbox >> borderWidth: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderWidth' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> bottomMargin [
<getter>
	^ (handle propertyNamed: #'BottomMargin' ).

]

{ #category : #'property - generated' }
JinTextbox >> bottomMargin: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BottomMargin' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> bottomPadding [
<getter>
	^ (handle propertyNamed: #'BottomPadding' ).

]

{ #category : #'property - generated' }
JinTextbox >> bottomPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BottomPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> canGrow [
<getter>
	^ (handle propertyNamed: #'CanGrow' ).

]

{ #category : #'property - generated' }
JinTextbox >> canGrow: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'CanGrow' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> canShrink [
<getter>
	^ (handle propertyNamed: #'CanShrink' ).

]

{ #category : #'property - generated' }
JinTextbox >> canShrink: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'CanShrink' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> columnHidden [
<getter>
	^ (handle propertyNamed: #'ColumnHidden' ).

]

{ #category : #'property - generated' }
JinTextbox >> columnHidden: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ColumnHidden' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> columnOrder [
<getter>
	^ (handle propertyNamed: #'ColumnOrder' ).

]

{ #category : #'property - generated' }
JinTextbox >> columnOrder: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ColumnOrder' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> columnWidth [
<getter>
	^ (handle propertyNamed: #'ColumnWidth' ).

]

{ #category : #'property - generated' }
JinTextbox >> columnWidth: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ColumnWidth' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> controlSource [
<getter>
	^ (handle propertyNamed: #'ControlSource' ).

]

{ #category : #'property - generated' }
JinTextbox >> controlSource: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlSource' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> controlTipText [
<getter>
	^ (handle propertyNamed: #'ControlTipText' ).

]

{ #category : #'property - generated' }
JinTextbox >> controlTipText: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlTipText' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> controlType [
<getter>
	^ (handle propertyNamed: #'ControlType' ).

]

{ #category : #'property - generated' }
JinTextbox >> controlType: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlType' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> controls [
<getter>
	^ (handle propertyNamed: #'Controls' ).

]

{ #category : #'property - generated' }
JinTextbox >> decimalPlaces [
<getter>
	^ (handle propertyNamed: #'DecimalPlaces' ).

]

{ #category : #'property - generated' }
JinTextbox >> decimalPlaces: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DecimalPlaces' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> defaultValue [
<getter>
	^ (handle propertyNamed: #'DefaultValue' ).

]

{ #category : #'property - generated' }
JinTextbox >> defaultValue: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DefaultValue' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> displayAsHyperlink [
<getter>
	^ (handle propertyNamed: #'DisplayAsHyperlink' ).

]

{ #category : #'property - generated' }
JinTextbox >> displayAsHyperlink: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DisplayAsHyperlink' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> displayWhen [
<getter>
	^ (handle propertyNamed: #'DisplayWhen' ).

]

{ #category : #'property - generated' }
JinTextbox >> displayWhen: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DisplayWhen' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> enabled [
<getter>
	^ (handle propertyNamed: #'Enabled' ).

]

{ #category : #'property - generated' }
JinTextbox >> enabled: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Enabled' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> enterKeyBehavior [
<getter>
	^ (handle propertyNamed: #'EnterKeyBehavior' ).

]

{ #category : #'property - generated' }
JinTextbox >> enterKeyBehavior: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'EnterKeyBehavior' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> eventProcPrefix [
<getter>
	^ (handle propertyNamed: #'EventProcPrefix' ).

]

{ #category : #'property - generated' }
JinTextbox >> eventProcPrefix: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'EventProcPrefix' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> filterLookup [
<getter>
	^ (handle propertyNamed: #'FilterLookup' ).

]

{ #category : #'property - generated' }
JinTextbox >> filterLookup: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FilterLookup' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> fontBold [
<getter>
	^ (handle propertyNamed: #'FontBold' ).

]

{ #category : #'property - generated' }
JinTextbox >> fontBold: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontBold' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> fontItalic [
<getter>
	^ (handle propertyNamed: #'FontItalic' ).

]

{ #category : #'property - generated' }
JinTextbox >> fontItalic: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontItalic' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> fontName [
<getter>
	^ (handle propertyNamed: #'FontName' ).

]

{ #category : #'property - generated' }
JinTextbox >> fontName: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontName' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> fontSize [
<getter>
	^ (handle propertyNamed: #'FontSize' ).

]

{ #category : #'property - generated' }
JinTextbox >> fontSize: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontSize' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> fontUnderline [
<getter>
	^ (handle propertyNamed: #'FontUnderline' ).

]

{ #category : #'property - generated' }
JinTextbox >> fontUnderline: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontUnderline' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> fontWeight [
<getter>
	^ (handle propertyNamed: #'FontWeight' ).

]

{ #category : #'property - generated' }
JinTextbox >> fontWeight: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontWeight' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> foreColor [
<getter>
	^ (handle propertyNamed: #'ForeColor' ).

]

{ #category : #'property - generated' }
JinTextbox >> foreColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ForeColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> foreShade [
<getter>
	^ (handle propertyNamed: #'ForeShade' ).

]

{ #category : #'property - generated' }
JinTextbox >> foreShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ForeShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> foreThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'ForeThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinTextbox >> foreThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ForeThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> foreTint [
<getter>
	^ (handle propertyNamed: #'ForeTint' ).

]

{ #category : #'property - generated' }
JinTextbox >> foreTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ForeTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> format [
<getter>
	^ (handle propertyNamed: #'Format' ).

]

{ #category : #'property - generated' }
JinTextbox >> format: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Format' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> formatConditions [
<getter>
	^ (handle propertyNamed: #'FormatConditions' ).

]

{ #category : #'property - generated' }
JinTextbox >> furiganaControl [
<getter>
	^ (handle propertyNamed: #'FuriganaControl' ).

]

{ #category : #'property - generated' }
JinTextbox >> furiganaControl: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FuriganaControl' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> gridlineColor [
<getter>
	^ (handle propertyNamed: #'GridlineColor' ).

]

{ #category : #'property - generated' }
JinTextbox >> gridlineColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> gridlineShade [
<getter>
	^ (handle propertyNamed: #'GridlineShade' ).

]

{ #category : #'property - generated' }
JinTextbox >> gridlineShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> gridlineStyleBottom [
<getter>
	^ (handle propertyNamed: #'GridlineStyleBottom' ).

]

{ #category : #'property - generated' }
JinTextbox >> gridlineStyleBottom: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleBottom' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> gridlineStyleLeft [
<getter>
	^ (handle propertyNamed: #'GridlineStyleLeft' ).

]

{ #category : #'property - generated' }
JinTextbox >> gridlineStyleLeft: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleLeft' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> gridlineStyleRight [
<getter>
	^ (handle propertyNamed: #'GridlineStyleRight' ).

]

{ #category : #'property - generated' }
JinTextbox >> gridlineStyleRight: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleRight' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> gridlineStyleTop [
<getter>
	^ (handle propertyNamed: #'GridlineStyleTop' ).

]

{ #category : #'property - generated' }
JinTextbox >> gridlineStyleTop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleTop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> gridlineThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'GridlineThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinTextbox >> gridlineThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> gridlineTint [
<getter>
	^ (handle propertyNamed: #'GridlineTint' ).

]

{ #category : #'property - generated' }
JinTextbox >> gridlineTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> gridlineWidthBottom [
<getter>
	^ (handle propertyNamed: #'GridlineWidthBottom' ).

]

{ #category : #'property - generated' }
JinTextbox >> gridlineWidthBottom: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthBottom' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> gridlineWidthLeft [
<getter>
	^ (handle propertyNamed: #'GridlineWidthLeft' ).

]

{ #category : #'property - generated' }
JinTextbox >> gridlineWidthLeft: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthLeft' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> gridlineWidthRight [
<getter>
	^ (handle propertyNamed: #'GridlineWidthRight' ).

]

{ #category : #'property - generated' }
JinTextbox >> gridlineWidthRight: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthRight' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> gridlineWidthTop [
<getter>
	^ (handle propertyNamed: #'GridlineWidthTop' ).

]

{ #category : #'property - generated' }
JinTextbox >> gridlineWidthTop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthTop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> height [
<getter>
	^ (handle propertyNamed: #'Height' ).

]

{ #category : #'property - generated' }
JinTextbox >> height: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Height' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> helpContextId [
<getter>
	^ (handle propertyNamed: #'HelpContextId' ).

]

{ #category : #'property - generated' }
JinTextbox >> helpContextId: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HelpContextId' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> hideDuplicates [
<getter>
	^ (handle propertyNamed: #'HideDuplicates' ).

]

{ #category : #'property - generated' }
JinTextbox >> hideDuplicates: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HideDuplicates' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> horizontalAnchor [
<getter>
	^ (handle propertyNamed: #'HorizontalAnchor' ).

]

{ #category : #'property - generated' }
JinTextbox >> horizontalAnchor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HorizontalAnchor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> hyperlink [
<getter>
	^ (handle propertyNamed: #'Hyperlink' ).

]

{ #category : #'property - generated' }
JinTextbox >> iMEHold [
<getter>
	^ (handle propertyNamed: #'IMEHold' ).

]

{ #category : #'property - generated' }
JinTextbox >> iMEHold: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IMEHold' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> iMEMode [
<getter>
	^ (handle propertyNamed: #'IMEMode' ).

]

{ #category : #'property - generated' }
JinTextbox >> iMEMode: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IMEMode' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> iMESentenceMode [
<getter>
	^ (handle propertyNamed: #'IMESentenceMode' ).

]

{ #category : #'property - generated' }
JinTextbox >> iMESentenceMode: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IMESentenceMode' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> inSelection [
<getter>
	^ (handle propertyNamed: #'InSelection' ).

]

{ #category : #'property - generated' }
JinTextbox >> inSelection: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'InSelection' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> inputMask [
<getter>
	^ (handle propertyNamed: #'InputMask' ).

]

{ #category : #'property - generated' }
JinTextbox >> inputMask: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'InputMask' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> isHyperlink [
<getter>
	^ (handle propertyNamed: #'IsHyperlink' ).

]

{ #category : #'property - generated' }
JinTextbox >> isHyperlink: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IsHyperlink' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> isVisible [
<getter>
	^ (handle propertyNamed: #'IsVisible' ).

]

{ #category : #'property - generated' }
JinTextbox >> isVisible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IsVisible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> keyboardLanguage [
<getter>
	^ (handle propertyNamed: #'KeyboardLanguage' ).

]

{ #category : #'property - generated' }
JinTextbox >> keyboardLanguage: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'KeyboardLanguage' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> labelAlign [
<getter>
	^ (handle propertyNamed: #'LabelAlign' ).

]

{ #category : #'property - generated' }
JinTextbox >> labelAlign: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LabelAlign' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> labelX [
<getter>
	^ (handle propertyNamed: #'LabelX' ).

]

{ #category : #'property - generated' }
JinTextbox >> labelX: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LabelX' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> labelY [
<getter>
	^ (handle propertyNamed: #'LabelY' ).

]

{ #category : #'property - generated' }
JinTextbox >> labelY: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LabelY' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> layout [
<getter>
	^ (handle propertyNamed: #'Layout' ).

]

{ #category : #'property - generated' }
JinTextbox >> layoutID [
<getter>
	^ (handle propertyNamed: #'LayoutID' ).

]

{ #category : #'property - generated' }
JinTextbox >> left [
<getter>
	^ (handle propertyNamed: #'Left' ).

]

{ #category : #'property - generated' }
JinTextbox >> left: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Left' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> leftMargin [
<getter>
	^ (handle propertyNamed: #'LeftMargin' ).

]

{ #category : #'property - generated' }
JinTextbox >> leftMargin: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LeftMargin' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> leftPadding [
<getter>
	^ (handle propertyNamed: #'LeftPadding' ).

]

{ #category : #'property - generated' }
JinTextbox >> leftPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LeftPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> lineSpacing [
<getter>
	^ (handle propertyNamed: #'LineSpacing' ).

]

{ #category : #'property - generated' }
JinTextbox >> lineSpacing: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LineSpacing' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> locked [
<getter>
	^ (handle propertyNamed: #'Locked' ).

]

{ #category : #'property - generated' }
JinTextbox >> locked: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Locked' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinTextbox >> move: aLeft top: aTop width: aWidth height: aHeight [
<method>
"This method can be called with optional parameters. Top,Width,Height"
	^ (handle dispatch: #'Move' withArguments: {aLeft . aTop . aWidth . aHeight} ).

]

{ #category : #'property - generated' }
JinTextbox >> name [
<getter>
	^ (handle propertyNamed: #'Name' ).

]

{ #category : #'property - generated' }
JinTextbox >> name: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Name' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> numeralShapes [
<getter>
	^ (handle propertyNamed: #'NumeralShapes' ).

]

{ #category : #'property - generated' }
JinTextbox >> numeralShapes: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'NumeralShapes' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> oldBorderStyle [
<getter>
	^ (handle propertyNamed: #'OldBorderStyle' ).

]

{ #category : #'property - generated' }
JinTextbox >> oldBorderStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OldBorderStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> oldValue [
<getter>
	^ (handle propertyNamed: #'OldValue' ).

]

{ #category : #'property - generated' }
JinTextbox >> onChange [
<getter>
	^ (handle propertyNamed: #'OnChange' ).

]

{ #category : #'property - generated' }
JinTextbox >> onChange: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnChange' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> onClick [
<getter>
	^ (handle propertyNamed: #'OnClick' ).

]

{ #category : #'property - generated' }
JinTextbox >> onClick: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnClick' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> onDblClick [
<getter>
	^ (handle propertyNamed: #'OnDblClick' ).

]

{ #category : #'property - generated' }
JinTextbox >> onDblClick: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnDblClick' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> onDirty [
<getter>
	^ (handle propertyNamed: #'OnDirty' ).

]

{ #category : #'property - generated' }
JinTextbox >> onDirty: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnDirty' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> onEnter [
<getter>
	^ (handle propertyNamed: #'OnEnter' ).

]

{ #category : #'property - generated' }
JinTextbox >> onEnter: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnEnter' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> onExit [
<getter>
	^ (handle propertyNamed: #'OnExit' ).

]

{ #category : #'property - generated' }
JinTextbox >> onExit: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnExit' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> onGotFocus [
<getter>
	^ (handle propertyNamed: #'OnGotFocus' ).

]

{ #category : #'property - generated' }
JinTextbox >> onGotFocus: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnGotFocus' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> onKeyDown [
<getter>
	^ (handle propertyNamed: #'OnKeyDown' ).

]

{ #category : #'property - generated' }
JinTextbox >> onKeyDown: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyDown' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> onKeyPress [
<getter>
	^ (handle propertyNamed: #'OnKeyPress' ).

]

{ #category : #'property - generated' }
JinTextbox >> onKeyPress: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyPress' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> onKeyUp [
<getter>
	^ (handle propertyNamed: #'OnKeyUp' ).

]

{ #category : #'property - generated' }
JinTextbox >> onKeyUp: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyUp' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> onLostFocus [
<getter>
	^ (handle propertyNamed: #'OnLostFocus' ).

]

{ #category : #'property - generated' }
JinTextbox >> onLostFocus: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnLostFocus' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> onMouseDown [
<getter>
	^ (handle propertyNamed: #'OnMouseDown' ).

]

{ #category : #'property - generated' }
JinTextbox >> onMouseDown: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseDown' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> onMouseMove [
<getter>
	^ (handle propertyNamed: #'OnMouseMove' ).

]

{ #category : #'property - generated' }
JinTextbox >> onMouseMove: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseMove' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> onMouseUp [
<getter>
	^ (handle propertyNamed: #'OnMouseUp' ).

]

{ #category : #'property - generated' }
JinTextbox >> onMouseUp: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseUp' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> onUndo [
<getter>
	^ (handle propertyNamed: #'OnUndo' ).

]

{ #category : #'property - generated' }
JinTextbox >> onUndo: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnUndo' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> parent [
<getter>
	^ (handle propertyNamed: #'Parent' ).

]

{ #category : #'property - generated' }
JinTextbox >> postalAddress [
<getter>
	^ (handle propertyNamed: #'PostalAddress' ).

]

{ #category : #'property - generated' }
JinTextbox >> postalAddress: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'PostalAddress' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> readingOrder [
<getter>
	^ (handle propertyNamed: #'ReadingOrder' ).

]

{ #category : #'property - generated' }
JinTextbox >> readingOrder: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ReadingOrder' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinTextbox >> requery [
<method>
	^ (handle dispatch: #'Requery' ).

]

{ #category : #'property - generated' }
JinTextbox >> rightMargin [
<getter>
	^ (handle propertyNamed: #'RightMargin' ).

]

{ #category : #'property - generated' }
JinTextbox >> rightMargin: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'RightMargin' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> rightPadding [
<getter>
	^ (handle propertyNamed: #'RightPadding' ).

]

{ #category : #'property - generated' }
JinTextbox >> rightPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'RightPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> runningSum [
<getter>
	^ (handle propertyNamed: #'RunningSum' ).

]

{ #category : #'property - generated' }
JinTextbox >> runningSum: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'RunningSum' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> scrollBarAlign [
<getter>
	^ (handle propertyNamed: #'ScrollBarAlign' ).

]

{ #category : #'property - generated' }
JinTextbox >> scrollBarAlign: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ScrollBarAlign' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> scrollBars [
<getter>
	^ (handle propertyNamed: #'ScrollBars' ).

]

{ #category : #'property - generated' }
JinTextbox >> scrollBars: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ScrollBars' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> section [
<getter>
	^ (handle propertyNamed: #'Section' ).

]

{ #category : #'property - generated' }
JinTextbox >> section: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Section' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> selLength [
<getter>
	^ (handle propertyNamed: #'SelLength' ).

]

{ #category : #'property - generated' }
JinTextbox >> selLength: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'SelLength' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> selStart [
<getter>
	^ (handle propertyNamed: #'SelStart' ).

]

{ #category : #'property - generated' }
JinTextbox >> selStart: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'SelStart' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> selText [
<getter>
	^ (handle propertyNamed: #'SelText' ).

]

{ #category : #'property - generated' }
JinTextbox >> selText: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'SelText' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinTextbox >> setFocus [
<method>
	^ (handle dispatch: #'SetFocus' ).

]

{ #category : #'property - generated' }
JinTextbox >> shortcutMenuBar [
<getter>
	^ (handle propertyNamed: #'ShortcutMenuBar' ).

]

{ #category : #'property - generated' }
JinTextbox >> shortcutMenuBar: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ShortcutMenuBar' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> showDatePicker [
<getter>
	^ (handle propertyNamed: #'ShowDatePicker' ).

]

{ #category : #'property - generated' }
JinTextbox >> showDatePicker: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ShowDatePicker' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinTextbox >> sizeToFit [
<method>
	^ (handle dispatch: #'SizeToFit' ).

]

{ #category : #'property - generated' }
JinTextbox >> smartTags [
<getter>
	^ (handle propertyNamed: #'SmartTags' ).

]

{ #category : #'property - generated' }
JinTextbox >> specialEffect [
<getter>
	^ (handle propertyNamed: #'SpecialEffect' ).

]

{ #category : #'property - generated' }
JinTextbox >> specialEffect: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'SpecialEffect' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> statusBarText [
<getter>
	^ (handle propertyNamed: #'StatusBarText' ).

]

{ #category : #'property - generated' }
JinTextbox >> statusBarText: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'StatusBarText' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> tabIndex [
<getter>
	^ (handle propertyNamed: #'TabIndex' ).

]

{ #category : #'property - generated' }
JinTextbox >> tabIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TabIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> tabStop [
<getter>
	^ (handle propertyNamed: #'TabStop' ).

]

{ #category : #'property - generated' }
JinTextbox >> tabStop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TabStop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> tag [
<getter>
	^ (handle propertyNamed: #'Tag' ).

]

{ #category : #'property - generated' }
JinTextbox >> tag: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Tag' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> text [
<getter>
	^ (handle propertyNamed: #'Text' ).

]

{ #category : #'property - generated' }
JinTextbox >> text: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Text' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> textAlign [
<getter>
	^ (handle propertyNamed: #'TextAlign' ).

]

{ #category : #'property - generated' }
JinTextbox >> textAlign: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TextAlign' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> textFormat [
<getter>
	^ (handle propertyNamed: #'TextFormat' ).

]

{ #category : #'property - generated' }
JinTextbox >> textFormat: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TextFormat' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> themeFontIndex [
<getter>
	^ (handle propertyNamed: #'ThemeFontIndex' ).

]

{ #category : #'property - generated' }
JinTextbox >> themeFontIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ThemeFontIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> top [
<getter>
	^ (handle propertyNamed: #'Top' ).

]

{ #category : #'property - generated' }
JinTextbox >> top: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Top' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> topMargin [
<getter>
	^ (handle propertyNamed: #'TopMargin' ).

]

{ #category : #'property - generated' }
JinTextbox >> topMargin: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TopMargin' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> topPadding [
<getter>
	^ (handle propertyNamed: #'TopPadding' ).

]

{ #category : #'property - generated' }
JinTextbox >> topPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TopPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> validationRule [
<getter>
	^ (handle propertyNamed: #'ValidationRule' ).

]

{ #category : #'property - generated' }
JinTextbox >> validationRule: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ValidationRule' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> validationText [
<getter>
	^ (handle propertyNamed: #'ValidationText' ).

]

{ #category : #'property - generated' }
JinTextbox >> validationText: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ValidationText' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> value [
<getter>
	^ (handle propertyNamed: #'Value' ).

]

{ #category : #'property - generated' }
JinTextbox >> value: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Value' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> vertical [
<getter>
	^ (handle propertyNamed: #'Vertical' ).

]

{ #category : #'property - generated' }
JinTextbox >> vertical: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Vertical' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> verticalAnchor [
<getter>
	^ (handle propertyNamed: #'VerticalAnchor' ).

]

{ #category : #'property - generated' }
JinTextbox >> verticalAnchor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'VerticalAnchor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> visible [
<getter>
	^ (handle propertyNamed: #'Visible' ).

]

{ #category : #'property - generated' }
JinTextbox >> visible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Visible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinTextbox >> width [
<getter>
	^ (handle propertyNamed: #'Width' ).

]

{ #category : #'property - generated' }
JinTextbox >> width: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Width' withArguments: {aParam1} ).

]
