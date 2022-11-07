"
---
title: ListBox object (Access)
keywords: vbaac10.chm11354
f1_keywords:
- vbaac10.chm11354
ms.prod: access
api_name:
- Access.ListBox
ms.assetid: 6bc00755-34e7-4fc2-8e72-40dae2010dd8
ms.date: 03/21/2019
localization_priority: Normal
---


# ListBox object (Access)

This object corresponds to a list box control. The list box control displays a list of values or alternatives.


## Remarks

|Control|Tool|
|:-----|:-----|
|![List box control](../images/t-lstbox_ZA06053984.gif)|![List box tool](../images/listbox_ZA06044481.gif)|

In many cases, it's quicker and easier to select a value from a list than to remember a value to type. A list of choices also helps ensure that the value that's entered in a field is correct.

The list in a list box consists of rows of data. Rows can have one or more columns, which can appear with or without headings, as shown in the following diagram.

![Multi-column list box](../images/cfrmlst2_ZA06047456.gif)

If a multiple-column list box is bound, Microsoft Access stores the values from one of the columns.

You can use an unbound list box to store a value that you can use with another control. For example, you could use an unbound list box to limit the values in another list box or in a custom dialog box. You could also use an unbound list box to find a record based on the value that you select in the list box.

If you don't have room on your form to display a list box, or if you want to be able to type new values as well as select values from a list, use a combo box instead of a list box.

## Example

This example demonstrates how to filter the contents of a list box while you are typing in a text box.

In this example, a list box named **ColorID** displays a list of colors stored in the **Colors** table. As you type in the **FilterBy** text box, the items in **ColorID** are filtered dynamically.

To do this, use the **Change** event of the text box to build a SQL statement that will serve as the new RowSource of the list box.

```vb
Private Sub FilterBy_Change()

    Dim sql As String
    
    'This will match any entry in the list that begins with what the user 
    'has typed in the FilterBy control
    sql = ""SELECT ColorID, ColorName FROM Colors WHERE ColorName Like '"" & Me.FilterBy.Text & ""*' ORDER BY ColorName""
    
    'If you want to match any part of the string then add wildcard (*) before
    'the FilterBy.Text, too:
    'sql = ""SELECT ColorID, ColorName FROM Colors WHERE ColorName Like '*"" & Me.FilterBy.Text & ""*' ORDER BY ColorName""
    
    Me.ColorID.RowSource = sql
    
End Sub
```


## Events

- [AfterUpdate](Access.ListBox.AfterUpdate-event.md)
- [BeforeUpdate](Access.ListBox.BeforeUpdate-event.md)
- [Click](Access.ListBox.Click.md)
- [DblClick](Access.ListBox.DblClick.md)
- [Enter](Access.ListBox.Enter.md)
- [Exit](Access.ListBox.Exit.md)
- [GotFocus](Access.ListBox.GotFocus.md)
- [KeyDown](Access.ListBox.KeyDown.md)
- [KeyPress](Access.ListBox.KeyPress.md)
- [KeyUp](Access.ListBox.KeyUp.md)
- [LostFocus](Access.ListBox.LostFocus.md)
- [MouseDown](Access.ListBox.MouseDown.md)
- [MouseMove](Access.ListBox.MouseMove.md)
- [MouseUp](Access.ListBox.MouseUp.md)

## Methods

- [AddItem](Access.ListBox.AddItem.md)
- [Move](Access.ListBox.Move.md)
- [RemoveItem](Access.ListBox.RemoveItem.md)
- [Requery](Access.ListBox.Requery.md)
- [SetFocus](Access.ListBox.SetFocus.md)
- [SizeToFit](Access.ListBox.SizeToFit.md)
- [Undo](Access.ListBox.Undo.md)

## Properties

