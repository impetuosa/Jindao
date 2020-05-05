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
	#name : #JinControlTextbox,
	#superclass : #JinControlAbstractTextbox,
	#category : #'Jindao-DomainObjects-GeneratedControls'
}

{ #category : #generated }
JinControlTextbox class >> mappedTypeName [
	^#'_Textbox'
]

{ #category : #generated }
JinControlTextbox >> acceptVisitor: aVisitor [
	^ aVisitor visitTextbox: self
]

{ #category : #'property - generated' }
JinControlTextbox >> addColon [
<getter>
	^ (handle propertyNamed: #'AddColon' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> addColon: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AddColon' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> allowAutoCorrect [
<getter>
	^ (handle propertyNamed: #'AllowAutoCorrect' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> allowAutoCorrect: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AllowAutoCorrect' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> application [
<getter>
	^ (handle propertyNamed: #'Application' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> asianLineBreak [
<getter>
	^ (handle propertyNamed: #'AsianLineBreak' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> asianLineBreak: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AsianLineBreak' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> autoLabel [
<getter>
	^ (handle propertyNamed: #'AutoLabel' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> autoLabel: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AutoLabel' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> autoTab [
<getter>
	^ (handle propertyNamed: #'AutoTab' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> autoTab: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AutoTab' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> backColor [
<getter>
	^ (handle propertyNamed: #'BackColor' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> backColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> backShade [
<getter>
	^ (handle propertyNamed: #'BackShade' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> backShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> backStyle [
<getter>
	^ (handle propertyNamed: #'BackStyle' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> backStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> backThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'BackThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> backThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> backTint [
<getter>
	^ (handle propertyNamed: #'BackTint' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> backTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> borderColor [
<getter>
	^ (handle propertyNamed: #'BorderColor' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> borderColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> borderShade [
<getter>
	^ (handle propertyNamed: #'BorderShade' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> borderShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> borderStyle [
<getter>
	^ (handle propertyNamed: #'BorderStyle' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> borderStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> borderThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'BorderThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> borderThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> borderTint [
<getter>
	^ (handle propertyNamed: #'BorderTint' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> borderTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> borderWidth [
<getter>
	^ (handle propertyNamed: #'BorderWidth' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> borderWidth: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderWidth' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> bottomMargin [
<getter>
	^ (handle propertyNamed: #'BottomMargin' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> bottomMargin: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BottomMargin' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> bottomPadding [
<getter>
	^ (handle propertyNamed: #'BottomPadding' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> bottomPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BottomPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> canGrow [
<getter>
	^ (handle propertyNamed: #'CanGrow' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> canGrow: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'CanGrow' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> canShrink [
<getter>
	^ (handle propertyNamed: #'CanShrink' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> canShrink: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'CanShrink' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> columnHidden [
<getter>
	^ (handle propertyNamed: #'ColumnHidden' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> columnHidden: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ColumnHidden' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> columnOrder [
<getter>
	^ (handle propertyNamed: #'ColumnOrder' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> columnOrder: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ColumnOrder' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> columnWidth [
<getter>
	^ (handle propertyNamed: #'ColumnWidth' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> columnWidth: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ColumnWidth' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> controlSource [
<getter>
	^ (handle propertyNamed: #'ControlSource' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> controlSource: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlSource' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> controlTipText [
<getter>
	^ (handle propertyNamed: #'ControlTipText' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> controlTipText: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlTipText' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> controlType [
<getter>
	^ (handle propertyNamed: #'ControlType' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> controlType: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlType' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> controls [
<getter>
	^ (handle propertyNamed: #'Controls' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> decimalPlaces [
<getter>
	^ (handle propertyNamed: #'DecimalPlaces' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> decimalPlaces: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DecimalPlaces' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> defaultValue [
<getter>
	^ (handle propertyNamed: #'DefaultValue' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> defaultValue: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DefaultValue' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> displayAsHyperlink [
<getter>
	^ (handle propertyNamed: #'DisplayAsHyperlink' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> displayAsHyperlink: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DisplayAsHyperlink' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> displayWhen [
<getter>
	^ (handle propertyNamed: #'DisplayWhen' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> displayWhen: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DisplayWhen' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> enabled [
<getter>
	^ (handle propertyNamed: #'Enabled' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> enabled: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Enabled' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> enterKeyBehavior [
<getter>
	^ (handle propertyNamed: #'EnterKeyBehavior' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> enterKeyBehavior: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'EnterKeyBehavior' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> eventProcPrefix [
<getter>
	^ (handle propertyNamed: #'EventProcPrefix' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> eventProcPrefix: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'EventProcPrefix' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> filterLookup [
<getter>
	^ (handle propertyNamed: #'FilterLookup' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> filterLookup: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FilterLookup' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> fontBold [
<getter>
	^ (handle propertyNamed: #'FontBold' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> fontBold: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontBold' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> fontItalic [
<getter>
	^ (handle propertyNamed: #'FontItalic' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> fontItalic: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontItalic' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> fontName [
<getter>
	^ (handle propertyNamed: #'FontName' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> fontName: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontName' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> fontSize [
<getter>
	^ (handle propertyNamed: #'FontSize' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> fontSize: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontSize' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> fontUnderline [
<getter>
	^ (handle propertyNamed: #'FontUnderline' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> fontUnderline: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontUnderline' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> fontWeight [
<getter>
	^ (handle propertyNamed: #'FontWeight' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> fontWeight: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontWeight' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> foreColor [
<getter>
	^ (handle propertyNamed: #'ForeColor' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> foreColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ForeColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> foreShade [
<getter>
	^ (handle propertyNamed: #'ForeShade' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> foreShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ForeShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> foreThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'ForeThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> foreThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ForeThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> foreTint [
<getter>
	^ (handle propertyNamed: #'ForeTint' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> foreTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ForeTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> format [
<getter>
	^ (handle propertyNamed: #'Format' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> format: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Format' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> formatConditions [
<getter>
	^ (handle propertyNamed: #'FormatConditions' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> furiganaControl [
<getter>
	^ (handle propertyNamed: #'FuriganaControl' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> furiganaControl: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FuriganaControl' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> gridlineColor [
<getter>
	^ (handle propertyNamed: #'GridlineColor' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> gridlineColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> gridlineShade [
<getter>
	^ (handle propertyNamed: #'GridlineShade' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> gridlineShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> gridlineStyleBottom [
<getter>
	^ (handle propertyNamed: #'GridlineStyleBottom' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> gridlineStyleBottom: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleBottom' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> gridlineStyleLeft [
<getter>
	^ (handle propertyNamed: #'GridlineStyleLeft' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> gridlineStyleLeft: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleLeft' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> gridlineStyleRight [
<getter>
	^ (handle propertyNamed: #'GridlineStyleRight' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> gridlineStyleRight: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleRight' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> gridlineStyleTop [
<getter>
	^ (handle propertyNamed: #'GridlineStyleTop' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> gridlineStyleTop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleTop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> gridlineThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'GridlineThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> gridlineThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> gridlineTint [
<getter>
	^ (handle propertyNamed: #'GridlineTint' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> gridlineTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> gridlineWidthBottom [
<getter>
	^ (handle propertyNamed: #'GridlineWidthBottom' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> gridlineWidthBottom: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthBottom' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> gridlineWidthLeft [
<getter>
	^ (handle propertyNamed: #'GridlineWidthLeft' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> gridlineWidthLeft: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthLeft' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> gridlineWidthRight [
<getter>
	^ (handle propertyNamed: #'GridlineWidthRight' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> gridlineWidthRight: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthRight' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> gridlineWidthTop [
<getter>
	^ (handle propertyNamed: #'GridlineWidthTop' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> gridlineWidthTop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthTop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> height [
<getter>
	^ (handle propertyNamed: #'Height' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> height: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Height' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> helpContextId [
<getter>
	^ (handle propertyNamed: #'HelpContextId' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> helpContextId: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HelpContextId' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> hideDuplicates [
<getter>
	^ (handle propertyNamed: #'HideDuplicates' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> hideDuplicates: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HideDuplicates' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> horizontalAnchor [
<getter>
	^ (handle propertyNamed: #'HorizontalAnchor' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> horizontalAnchor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HorizontalAnchor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> hyperlink [
<getter>
	^ (handle propertyNamed: #'Hyperlink' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> iMEHold [
<getter>
	^ (handle propertyNamed: #'IMEHold' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> iMEHold: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IMEHold' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> iMEMode [
<getter>
	^ (handle propertyNamed: #'IMEMode' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> iMEMode: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IMEMode' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> iMESentenceMode [
<getter>
	^ (handle propertyNamed: #'IMESentenceMode' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> iMESentenceMode: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IMESentenceMode' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> inSelection [
<getter>
	^ (handle propertyNamed: #'InSelection' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> inSelection: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'InSelection' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> inputMask [
<getter>
	^ (handle propertyNamed: #'InputMask' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> inputMask: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'InputMask' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> isHyperlink [
<getter>
	^ (handle propertyNamed: #'IsHyperlink' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> isHyperlink: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IsHyperlink' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> isVisible [
<getter>
	^ (handle propertyNamed: #'IsVisible' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> isVisible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IsVisible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> keyboardLanguage [
<getter>
	^ (handle propertyNamed: #'KeyboardLanguage' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> keyboardLanguage: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'KeyboardLanguage' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> labelAlign [
<getter>
	^ (handle propertyNamed: #'LabelAlign' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> labelAlign: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LabelAlign' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> labelX [
<getter>
	^ (handle propertyNamed: #'LabelX' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> labelX: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LabelX' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> labelY [
<getter>
	^ (handle propertyNamed: #'LabelY' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> labelY: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LabelY' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> layout [
<getter>
	^ (handle propertyNamed: #'Layout' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> layoutID [
<getter>
	^ (handle propertyNamed: #'LayoutID' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> left [
<getter>
	^ (handle propertyNamed: #'Left' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> left: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Left' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> leftMargin [
<getter>
	^ (handle propertyNamed: #'LeftMargin' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> leftMargin: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LeftMargin' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> leftPadding [
<getter>
	^ (handle propertyNamed: #'LeftPadding' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> leftPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LeftPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> lineSpacing [
<getter>
	^ (handle propertyNamed: #'LineSpacing' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> lineSpacing: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LineSpacing' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> locked [
<getter>
	^ (handle propertyNamed: #'Locked' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> locked: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Locked' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlTextbox >> move: aLeft top: aTop width: aWidth height: aHeight [
<method>
"This method can be called with optional parameters. Top,Width,Height"
	^ (handle dispatch: #'Move' withArguments: {aLeft . aTop . aWidth . aHeight} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> name [
<getter>
	^ (handle propertyNamed: #'Name' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> name: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Name' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> numeralShapes [
<getter>
	^ (handle propertyNamed: #'NumeralShapes' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> numeralShapes: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'NumeralShapes' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> oldBorderStyle [
<getter>
	^ (handle propertyNamed: #'OldBorderStyle' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> oldBorderStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OldBorderStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> oldValue [
<getter>
	^ (handle propertyNamed: #'OldValue' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onChange [
<getter>
	^ (handle propertyNamed: #'OnChange' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onChange: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnChange' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onClick [
<getter>
	^ (handle propertyNamed: #'OnClick' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onClick: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnClick' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onDblClick [
<getter>
	^ (handle propertyNamed: #'OnDblClick' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onDblClick: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnDblClick' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onDirty [
<getter>
	^ (handle propertyNamed: #'OnDirty' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onDirty: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnDirty' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onEnter [
<getter>
	^ (handle propertyNamed: #'OnEnter' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onEnter: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnEnter' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onExit [
<getter>
	^ (handle propertyNamed: #'OnExit' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onExit: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnExit' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onGotFocus [
<getter>
	^ (handle propertyNamed: #'OnGotFocus' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onGotFocus: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnGotFocus' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onKeyDown [
<getter>
	^ (handle propertyNamed: #'OnKeyDown' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onKeyDown: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyDown' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onKeyPress [
<getter>
	^ (handle propertyNamed: #'OnKeyPress' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onKeyPress: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyPress' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onKeyUp [
<getter>
	^ (handle propertyNamed: #'OnKeyUp' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onKeyUp: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyUp' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onLostFocus [
<getter>
	^ (handle propertyNamed: #'OnLostFocus' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onLostFocus: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnLostFocus' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onMouseDown [
<getter>
	^ (handle propertyNamed: #'OnMouseDown' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onMouseDown: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseDown' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onMouseMove [
<getter>
	^ (handle propertyNamed: #'OnMouseMove' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onMouseMove: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseMove' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onMouseUp [
<getter>
	^ (handle propertyNamed: #'OnMouseUp' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onMouseUp: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseUp' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onUndo [
<getter>
	^ (handle propertyNamed: #'OnUndo' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> onUndo: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnUndo' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> parent [
<getter>
	^ (handle propertyNamed: #'Parent' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> postalAddress [
<getter>
	^ (handle propertyNamed: #'PostalAddress' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> postalAddress: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'PostalAddress' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> properties [
<getter>
	^ (handle propertyNamed: #'Properties' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> readingOrder [
<getter>
	^ (handle propertyNamed: #'ReadingOrder' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> readingOrder: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ReadingOrder' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlTextbox >> requery [
<method>
	^ (handle dispatch: #'Requery' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> rightMargin [
<getter>
	^ (handle propertyNamed: #'RightMargin' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> rightMargin: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'RightMargin' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> rightPadding [
<getter>
	^ (handle propertyNamed: #'RightPadding' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> rightPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'RightPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> runningSum [
<getter>
	^ (handle propertyNamed: #'RunningSum' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> runningSum: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'RunningSum' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> scrollBarAlign [
<getter>
	^ (handle propertyNamed: #'ScrollBarAlign' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> scrollBarAlign: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ScrollBarAlign' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> scrollBars [
<getter>
	^ (handle propertyNamed: #'ScrollBars' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> scrollBars: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ScrollBars' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> section [
<getter>
	^ (handle propertyNamed: #'Section' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> section: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Section' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> selLength [
<getter>
	^ (handle propertyNamed: #'SelLength' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> selLength: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'SelLength' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> selStart [
<getter>
	^ (handle propertyNamed: #'SelStart' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> selStart: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'SelStart' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> selText [
<getter>
	^ (handle propertyNamed: #'SelText' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> selText: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'SelText' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlTextbox >> setFocus [
<method>
	^ (handle dispatch: #'SetFocus' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> shortcutMenuBar [
<getter>
	^ (handle propertyNamed: #'ShortcutMenuBar' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> shortcutMenuBar: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ShortcutMenuBar' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> showDatePicker [
<getter>
	^ (handle propertyNamed: #'ShowDatePicker' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> showDatePicker: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ShowDatePicker' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlTextbox >> sizeToFit [
<method>
	^ (handle dispatch: #'SizeToFit' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> smartTags [
<getter>
	^ (handle propertyNamed: #'SmartTags' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> specialEffect [
<getter>
	^ (handle propertyNamed: #'SpecialEffect' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> specialEffect: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'SpecialEffect' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> statusBarText [
<getter>
	^ (handle propertyNamed: #'StatusBarText' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> statusBarText: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'StatusBarText' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> tabIndex [
<getter>
	^ (handle propertyNamed: #'TabIndex' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> tabIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TabIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> tabStop [
<getter>
	^ (handle propertyNamed: #'TabStop' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> tabStop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TabStop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> tag [
<getter>
	^ (handle propertyNamed: #'Tag' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> tag: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Tag' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> text [
<getter>
	^ (handle propertyNamed: #'Text' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> text: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Text' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> textAlign [
<getter>
	^ (handle propertyNamed: #'TextAlign' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> textAlign: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TextAlign' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> textFormat [
<getter>
	^ (handle propertyNamed: #'TextFormat' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> textFormat: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TextFormat' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> themeFontIndex [
<getter>
	^ (handle propertyNamed: #'ThemeFontIndex' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> themeFontIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ThemeFontIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> top [
<getter>
	^ (handle propertyNamed: #'Top' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> top: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Top' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> topMargin [
<getter>
	^ (handle propertyNamed: #'TopMargin' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> topMargin: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TopMargin' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> topPadding [
<getter>
	^ (handle propertyNamed: #'TopPadding' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> topPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TopPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> validationRule [
<getter>
	^ (handle propertyNamed: #'ValidationRule' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> validationRule: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ValidationRule' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> validationText [
<getter>
	^ (handle propertyNamed: #'ValidationText' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> validationText: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ValidationText' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> value [
<getter>
	^ (handle propertyNamed: #'Value' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> value: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Value' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> vertical [
<getter>
	^ (handle propertyNamed: #'Vertical' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> vertical: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Vertical' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> verticalAnchor [
<getter>
	^ (handle propertyNamed: #'VerticalAnchor' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> verticalAnchor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'VerticalAnchor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> visible [
<getter>
	^ (handle propertyNamed: #'Visible' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> visible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Visible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlTextbox >> width [
<getter>
	^ (handle propertyNamed: #'Width' ).

]

{ #category : #'property - generated' }
JinControlTextbox >> width: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Width' withArguments: {aParam1} ).

]