- [AddColon](Access.ListBox.AddColon.md)
- [AfterUpdate](Access.ListBox.AfterUpdate-property.md)
- [AllowValueListEdits](Access.ListBox.AllowValueListEdits.md)
- [Application](Access.ListBox.Application.md)
- [AutoLabel](Access.ListBox.AutoLabel.md)
- [BackColor](Access.ListBox.BackColor.md)
- [BackShade](Access.ListBox.BackShade.md)
- [BackThemeColorIndex](Access.ListBox.BackThemeColorIndex.md)
- [BackTint](Access.ListBox.BackTint.md)
- [BeforeUpdate](Access.ListBox.BeforeUpdate-property.md)
- [BorderColor](Access.ListBox.BorderColor.md)
- [BorderShade](Access.ListBox.BorderShade.md)
- [BorderStyle](Access.ListBox.BorderStyle.md)
- [BorderThemeColorIndex](Access.ListBox.BorderThemeColorIndex.md)
- [BorderTint](Access.ListBox.BorderTint.md)
- [BorderWidth](Access.ListBox.BorderWidth.md)
- [BottomPadding](Access.ListBox.BottomPadding.md)
- [BoundColumn](Access.ListBox.BoundColumn.md)
- [Column](Access.ListBox.Column.md)
- [ColumnCount](Access.ListBox.ColumnCount.md)
- [ColumnHeads](Access.ListBox.ColumnHeads.md)
- [ColumnHidden](Access.ListBox.ColumnHidden.md)
- [ColumnOrder](Access.ListBox.ColumnOrder.md)
- [ColumnWidth](Access.ListBox.ColumnWidth.md)
- [ColumnWidths](Access.ListBox.ColumnWidths.md)
- [Controls](Access.ListBox.Controls.md)
- [ControlSource](Access.ListBox.ControlSource.md)
- [ControlTipText](Access.ListBox.ControlTipText.md)
- [ControlType](Access.ListBox.ControlType.md)
- [DefaultValue](Access.ListBox.DefaultValue.md)
- [DisplayWhen](Access.ListBox.DisplayWhen.md)
- [Enabled](Access.ListBox.Enabled.md)
- [EventProcPrefix](Access.ListBox.EventProcPrefix.md)
- [FontBold](Access.ListBox.FontBold.md)
- [FontItalic](Access.ListBox.FontItalic.md)
- [FontName](Access.ListBox.FontName.md)
- [FontSize](Access.ListBox.FontSize.md)
- [FontUnderline](Access.ListBox.FontUnderline.md)
- [FontWeight](Access.ListBox.FontWeight.md)
- [ForeColor](Access.ListBox.ForeColor.md)
- [ForeShade](Access.ListBox.ForeShade.md)
- [ForeThemeColorIndex](Access.ListBox.ForeThemeColorIndex.md)
- [ForeTint](Access.ListBox.ForeTint.md)
- [GridlineColor](Access.ListBox.GridlineColor.md)
- [GridlineShade](Access.ListBox.GridlineShade.md)
- [GridlineStyleBottom](Access.ListBox.GridlineStyleBottom.md)
- [GridlineStyleLeft](Access.ListBox.GridlineStyleLeft.md)
- [GridlineStyleRight](Access.ListBox.GridlineStyleRight.md)
- [GridlineStyleTop](Access.ListBox.GridlineStyleTop.md)
- [GridlineThemeColorIndex](Access.ListBox.GridlineThemeColorIndex.md)
- [GridlineTint](Access.ListBox.GridlineTint.md)
- [GridlineWidthBottom](Access.ListBox.GridlineWidthBottom.md)
- [GridlineWidthLeft](Access.ListBox.GridlineWidthLeft.md)
- [GridlineWidthRight](Access.ListBox.GridlineWidthRight.md)
- [GridlineWidthTop](Access.ListBox.GridlineWidthTop.md)
- [Height](Access.ListBox.Height.md)
- [HelpContextId](Access.ListBox.HelpContextId.md)
- [HideDuplicates](Access.ListBox.HideDuplicates.md)
- [HorizontalAnchor](Access.ListBox.HorizontalAnchor.md)
- [Hyperlink](Access.ListBox.Hyperlink.md)
- [IMEHold](Access.ListBox.IMEHold.md)
- [IMEMode](Access.ListBox.IMEMode.md)
- [IMESentenceMode](Access.ListBox.IMESentenceMode.md)
- [InheritValueList](Access.ListBox.InheritValueList.md)
- [InSelection](Access.ListBox.InSelection.md)
- [IsVisible](Access.ListBox.IsVisible.md)
- [ItemData](Access.ListBox.ItemData.md)
- [ItemsSelected](Access.ListBox.ItemsSelected.md)
- [LabelAlign](Access.ListBox.LabelAlign.md)
- [LabelX](Access.ListBox.LabelX.md)
- [LabelY](Access.ListBox.LabelY.md)
- [Layout](Access.ListBox.Layout.md)
- [LayoutID](Access.ListBox.LayoutID.md)
- [Left](Access.ListBox.Left.md)
- [LeftPadding](Access.ListBox.LeftPadding.md)
- [ListCount](Access.ListBox.ListCount.md)
- [ListIndex](Access.ListBox.ListIndex.md)
- [ListItemsEditForm](Access.ListBox.ListItemsEditForm.md)
- [Locked](Access.ListBox.Locked.md)
- [MultiSelect](Access.ListBox.MultiSelect.md)
- [Name](Access.ListBox.Name.md)
- [NumeralShapes](Access.ListBox.NumeralShapes.md)
- [OldBorderStyle](Access.ListBox.OldBorderStyle.md)
- [OldValue](Access.ListBox.OldValue.md)
- [OnClick](Access.ListBox.OnClick.md)
- [OnDblClick](Access.ListBox.OnDblClick.md)
- [OnEnter](Access.ListBox.OnEnter.md)
- [OnExit](Access.ListBox.OnExit.md)
- [OnGotFocus](Access.ListBox.OnGotFocus.md)
- [OnKeyDown](Access.ListBox.OnKeyDown.md)
- [OnKeyPress](Access.ListBox.OnKeyPress.md)
- [OnKeyUp](Access.ListBox.OnKeyUp.md)
- [OnLostFocus](Access.ListBox.OnLostFocus.md)
- [OnMouseDown](Access.ListBox.OnMouseDown.md)
- [OnMouseMove](Access.ListBox.OnMouseMove.md)
- [OnMouseUp](Access.ListBox.OnMouseUp.md)
- [Parent](Access.ListBox.Parent.md)
- [Properties](Access.ListBox.Properties.md)
- [ReadingOrder](Access.ListBox.ReadingOrder.md)
- [Recordset](Access.ListBox.Recordset.md)
- [RightPadding](Access.ListBox.RightPadding.md)
- [RowSource](Access.ListBox.RowSource.md)
- [RowSourceType](Access.ListBox.RowSourceType.md)
- [ScrollBarAlign](Access.ListBox.ScrollBarAlign.md)
- [Section](Access.ListBox.Section.md)
- [Selected](Access.ListBox.Selected.md)
- [ShortcutMenuBar](Access.ListBox.ShortcutMenuBar.md)
- [ShowOnlyRowSourceValues](Access.ListBox.ShowOnlyRowSourceValues.md)
- [SmartTags](Access.ListBox.SmartTags.md)
- [SpecialEffect](Access.ListBox.SpecialEffect.md)
- [StatusBarText](Access.ListBox.StatusBarText.md)
- [TabIndex](Access.ListBox.TabIndex.md)
- [TabStop](Access.ListBox.TabStop.md)
- [Tag](Access.ListBox.Tag.md)
- [ThemeFontIndex](Access.ListBox.ThemeFontIndex.md)
- [Top](Access.ListBox.Top.md)
- [TopPadding](Access.ListBox.TopPadding.md)
- [ValidationRule](Access.ListBox.ValidationRule.md)
- [ValidationText](Access.ListBox.ValidationText.md)
- [Value](Access.ListBox.Value.md)
- [VerticalAnchor](Access.ListBox.VerticalAnchor.md)
- [Visible](Access.ListBox.Visible.md)
- [Width](Access.ListBox.Width.md)

## See also

- [Access object model reference](overview/Access/object-model.md)


[!include[Support and feedback](~/includes/feedback-boilerplate.md)]

"
Class {
	#name : #JinListBox,
	#superclass : #JinControlAbstractListBox,
	#category : #'Jindao-FormControls-Builtin'
}

{ #category : #generated }
JinListBox class >> componentKnownProperties [
	^ #(
    AddColon
    AfterUpdate
    AllowValueListEdits
    AutoLabel
    BackColor
    BackShade
    BackThemeColorIndex
    BackTint
    BeforeUpdate
	AfterUpdateMacro
	 BeforeUpdateMacro
    BorderColor
    BorderShade
    BorderStyle
    BorderThemeColorIndex
    BorderTint
    BorderWidth
    BottomPadding
    BoundColumn
    Column
    ColumnCount
    ColumnHeads
    ColumnHidden
    ColumnOrder
    ColumnWidth
    ColumnWidths
    ControlSource
    ControlTipText
    ControlType
    DefaultValue
    DisplayWhen
    Enabled
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
    HideDuplicates
    HorizontalAnchor
    IMEHold
    IMEMode
    IMESentenceMode
    InheritValueList
    InSelection
    IsVisible
    ItemData
    ItemsSelected
    LabelAlign
    LabelX
    LabelY
    Layout
    LayoutID
    Left
    LeftPadding
    ListCount
    ListIndex
    ListItemsEditForm
    Locked
    MultiSelect
    Name
    NumeralShapes
    OldBorderStyle
    OldValue
    OnClick
    OnDblClick
    OnEnter
    OnExit
    OnGotFocus
    OnKeyDown
    OnKeyPress
    OnKeyUp
    OnLostFocus
    OnMouseDown
    OnMouseMove
    OnMouseUp
'OnClickMacro' 'OnDblClickMacro' 'OnEnterMacro' 'OnExitMacro' 'OnGotFocusMacro' 'OnKeyDownMacro' 'OnKeyPressMacro' 'OnKeyUpMacro' 'OnLostFocusMacro' 'OnMouseDownMacro' 'OnMouseMoveMacro' 'OnMouseUpMacro'
    ReadingOrder
    Recordset
    RightPadding
    RowSource
    RowSourceType
    ScrollBarAlign
    Section
    Selected
    ShortcutMenuBar
    ShowOnlyRowSourceValues
    SmartTags
    SpecialEffect
    StatusBarText
    TabIndex
    TabStop
    Tag
    ThemeFontIndex
    Top
    TopPadding
    ValidationRule
    ValidationText
    Value
    VerticalAnchor
    Visible
    Width
)
]

{ #category : #generated }
JinListBox class >> mappedTypeName [
	^#'_ListBox'
]

{ #category : #generated }
JinListBox >> acceptVisitor: aVisitor [
	^ aVisitor visitListBox: self
]

{ #category : #'property - generated' }
JinListBox >> addColon [
<getter>
	^ (handle propertyNamed: #'AddColon' ).

]

{ #category : #'property - generated' }
JinListBox >> addColon: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AddColon' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinListBox >> addItem: aItem index: aIndex [
<method>
"This method can be called with optional parameters. Index"
	^ (handle dispatch: #'AddItem' withArguments: {aItem . aIndex} ).

]

{ #category : #'property - generated' }
JinListBox >> allowValueListEdits [
<getter>
	^ (handle propertyNamed: #'AllowValueListEdits' ).

]

{ #category : #'property - generated' }
JinListBox >> allowValueListEdits: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AllowValueListEdits' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> application [
<getter>
	^ (handle propertyNamed: #'Application' ).

]

{ #category : #'property - generated' }
JinListBox >> autoLabel [
<getter>
	^ (handle propertyNamed: #'AutoLabel' ).

]

{ #category : #'property - generated' }
JinListBox >> autoLabel: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AutoLabel' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> backColor [
<getter>
	^ (handle propertyNamed: #'BackColor' ).

]

{ #category : #'property - generated' }
JinListBox >> backColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> backShade [
<getter>
	^ (handle propertyNamed: #'BackShade' ).

]

{ #category : #'property - generated' }
JinListBox >> backShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> backThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'BackThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinListBox >> backThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> backTint [
<getter>
	^ (handle propertyNamed: #'BackTint' ).

]

{ #category : #'property - generated' }
JinListBox >> backTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> borderColor [
<getter>
	^ (handle propertyNamed: #'BorderColor' ).

]

{ #category : #'property - generated' }
JinListBox >> borderColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> borderShade [
<getter>
	^ (handle propertyNamed: #'BorderShade' ).

]

{ #category : #'property - generated' }
JinListBox >> borderShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> borderStyle [
<getter>
	^ (handle propertyNamed: #'BorderStyle' ).

]

{ #category : #'property - generated' }
JinListBox >> borderStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> borderThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'BorderThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinListBox >> borderThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> borderTint [
<getter>
	^ (handle propertyNamed: #'BorderTint' ).

]

{ #category : #'property - generated' }
JinListBox >> borderTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> borderWidth [
<getter>
	^ (handle propertyNamed: #'BorderWidth' ).

]

{ #category : #'property - generated' }
JinListBox >> borderWidth: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderWidth' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> bottomPadding [
<getter>
	^ (handle propertyNamed: #'BottomPadding' ).

]

{ #category : #'property - generated' }
JinListBox >> bottomPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BottomPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> boundColumn [
<getter>
	^ (handle propertyNamed: #'BoundColumn' ).

]

{ #category : #'property - generated' }
JinListBox >> boundColumn: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BoundColumn' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> column: aIndex row: aRow [
<getter>
"This method can be called with optional parameters. Row"
	^ (handle propertyNamed: #'Column' withArguments: {aIndex . aRow} ).

]

{ #category : #'property - generated' }
JinListBox >> columnCount [
<getter>
	^ (handle propertyNamed: #'ColumnCount' ).

]

{ #category : #'property - generated' }
JinListBox >> columnCount: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ColumnCount' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> columnHeads [
<getter>
	^ (handle propertyNamed: #'ColumnHeads' ).

]

{ #category : #'property - generated' }
JinListBox >> columnHeads: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ColumnHeads' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> columnHidden [
<getter>
	^ (handle propertyNamed: #'ColumnHidden' ).

]

{ #category : #'property - generated' }
JinListBox >> columnHidden: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ColumnHidden' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> columnOrder [
<getter>
	^ (handle propertyNamed: #'ColumnOrder' ).

]

{ #category : #'property - generated' }
JinListBox >> columnOrder: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ColumnOrder' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> columnWidth [
<getter>
	^ (handle propertyNamed: #'ColumnWidth' ).

]

{ #category : #'property - generated' }
JinListBox >> columnWidth: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ColumnWidth' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> columnWidths [
<getter>
	^ (handle propertyNamed: #'ColumnWidths' ).

]

{ #category : #'property - generated' }
JinListBox >> columnWidths: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ColumnWidths' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> controlSource [
<getter>
	^ (handle propertyNamed: #'ControlSource' ).

]

{ #category : #'property - generated' }
JinListBox >> controlSource: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlSource' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> controlTipText [
<getter>
	^ (handle propertyNamed: #'ControlTipText' ).

]

{ #category : #'property - generated' }
JinListBox >> controlTipText: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlTipText' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> controlType [
<getter>
	^ (handle propertyNamed: #'ControlType' ).

]

{ #category : #'property - generated' }
JinListBox >> controlType: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlType' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> controls [
<getter>
	^ (handle propertyNamed: #'Controls' ).

]

{ #category : #'property - generated' }
JinListBox >> defaultValue [
<getter>
	^ (handle propertyNamed: #'DefaultValue' ).

]

{ #category : #'property - generated' }
JinListBox >> defaultValue: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DefaultValue' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> displayWhen [
<getter>
	^ (handle propertyNamed: #'DisplayWhen' ).

]

{ #category : #'property - generated' }
JinListBox >> displayWhen: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DisplayWhen' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> enabled [
<getter>
	^ (handle propertyNamed: #'Enabled' ).

]

{ #category : #'property - generated' }
JinListBox >> enabled: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Enabled' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> eventProcPrefix [
<getter>
	^ (handle propertyNamed: #'EventProcPrefix' ).

]

{ #category : #'property - generated' }
JinListBox >> eventProcPrefix: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'EventProcPrefix' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> fontBold [
<getter>
	^ (handle propertyNamed: #'FontBold' ).

]

{ #category : #'property - generated' }
JinListBox >> fontBold: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontBold' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> fontItalic [
<getter>
	^ (handle propertyNamed: #'FontItalic' ).

]

{ #category : #'property - generated' }
JinListBox >> fontItalic: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontItalic' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> fontName [
<getter>
	^ (handle propertyNamed: #'FontName' ).

]

{ #category : #'property - generated' }
JinListBox >> fontName: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontName' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> fontSize [
<getter>
	^ (handle propertyNamed: #'FontSize' ).

]

{ #category : #'property - generated' }
JinListBox >> fontSize: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontSize' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> fontUnderline [
<getter>
	^ (handle propertyNamed: #'FontUnderline' ).

]

{ #category : #'property - generated' }
JinListBox >> fontUnderline: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontUnderline' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> fontWeight [
<getter>
	^ (handle propertyNamed: #'FontWeight' ).

]

{ #category : #'property - generated' }
JinListBox >> fontWeight: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontWeight' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> foreColor [
<getter>
	^ (handle propertyNamed: #'ForeColor' ).

]

{ #category : #'property - generated' }
JinListBox >> foreColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ForeColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> foreShade [
<getter>
	^ (handle propertyNamed: #'ForeShade' ).

]

{ #category : #'property - generated' }
JinListBox >> foreShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ForeShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> foreThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'ForeThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinListBox >> foreThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ForeThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> foreTint [
<getter>
	^ (handle propertyNamed: #'ForeTint' ).

]

{ #category : #'property - generated' }
JinListBox >> foreTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ForeTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> gridlineColor [
<getter>
	^ (handle propertyNamed: #'GridlineColor' ).

]

{ #category : #'property - generated' }
JinListBox >> gridlineColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> gridlineShade [
<getter>
	^ (handle propertyNamed: #'GridlineShade' ).

]

{ #category : #'property - generated' }
JinListBox >> gridlineShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> gridlineStyleBottom [
<getter>
	^ (handle propertyNamed: #'GridlineStyleBottom' ).

]

{ #category : #'property - generated' }
JinListBox >> gridlineStyleBottom: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleBottom' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> gridlineStyleLeft [
<getter>
	^ (handle propertyNamed: #'GridlineStyleLeft' ).

]

{ #category : #'property - generated' }
JinListBox >> gridlineStyleLeft: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleLeft' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> gridlineStyleRight [
<getter>
	^ (handle propertyNamed: #'GridlineStyleRight' ).

]

{ #category : #'property - generated' }
JinListBox >> gridlineStyleRight: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleRight' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> gridlineStyleTop [
<getter>
	^ (handle propertyNamed: #'GridlineStyleTop' ).

]

{ #category : #'property - generated' }
JinListBox >> gridlineStyleTop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleTop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> gridlineThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'GridlineThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinListBox >> gridlineThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> gridlineTint [
<getter>
	^ (handle propertyNamed: #'GridlineTint' ).

]

{ #category : #'property - generated' }
JinListBox >> gridlineTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> gridlineWidthBottom [
<getter>
	^ (handle propertyNamed: #'GridlineWidthBottom' ).

]

{ #category : #'property - generated' }
JinListBox >> gridlineWidthBottom: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthBottom' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> gridlineWidthLeft [
<getter>
	^ (handle propertyNamed: #'GridlineWidthLeft' ).

]

{ #category : #'property - generated' }
JinListBox >> gridlineWidthLeft: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthLeft' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> gridlineWidthRight [
<getter>
	^ (handle propertyNamed: #'GridlineWidthRight' ).

]

{ #category : #'property - generated' }
JinListBox >> gridlineWidthRight: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthRight' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> gridlineWidthTop [
<getter>
	^ (handle propertyNamed: #'GridlineWidthTop' ).

]

{ #category : #'property - generated' }
JinListBox >> gridlineWidthTop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthTop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> height [
<getter>
	^ (handle propertyNamed: #'Height' ).

]

{ #category : #'property - generated' }
JinListBox >> height: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Height' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> helpContextId [
<getter>
	^ (handle propertyNamed: #'HelpContextId' ).

]

{ #category : #'property - generated' }
JinListBox >> helpContextId: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HelpContextId' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> hideDuplicates [
<getter>
	^ (handle propertyNamed: #'HideDuplicates' ).

]

{ #category : #'property - generated' }
JinListBox >> hideDuplicates: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HideDuplicates' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> horizontalAnchor [
<getter>
	^ (handle propertyNamed: #'HorizontalAnchor' ).

]

{ #category : #'property - generated' }
JinListBox >> horizontalAnchor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HorizontalAnchor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> hyperlink [
<getter>
	^ (handle propertyNamed: #'Hyperlink' ).

]

{ #category : #'property - generated' }
JinListBox >> iMEHold [
<getter>
	^ (handle propertyNamed: #'IMEHold' ).

]

{ #category : #'property - generated' }
JinListBox >> iMEHold: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IMEHold' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> iMEMode [
<getter>
	^ (handle propertyNamed: #'IMEMode' ).

]

{ #category : #'property - generated' }
JinListBox >> iMEMode: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IMEMode' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> iMESentenceMode [
<getter>
	^ (handle propertyNamed: #'IMESentenceMode' ).

]

{ #category : #'property - generated' }
JinListBox >> iMESentenceMode: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IMESentenceMode' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> inSelection [
<getter>
	^ (handle propertyNamed: #'InSelection' ).

]

{ #category : #'property - generated' }
JinListBox >> inSelection: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'InSelection' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> inheritValueList [
<getter>
	^ (handle propertyNamed: #'InheritValueList' ).

]

{ #category : #'property - generated' }
JinListBox >> inheritValueList: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'InheritValueList' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> isVisible [
<getter>
	^ (handle propertyNamed: #'IsVisible' ).

]

{ #category : #'property - generated' }
JinListBox >> isVisible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IsVisible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> itemData: aIndex [
<getter>

	^ (handle propertyNamed: #'ItemData' withArguments: {aIndex} ).

]

{ #category : #'property - generated' }
JinListBox >> itemsSelected [
<getter>
	^ (handle propertyNamed: #'ItemsSelected' ).

]

{ #category : #'property - generated' }
JinListBox >> labelAlign [
<getter>
	^ (handle propertyNamed: #'LabelAlign' ).

]

{ #category : #'property - generated' }
JinListBox >> labelAlign: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LabelAlign' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> labelX [
<getter>
	^ (handle propertyNamed: #'LabelX' ).

]

{ #category : #'property - generated' }
JinListBox >> labelX: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LabelX' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> labelY [
<getter>
	^ (handle propertyNamed: #'LabelY' ).

]

{ #category : #'property - generated' }
JinListBox >> labelY: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LabelY' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> layout [
<getter>
	^ (handle propertyNamed: #'Layout' ).

]

{ #category : #'property - generated' }
JinListBox >> layoutID [
<getter>
	^ (handle propertyNamed: #'LayoutID' ).

]

{ #category : #'property - generated' }
JinListBox >> left [
<getter>
	^ (handle propertyNamed: #'Left' ).

]

{ #category : #'property - generated' }
JinListBox >> left: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Left' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> leftPadding [
<getter>
	^ (handle propertyNamed: #'LeftPadding' ).

]

{ #category : #'property - generated' }
JinListBox >> leftPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LeftPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> listCount [
<getter>
	^ (handle propertyNamed: #'ListCount' ).

]

{ #category : #'property - generated' }
JinListBox >> listCount: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ListCount' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> listIndex [
<getter>
	^ (handle propertyNamed: #'ListIndex' ).

]

{ #category : #'property - generated' }
JinListBox >> listIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ListIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> listItemsEditForm [
<getter>
	^ (handle propertyNamed: #'ListItemsEditForm' ).

]

{ #category : #'property - generated' }
JinListBox >> listItemsEditForm: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ListItemsEditForm' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> locked [
<getter>
	^ (handle propertyNamed: #'Locked' ).

]

{ #category : #'property - generated' }
JinListBox >> locked: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Locked' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinListBox >> move: aLeft top: aTop width: aWidth height: aHeight [
<method>
"This method can be called with optional parameters. Top,Width,Height"
	^ (handle dispatch: #'Move' withArguments: {aLeft . aTop . aWidth . aHeight} ).

]

{ #category : #'property - generated' }
JinListBox >> multiSelect [
<getter>
	^ (handle propertyNamed: #'MultiSelect' ).

]

{ #category : #'property - generated' }
JinListBox >> multiSelect: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'MultiSelect' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> name: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Name' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> numeralShapes [
<getter>
	^ (handle propertyNamed: #'NumeralShapes' ).

]

{ #category : #'property - generated' }
JinListBox >> numeralShapes: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'NumeralShapes' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> oldBorderStyle [
<getter>
	^ (handle propertyNamed: #'OldBorderStyle' ).

]

{ #category : #'property - generated' }
JinListBox >> oldBorderStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OldBorderStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> oldValue [
<getter>
	^ (handle propertyNamed: #'OldValue' ).

]

{ #category : #'property - generated' }
JinListBox >> onClick [
<getter>
	^ (handle propertyNamed: #'OnClick' ).

]

{ #category : #'property - generated' }
JinListBox >> onClick: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnClick' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> onDblClick [
<getter>
	^ (handle propertyNamed: #'OnDblClick' ).

]

{ #category : #'property - generated' }
JinListBox >> onDblClick: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnDblClick' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> onEnter [
<getter>
	^ (handle propertyNamed: #'OnEnter' ).

]

{ #category : #'property - generated' }
JinListBox >> onEnter: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnEnter' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> onExit [
<getter>
	^ (handle propertyNamed: #'OnExit' ).

]

{ #category : #'property - generated' }
JinListBox >> onExit: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnExit' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> onGotFocus [
<getter>
	^ (handle propertyNamed: #'OnGotFocus' ).

]

{ #category : #'property - generated' }
JinListBox >> onGotFocus: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnGotFocus' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> onKeyDown [
<getter>
	^ (handle propertyNamed: #'OnKeyDown' ).

]

{ #category : #'property - generated' }
JinListBox >> onKeyDown: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyDown' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> onKeyPress [
<getter>
	^ (handle propertyNamed: #'OnKeyPress' ).

]

{ #category : #'property - generated' }
JinListBox >> onKeyPress: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyPress' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> onKeyUp [
<getter>
	^ (handle propertyNamed: #'OnKeyUp' ).

]

{ #category : #'property - generated' }
JinListBox >> onKeyUp: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyUp' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> onLostFocus [
<getter>
	^ (handle propertyNamed: #'OnLostFocus' ).

]

{ #category : #'property - generated' }
JinListBox >> onLostFocus: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnLostFocus' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> onMouseDown [
<getter>
	^ (handle propertyNamed: #'OnMouseDown' ).

]

{ #category : #'property - generated' }
JinListBox >> onMouseDown: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseDown' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> onMouseMove [
<getter>
	^ (handle propertyNamed: #'OnMouseMove' ).

]

{ #category : #'property - generated' }
JinListBox >> onMouseMove: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseMove' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> onMouseUp [
<getter>
	^ (handle propertyNamed: #'OnMouseUp' ).

]

{ #category : #'property - generated' }
JinListBox >> onMouseUp: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseUp' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> readingOrder [
<getter>
	^ (handle propertyNamed: #'ReadingOrder' ).

]

{ #category : #'property - generated' }
JinListBox >> readingOrder: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ReadingOrder' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> recordset [
<getter>
	^ (handle propertyNamed: #'Recordset' ).

]

{ #category : #'method - generated' }
JinListBox >> recordset: aParam1 [
<method>

	^ (handle dispatch: #'Recordset' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinListBox >> removeItem: aIndex [
<method>

	^ (handle dispatch: #'RemoveItem' withArguments: {aIndex} ).

]

{ #category : #'method - generated' }
JinListBox >> requery [
<method>
	^ (handle dispatch: #'Requery' ).

]

{ #category : #'property - generated' }
JinListBox >> rightPadding [
<getter>
	^ (handle propertyNamed: #'RightPadding' ).

]

{ #category : #'property - generated' }
JinListBox >> rightPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'RightPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> rowSource [
<getter>
	^ (handle propertyNamed: #'RowSource' ).

]

{ #category : #'property - generated' }
JinListBox >> rowSource: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'RowSource' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> rowSourceType [
<getter>
	^ (handle propertyNamed: #'RowSourceType' ).

]

{ #category : #'property - generated' }
JinListBox >> rowSourceType: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'RowSourceType' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> scrollBarAlign [
<getter>
	^ (handle propertyNamed: #'ScrollBarAlign' ).

]

{ #category : #'property - generated' }
JinListBox >> scrollBarAlign: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ScrollBarAlign' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> section [
<getter>
	^ (handle propertyNamed: #'Section' ).

]

{ #category : #'property - generated' }
JinListBox >> section: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Section' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> selected: aLRow [
<getter>

	^ (handle propertyNamed: #'Selected' withArguments: {aLRow} ).

]

{ #category : #'property - generated' }
JinListBox >> selected: aLRow aParam1: aParam1 [
<setter>
	
	^ (handle propertyNamed: #'Selected' withArguments: {aLRow . aParam1} ).

]

{ #category : #'method - generated' }
JinListBox >> setFocus [
<method>
	^ (handle dispatch: #'SetFocus' ).

]

{ #category : #'property - generated' }
JinListBox >> shortcutMenuBar [
<getter>
	^ (handle propertyNamed: #'ShortcutMenuBar' ).

]

{ #category : #'property - generated' }
JinListBox >> shortcutMenuBar: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ShortcutMenuBar' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> showOnlyRowSourceValues [
<getter>
	^ (handle propertyNamed: #'ShowOnlyRowSourceValues' ).

]

{ #category : #'property - generated' }
JinListBox >> showOnlyRowSourceValues: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ShowOnlyRowSourceValues' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinListBox >> sizeToFit [
<method>
	^ (handle dispatch: #'SizeToFit' ).

]

{ #category : #'property - generated' }
JinListBox >> smartTags [
<getter>
	^ (handle propertyNamed: #'SmartTags' ).

]

{ #category : #'property - generated' }
JinListBox >> specialEffect [
<getter>
	^ (handle propertyNamed: #'SpecialEffect' ).

]

{ #category : #'property - generated' }
JinListBox >> specialEffect: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'SpecialEffect' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> statusBarText [
<getter>
	^ (handle propertyNamed: #'StatusBarText' ).

]

{ #category : #'property - generated' }
JinListBox >> statusBarText: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'StatusBarText' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> tabIndex [
<getter>
	^ (handle propertyNamed: #'TabIndex' ).

]

{ #category : #'property - generated' }
JinListBox >> tabIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TabIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> tabStop [
<getter>
	^ (handle propertyNamed: #'TabStop' ).

]

{ #category : #'property - generated' }
JinListBox >> tabStop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TabStop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> tag [
<getter>
	^ (handle propertyNamed: #'Tag' ).

]

{ #category : #'property - generated' }
JinListBox >> tag: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Tag' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> themeFontIndex [
<getter>
	^ (handle propertyNamed: #'ThemeFontIndex' ).

]

{ #category : #'property - generated' }
JinListBox >> themeFontIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ThemeFontIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> top [
<getter>
	^ (handle propertyNamed: #'Top' ).

]

{ #category : #'property - generated' }
JinListBox >> top: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Top' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> topPadding [
<getter>
	^ (handle propertyNamed: #'TopPadding' ).

]

{ #category : #'property - generated' }
JinListBox >> topPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TopPadding' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinListBox >> undo [
<method>
	^ (handle dispatch: #'Undo' ).

]

{ #category : #'property - generated' }
JinListBox >> validationRule [
<getter>
	^ (handle propertyNamed: #'ValidationRule' ).

]

{ #category : #'property - generated' }
JinListBox >> validationRule: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ValidationRule' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> validationText [
<getter>
	^ (handle propertyNamed: #'ValidationText' ).

]

{ #category : #'property - generated' }
JinListBox >> validationText: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ValidationText' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> value [
<getter>
	^ (handle propertyNamed: #'Value' ).

]

{ #category : #'property - generated' }
JinListBox >> value: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Value' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> verticalAnchor [
<getter>
	^ (handle propertyNamed: #'VerticalAnchor' ).

]

{ #category : #'property - generated' }
JinListBox >> verticalAnchor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'VerticalAnchor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> visible [
<getter>
	^ (handle propertyNamed: #'Visible' ).

]

{ #category : #'property - generated' }
JinListBox >> visible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Visible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinListBox >> width [
<getter>
	^ (handle propertyNamed: #'Width' ).

]

{ #category : #'property - generated' }
JinListBox >> width: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Width' withArguments: {aParam1} ).

]
