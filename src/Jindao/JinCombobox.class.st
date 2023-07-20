"
---
title: ComboBox object (Access)
keywords: vbaac10.chm11545
f1_keywords:
- vbaac10.chm11545
ms.prod: access
api_name:
- Access.ComboBox
ms.assetid: 1cf508d5-023e-eb38-3991-71e82b2a4e7e
ms.date: 02/27/2019
localization_priority: Normal
---


# ComboBox object (Access)

This object corresponds to a combo box control. The combo box control combines the features of a text box and a list box. Use a combo box when you want the option of either typing a value or selecting a value from a predefined list.


## Remarks

|Control|Tool|
|:-----|:-----|
|![Combo box control](../images/t-combox_ZA06053980.gif)|![Combo box tool](../images/a_combobox_ZA06047114.gif)|

In Form view, Microsoft Access doesn't display the list until you click the combo box's arrow.

If you have Control Wizards on before you select the combo box tool, you can create a combo box with a wizard. To turn Control Wizards on or off, click the **Control Wizards** tool in the toolbox.

The setting of the **LimitToList** property determines whether you can enter values that aren't in the list.

The list can be single- or multiple-column, and the columns can appear with or without headings.
    

## Example

The following example shows how to use multiple **ComboBox** controls to supply criteria for a query.

```vb
Private Sub cmdSearch_Click()
    Dim db As Database
    Dim qd As QueryDef
    Dim vWhere As Variant
    
    Set db = CurrentDb()
    
    On Error Resume Next
    db.QueryDefs.Delete ""Query1""
    On Error GoTo 0
    
    vWhere = Null
    vWhere = vWhere & "" AND [PymtTypeID]="" & Me.cboPaymentTypes
    vWhere = vWhere & "" AND [RefundTypeID]="" & Me.cboRefundType
    vWhere = vWhere & "" AND [RefundCDMID]="" & Me.cboRefundCDM
    vWhere = vWhere & "" AND [RefundOptionID]="" & Me.cboRefundOption
    vWhere = vWhere & "" AND [RefundCodeID]="" & Me.cboRefundCode
    
    If Nz(vWhere, """") = """" Then
        MsgBox ""There are no search criteria selected."" & vbCrLf & vbCrLf & _
        ""Search Cancelled."", vbInformation, ""Search Canceled.""
        
    Else
        Set qd = db.CreateQueryDef(""Query1"", ""SELECT * FROM tblRefundData WHERE "" & _
        Mid(vWhere, 6))
        
        db.Close
        Set db = Nothing
        
        DoCmd.OpenQuery ""Query1"", acViewNormal, acReadOnly
    End If
End Sub
```

<br/>

The following example shows how to set the **RowSource** property of a combo box when a form is loaded. When the form is displayed, the items stored in the **Departments** field of the **tblDepartment** combo box are displayed in the **cboDept** combo box.

```vb
Private Sub Form_Load()
    Me.Caption = ""Today is "" & Format$(Date, ""dddd mmm-d-yyyy"")
    Me.RecordSource = ""tblDepartments""
    DoCmd.Maximize  
    txtDept.ControlSource = ""Department""
    cmdClose.Caption = ""&Close""
    cboDept.RowSourceType = ""Table/Query""
    cboDept.RowSource = ""SELECT Department FROM tblDepartments""
End Sub
```

<br/>

The following example shows how to create a combo box that is bound to one column while displaying another. Setting the **ColumnCount** property to 2 specifies that the **cboDept** combo box will display the first two columns of the data source specified by the **RowSource** property. Setting the **BoundColumn** property to 1 specifies that the value stored in the first column will be returned when you inspect the value of the combo box.

The **ColumnWidths** property specifies the width of the two columns. By setting the width of the first column to **0in.**, the first column is not displayed in the combo box.

```vb
Private Sub cboDept_Enter()
    With cboDept
        .RowSource = ""SELECT * FROM tblDepartments ORDER BY Department""
        .ColumnCount = 2
        .BoundColumn = 1
        .ColumnWidths = ""0in.;1in.""
    End With
End Sub
```

<br/>

The following example shows how to add an item to a bound combo box.

```vb
Private Sub cboMainCategory_NotInList(NewData As String, Response As Integer)

    On Error GoTo Error_Handler
    Dim intAnswer As Integer
    intAnswer = MsgBox("""""""" & NewData & """""" is not an approved category. "" & vbcrlf _
        & ""Do you want to add it now?"", vbYesNo + vbQuestion, ""Invalid Category"")

    Select Case intAnswer
        Case vbYes
            DoCmd.SetWarnings False
            DoCmd.RunSQL ""INSERT INTO tlkpCategoryNotInList (Category) "" & _ 
                         ""Select """""" & NewData & """""";""
            DoCmd.SetWarnings True
            Response = acDataErrAdded
        Case vbNo
            MsgBox ""Please select an item from the list."", _
                vbExclamation + vbOKOnly, ""Invalid Entry""
            Response = acDataErrContinue

    End Select

    Exit_Procedure:
        DoCmd.SetWarnings True
        Exit Sub

    Error_Handler:
        MsgBox Err.Number & "", "" & Err.Description
        Resume Exit_Procedure
        Resume

End Sub
```

## Events

- [AfterUpdate](Access.ComboBox.AfterUpdate-event.md)
- [BeforeUpdate](Access.ComboBox.BeforeUpdate-event.md)
- [Change](Access.ComboBox.Change.md)
- [Click](Access.ComboBox.Click.md)
- [DblClick](Access.ComboBox.DblClick.md)
- [Dirty](Access.ComboBox.Dirty.md)
- [Enter](Access.ComboBox.Enter.md)
- [Exit](Access.ComboBox.Exit.md)
- [GotFocus](Access.ComboBox.GotFocus.md)
- [KeyDown](Access.ComboBox.KeyDown.md)
- [KeyPress](Access.ComboBox.KeyPress.md)
- [KeyUp](Access.ComboBox.KeyUp.md)
- [LostFocus](Access.ComboBox.LostFocus.md)
- [MouseDown](Access.ComboBox.MouseDown.md)
- [MouseMove](Access.ComboBox.MouseMove.md)
- [MouseUp](Access.ComboBox.MouseUp.md)
- [NotInList](Access.ComboBox.NotInList.md)
- [Undo](Access.ComboBox.Undo(even).md)

## Methods

- [AddItem](Access.ComboBox.AddItem.md)
- [Dropdown](Access.ComboBox.Dropdown.md)
- [Move](Access.ComboBox.Move.md)
- [RemoveItem](Access.ComboBox.RemoveItem.md)
- [Requery](Access.ComboBox.Requery.md)
- [SetFocus](Access.ComboBox.SetFocus.md)
- [SizeToFit](Access.ComboBox.SizeToFit.md)
- [Undo](Access.ComboBox.Undo(method).md)

## Properties

- [AddColon](Access.ComboBox.AddColon.md)
- [AfterUpdate](Access.ComboBox.AfterUpdate-property.md)
- [AllowAutoCorrect](Access.ComboBox.AllowAutoCorrect.md)
- [AllowValueListEdits](Access.ComboBox.AllowValueListEdits.md)
- [Application](Access.ComboBox.Application.md)
- [AutoExpand](Access.ComboBox.AutoExpand.md)
- [AutoLabel](Access.ComboBox.AutoLabel.md)
- [BackColor](Access.ComboBox.BackColor.md)
- [BackShade](Access.ComboBox.BackShade.md)
- [BackStyle](Access.ComboBox.BackStyle.md)
- [BackThemeColorIndex](Access.ComboBox.BackThemeColorIndex.md)
- [BackTint](Access.ComboBox.BackTint.md)
- [BeforeUpdate](Access.ComboBox.BeforeUpdate-property.md)
- [BorderColor](Access.ComboBox.BorderColor.md)
- [BorderShade](Access.ComboBox.BorderShade.md)
- [BorderStyle](Access.ComboBox.BorderStyle.md)
- [BorderThemeColorIndex](Access.ComboBox.BorderThemeColorIndex.md)
- [BorderTint](Access.ComboBox.BorderTint.md)
- [BorderWidth](Access.ComboBox.BorderWidth.md)
- [BottomMargin](Access.ComboBox.BottomMargin.md)
- [BottomPadding](Access.ComboBox.BottomPadding.md)
- [BoundColumn](Access.ComboBox.BoundColumn.md)
- [CanGrow](Access.ComboBox.CanGrow.md)
- [CanShrink](Access.ComboBox.CanShrink.md)
- [Column](Access.ComboBox.Column.md)
- [ColumnCount](Access.ComboBox.ColumnCount.md)
- [ColumnHeads](Access.ComboBox.ColumnHeads.md)
- [ColumnHidden](Access.ComboBox.ColumnHidden.md)
- [ColumnOrder](Access.ComboBox.ColumnOrder.md)
- [ColumnWidth](Access.ComboBox.ColumnWidth.md)
- [ColumnWidths](Access.ComboBox.ColumnWidths.md)
- [Controls](Access.ComboBox.Controls.md)
- [ControlSource](Access.ComboBox.ControlSource.md)
- [ControlTipText](Access.ComboBox.ControlTipText.md)
- [ControlType](Access.ComboBox.ControlType.md)
- [DecimalPlaces](Access.ComboBox.DecimalPlaces.md)
- [DefaultValue](Access.ComboBox.DefaultValue.md)
- [DisplayAsHyperlink](Access.ComboBox.DisplayAsHyperlink.md)
- [DisplayWhen](Access.ComboBox.DisplayWhen.md)
- [Enabled](Access.ComboBox.Enabled.md)
- [EventProcPrefix](Access.ComboBox.EventProcPrefix.md)
- [FontBold](Access.ComboBox.FontBold.md)
- [FontItalic](Access.ComboBox.FontItalic.md)
- [FontName](Access.ComboBox.FontName.md)
- [FontSize](Access.ComboBox.FontSize.md)
- [FontUnderline](Access.ComboBox.FontUnderline.md)
- [FontWeight](Access.ComboBox.FontWeight.md)
- [ForeColor](Access.ComboBox.ForeColor.md)
- [ForeShade](Access.ComboBox.ForeShade.md)
- [ForeThemeColorIndex](Access.ComboBox.ForeThemeColorIndex.md)
- [ForeTint](Access.ComboBox.ForeTint.md)
- [Format](Access.ComboBox.Format.md)
- [FormatConditions](Access.ComboBox.FormatConditions.md)
- [GridlineColor](Access.ComboBox.GridlineColor.md)
- [GridlineShade](Access.ComboBox.GridlineShade.md)
- [GridlineStyleBottom](Access.ComboBox.GridlineStyleBottom.md)
- [GridlineStyleLeft](Access.ComboBox.GridlineStyleLeft.md)
- [GridlineStyleRight](Access.ComboBox.GridlineStyleRight.md)
- [GridlineStyleTop](Access.ComboBox.GridlineStyleTop.md)
- [GridlineThemeColorIndex](Access.ComboBox.GridlineThemeColorIndex.md)
- [GridlineTint](Access.ComboBox.GridlineTint.md)
- [GridlineWidthBottom](Access.ComboBox.GridlineWidthBottom.md)
- [GridlineWidthLeft](Access.ComboBox.GridlineWidthLeft.md)
- [GridlineWidthRight](Access.ComboBox.GridlineWidthRight.md)
- [GridlineWidthTop](Access.ComboBox.GridlineWidthTop.md)
- [Height](Access.ComboBox.Height.md)
- [HelpContextId](Access.ComboBox.HelpContextId.md)
- [HideDuplicates](Access.ComboBox.HideDuplicates.md)
- [HorizontalAnchor](Access.ComboBox.HorizontalAnchor.md)
- [Hyperlink](Access.ComboBox.Hyperlink.md)
- [IMEHold](Access.ComboBox.IMEHold.md)
- [IMEMode](Access.ComboBox.IMEMode.md)
- [IMESentenceMode](Access.ComboBox.IMESentenceMode.md)
- [InheritValueList](Access.ComboBox.InheritValueList.md)
- [InputMask](Access.ComboBox.InputMask.md)
- [InSelection](Access.ComboBox.InSelection.md)
- [IsHyperlink](Access.ComboBox.IsHyperlink.md)
- [IsVisible](Access.ComboBox.IsVisible.md)
- [ItemData](Access.ComboBox.ItemData.md)
- [ItemsSelected](Access.ComboBox.ItemsSelected.md)
- [KeyboardLanguage](Access.ComboBox.KeyboardLanguage.md)
- [LabelAlign](Access.ComboBox.LabelAlign.md)
- [LabelX](Access.ComboBox.LabelX.md)
- [LabelY](Access.ComboBox.LabelY.md)
- [Layout](Access.ComboBox.Layout.md)
- [LayoutID](Access.ComboBox.LayoutID.md)
- [Left](Access.ComboBox.Left.md)
- [LeftMargin](Access.ComboBox.LeftMargin.md)
- [LeftPadding](Access.ComboBox.LeftPadding.md)
- [LimitToList](Access.ComboBox.LimitToList.md)
- [ListCount](Access.ComboBox.ListCount.md)
- [ListIndex](Access.ComboBox.ListIndex.md)
- [ListItemsEditForm](Access.ComboBox.ListItemsEditForm.md)
- [ListRows](Access.ComboBox.ListRows.md)
- [ListWidth](Access.ComboBox.ListWidth.md)
- [Locked](Access.ComboBox.Locked.md)
- [Name](Access.ComboBox.Name.md)
- [NumeralShapes](Access.ComboBox.NumeralShapes.md)
- [OldBorderStyle](Access.ComboBox.OldBorderStyle.md)
- [OldValue](Access.ComboBox.OldValue.md)
- [OnChange](Access.ComboBox.OnChange.md)
- [OnClick](Access.ComboBox.OnClick.md)
- [OnDblClick](Access.ComboBox.OnDblClick.md)
- [OnDirty](Access.ComboBox.OnDirty.md)
- [OnEnter](Access.ComboBox.OnEnter.md)
- [OnExit](Access.ComboBox.OnExit.md)
- [OnGotFocus](Access.ComboBox.OnGotFocus.md)
- [OnKeyDown](Access.ComboBox.OnKeyDown.md)
- [OnKeyPress](Access.ComboBox.OnKeyPress.md)
- [OnKeyUp](Access.ComboBox.OnKeyUp.md)
- [OnLostFocus](Access.ComboBox.OnLostFocus.md)
- [OnMouseDown](Access.ComboBox.OnMouseDown.md)
- [OnMouseMove](Access.ComboBox.OnMouseMove.md)
- [OnMouseUp](Access.ComboBox.OnMouseUp.md)
- [OnNotInList](Access.ComboBox.OnNotInList.md)
- [OnUndo](Access.ComboBox.OnUndo.md)
- [Parent](Access.ComboBox.Parent.md)
- [Properties](Access.ComboBox.Properties.md)
- [ReadingOrder](Access.ComboBox.ReadingOrder.md)
- [Recordset](Access.ComboBox.Recordset.md)
- [RightMargin](Access.ComboBox.RightMargin.md)
- [RightPadding](Access.ComboBox.RightPadding.md)
- [RowSource](Access.ComboBox.RowSource.md)
- [RowSourceType](Access.ComboBox.RowSourceType.md)
- [ScrollBarAlign](Access.ComboBox.ScrollBarAlign.md)
- [Section](Access.ComboBox.Section.md)
- [Selected](Access.ComboBox.Selected.md)
- [SelLength](Access.ComboBox.SelLength.md)
- [SelStart](Access.ComboBox.SelStart.md)
- [SelText](Access.ComboBox.SelText.md)
- [SeparatorCharacters](Access.ComboBox.SeparatorCharacters.md)
- [ShortcutMenuBar](Access.ComboBox.ShortcutMenuBar.md)
- [ShowOnlyRowSourceValues](Access.ComboBox.ShowOnlyRowSourceValues.md)
- [SmartTags](Access.ComboBox.SmartTags.md)
- [SpecialEffect](Access.ComboBox.SpecialEffect.md)
- [StatusBarText](Access.ComboBox.StatusBarText.md)
- [TabIndex](Access.ComboBox.TabIndex.md)
- [TabStop](Access.ComboBox.TabStop.md)
- [Tag](Access.ComboBox.Tag.md)
- [Text](Access.ComboBox.Text.md)
- [TextAlign](Access.ComboBox.TextAlign.md)
- [ThemeFontIndex](Access.ComboBox.ThemeFontIndex.md)
- [Top](Access.ComboBox.Top.md)
- [TopMargin](Access.ComboBox.TopMargin.md)
- [TopPadding](Access.ComboBox.TopPadding.md)
- [ValidationRule](Access.ComboBox.ValidationRule.md)
- [ValidationText](Access.ComboBox.ValidationText.md)
- [Value](Access.ComboBox.Value.md)
- [VerticalAnchor](Access.ComboBox.VerticalAnchor.md)
- [Visible](Access.ComboBox.Visible.md)
- [Width](Access.ComboBox.Width.md)




## See also

- [Access Object Model Reference](overview/Access/object-model.md)


[!include[Support and feedback](~/includes/feedback-boilerplate.md)]

"
Class {
	#name : #JinCombobox,
	#superclass : #JinControlAbstractCombobox,
	#category : #'Jindao-FormControls-Builtin'
}

{ #category : #generated }
JinCombobox class >> componentKnownProperties [
	^ #(
    AddColon
    AfterUpdate
    AllowAutoCorrect
    AllowValueListEdits
    AutoExpand
    AutoLabel
    BackColor
    BackShade
    BackStyle
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
    BottomMargin
    BottomPadding
    BoundColumn
    CanGrow
    CanShrink
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
    DecimalPlaces
    DefaultValue
    DisplayAsHyperlink
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
    Format
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
    InputMask
    InSelection
    IsHyperlink
    IsVisible
    ItemData
    ItemsSelected
    KeyboardLanguage
    LabelAlign
    LabelX
    LabelY
    Left
    LeftMargin
    LeftPadding
    LimitToList
    ListCount
    ListIndex
    ListItemsEditForm
    ListRows
    ListWidth
    Locked
    Name
    NumeralShapes
    OldBorderStyle
    OldValue
    OnChange
    OnClick
    OnDblClick
    OnDirty
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
    OnNotInList
    OnUndo
'OnChangeMacro' 'OnClickMacro' 'OnDblClickMacro' 'OnEnterMacro' 'OnExitMacro' 'OnGotFocusMacro' 'OnKeyDownMacro' 'OnKeyPressMacro' 'OnKeyUpMacro' 'OnLostFocusMacro' 'OnMouseDownMacro' 'OnMouseMoveMacro' 'OnMouseUpMacro' 'OnNotInListMacro'     ReadingOrder
    Recordset
    RightMargin
    RightPadding
    RowSource
    RowSourceType
    ScrollBarAlign
    Section
    Selected
    SelLength
    SelStart
    SelText
    SeparatorCharacters
    ShortcutMenuBar
    ShowOnlyRowSourceValues
    SmartTags
    SpecialEffect
    StatusBarText
    TabIndex
    TabStop
    Tag
    Text
    TextAlign
    ThemeFontIndex
    Top
    TopMargin
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
JinCombobox class >> mappedTypeName [
	^#'_Combobox'
]

{ #category : #generated }
JinCombobox >> acceptVisitor: aVisitor [

	<doc: 'Accepts visitor'>
	^ aVisitor visitCombobox: self
]

{ #category : #'property - generated' }
JinCombobox >> addColon [
<getter>
	^ (handle propertyNamed: #'AddColon' ).

]

{ #category : #'property - generated' }
JinCombobox >> addColon: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AddColon' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinCombobox >> addItem: aItem index: aIndex [
<method>
"This method can be called with optional parameters. Index"
	^ (handle dispatch: #'AddItem' withArguments: {aItem . aIndex} ).

]

{ #category : #'property - generated' }
JinCombobox >> allowAutoCorrect [
<getter>
	^ (handle propertyNamed: #'AllowAutoCorrect' ).

]

{ #category : #'property - generated' }
JinCombobox >> allowAutoCorrect: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AllowAutoCorrect' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> allowValueListEdits [
<getter>
	^ (handle propertyNamed: #'AllowValueListEdits' ).

]

{ #category : #'property - generated' }
JinCombobox >> allowValueListEdits: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AllowValueListEdits' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> application [
<getter>
	^ (handle propertyNamed: #'Application' ).

]

{ #category : #'property - generated' }
JinCombobox >> autoExpand [
<getter>
	^ (handle propertyNamed: #'AutoExpand' ).

]

{ #category : #'property - generated' }
JinCombobox >> autoExpand: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AutoExpand' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> autoLabel [
<getter>
	^ (handle propertyNamed: #'AutoLabel' ).

]

{ #category : #'property - generated' }
JinCombobox >> autoLabel: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AutoLabel' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> backColor [
<getter>
	^ (handle propertyNamed: #'BackColor' ).

]

{ #category : #'property - generated' }
JinCombobox >> backColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> backShade [
<getter>
	^ (handle propertyNamed: #'BackShade' ).

]

{ #category : #'property - generated' }
JinCombobox >> backShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> backStyle [
<getter>
	^ (handle propertyNamed: #'BackStyle' ).

]

{ #category : #'property - generated' }
JinCombobox >> backStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> backThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'BackThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinCombobox >> backThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> backTint [
<getter>
	^ (handle propertyNamed: #'BackTint' ).

]

{ #category : #'property - generated' }
JinCombobox >> backTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BackTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> borderColor [
<getter>
	^ (handle propertyNamed: #'BorderColor' ).

]

{ #category : #'property - generated' }
JinCombobox >> borderColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> borderShade [
<getter>
	^ (handle propertyNamed: #'BorderShade' ).

]

{ #category : #'property - generated' }
JinCombobox >> borderShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> borderStyle [
<getter>
	^ (handle propertyNamed: #'BorderStyle' ).

]

{ #category : #'property - generated' }
JinCombobox >> borderStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> borderThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'BorderThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinCombobox >> borderThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> borderTint [
<getter>
	^ (handle propertyNamed: #'BorderTint' ).

]

{ #category : #'property - generated' }
JinCombobox >> borderTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> borderWidth [
<getter>
	^ (handle propertyNamed: #'BorderWidth' ).

]

{ #category : #'property - generated' }
JinCombobox >> borderWidth: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderWidth' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> bottomMargin [
<getter>
	^ (handle propertyNamed: #'BottomMargin' ).

]

{ #category : #'property - generated' }
JinCombobox >> bottomMargin: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BottomMargin' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> bottomPadding [
<getter>
	^ (handle propertyNamed: #'BottomPadding' ).

]

{ #category : #'property - generated' }
JinCombobox >> bottomPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BottomPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> boundColumn [
<getter>
	^ (handle propertyNamed: #'BoundColumn' ).

]

{ #category : #'property - generated' }
JinCombobox >> boundColumn: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BoundColumn' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> canGrow [
<getter>
	^ (handle propertyNamed: #'CanGrow' ).

]

{ #category : #'property - generated' }
JinCombobox >> canGrow: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'CanGrow' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> canShrink [
<getter>
	^ (handle propertyNamed: #'CanShrink' ).

]

{ #category : #'property - generated' }
JinCombobox >> canShrink: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'CanShrink' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> column: aIndex row: aRow [
<getter>
"This method can be called with optional parameters. Row"
	^ (handle propertyNamed: #'Column' withArguments: {aIndex . aRow} ).

]

{ #category : #'property - generated' }
JinCombobox >> columnCount [
<getter>
	^ (handle propertyNamed: #'ColumnCount' ).

]

{ #category : #'property - generated' }
JinCombobox >> columnCount: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ColumnCount' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> columnHeads [
<getter>
	^ (handle propertyNamed: #'ColumnHeads' ).

]

{ #category : #'property - generated' }
JinCombobox >> columnHeads: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ColumnHeads' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> columnHidden [
<getter>
	^ (handle propertyNamed: #'ColumnHidden' ).

]

{ #category : #'property - generated' }
JinCombobox >> columnHidden: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ColumnHidden' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> columnOrder [
<getter>
	^ (handle propertyNamed: #'ColumnOrder' ).

]

{ #category : #'property - generated' }
JinCombobox >> columnOrder: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ColumnOrder' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> columnWidth [
<getter>
	^ (handle propertyNamed: #'ColumnWidth' ).

]

{ #category : #'property - generated' }
JinCombobox >> columnWidth: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ColumnWidth' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> columnWidths [
<getter>
	^ (handle propertyNamed: #'ColumnWidths' ).

]

{ #category : #'property - generated' }
JinCombobox >> columnWidths: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ColumnWidths' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> controlSource [
<getter>
	^ (handle propertyNamed: #'ControlSource' ).

]

{ #category : #'property - generated' }
JinCombobox >> controlSource: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlSource' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> controlTipText [
<getter>
	^ (handle propertyNamed: #'ControlTipText' ).

]

{ #category : #'property - generated' }
JinCombobox >> controlTipText: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlTipText' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> controlType [
<getter>
	^ (handle propertyNamed: #'ControlType' ).

]

{ #category : #'property - generated' }
JinCombobox >> controlType: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlType' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> controls [
<getter>
	^ (handle propertyNamed: #'Controls' ).

]

{ #category : #'property - generated' }
JinCombobox >> decimalPlaces [
<getter>
	^ (handle propertyNamed: #'DecimalPlaces' ).

]

{ #category : #'property - generated' }
JinCombobox >> decimalPlaces: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DecimalPlaces' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> defaultValue [
<getter>
	^ (handle propertyNamed: #'DefaultValue' ).

]

{ #category : #'property - generated' }
JinCombobox >> defaultValue: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DefaultValue' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> displayAsHyperlink [
<getter>
	^ (handle propertyNamed: #'DisplayAsHyperlink' ).

]

{ #category : #'property - generated' }
JinCombobox >> displayAsHyperlink: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DisplayAsHyperlink' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> displayWhen [
<getter>
	^ (handle propertyNamed: #'DisplayWhen' ).

]

{ #category : #'property - generated' }
JinCombobox >> displayWhen: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'DisplayWhen' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinCombobox >> dropdown [
<method>
	^ (handle dispatch: #'Dropdown' ).

]

{ #category : #'property - generated' }
JinCombobox >> enabled [
<getter>
	^ (handle propertyNamed: #'Enabled' ).

]

{ #category : #'property - generated' }
JinCombobox >> enabled: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Enabled' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> eventProcPrefix [
<getter>
	^ (handle propertyNamed: #'EventProcPrefix' ).

]

{ #category : #'property - generated' }
JinCombobox >> eventProcPrefix: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'EventProcPrefix' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> fontBold [
<getter>
	^ (handle propertyNamed: #'FontBold' ).

]

{ #category : #'property - generated' }
JinCombobox >> fontBold: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontBold' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> fontItalic [
<getter>
	^ (handle propertyNamed: #'FontItalic' ).

]

{ #category : #'property - generated' }
JinCombobox >> fontItalic: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontItalic' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> fontName [
<getter>
	^ (handle propertyNamed: #'FontName' ).

]

{ #category : #'property - generated' }
JinCombobox >> fontName: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontName' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> fontSize [
<getter>
	^ (handle propertyNamed: #'FontSize' ).

]

{ #category : #'property - generated' }
JinCombobox >> fontSize: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontSize' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> fontUnderline [
<getter>
	^ (handle propertyNamed: #'FontUnderline' ).

]

{ #category : #'property - generated' }
JinCombobox >> fontUnderline: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontUnderline' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> fontWeight [
<getter>
	^ (handle propertyNamed: #'FontWeight' ).

]

{ #category : #'property - generated' }
JinCombobox >> fontWeight: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FontWeight' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> foreColor [
<getter>
	^ (handle propertyNamed: #'ForeColor' ).

]

{ #category : #'property - generated' }
JinCombobox >> foreColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ForeColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> foreShade [
<getter>
	^ (handle propertyNamed: #'ForeShade' ).

]

{ #category : #'property - generated' }
JinCombobox >> foreShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ForeShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> foreThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'ForeThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinCombobox >> foreThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ForeThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> foreTint [
<getter>
	^ (handle propertyNamed: #'ForeTint' ).

]

{ #category : #'property - generated' }
JinCombobox >> foreTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ForeTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> format [
<getter>
	^ (handle propertyNamed: #'Format' ).

]

{ #category : #'property - generated' }
JinCombobox >> format: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Format' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> formatConditions [
<getter>
	^ (handle propertyNamed: #'FormatConditions' ).

]

{ #category : #'property - generated' }
JinCombobox >> gridlineColor [
<getter>
	^ (handle propertyNamed: #'GridlineColor' ).

]

{ #category : #'property - generated' }
JinCombobox >> gridlineColor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineColor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> gridlineShade [
<getter>
	^ (handle propertyNamed: #'GridlineShade' ).

]

{ #category : #'property - generated' }
JinCombobox >> gridlineShade: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineShade' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> gridlineStyleBottom [
<getter>
	^ (handle propertyNamed: #'GridlineStyleBottom' ).

]

{ #category : #'property - generated' }
JinCombobox >> gridlineStyleBottom: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleBottom' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> gridlineStyleLeft [
<getter>
	^ (handle propertyNamed: #'GridlineStyleLeft' ).

]

{ #category : #'property - generated' }
JinCombobox >> gridlineStyleLeft: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleLeft' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> gridlineStyleRight [
<getter>
	^ (handle propertyNamed: #'GridlineStyleRight' ).

]

{ #category : #'property - generated' }
JinCombobox >> gridlineStyleRight: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleRight' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> gridlineStyleTop [
<getter>
	^ (handle propertyNamed: #'GridlineStyleTop' ).

]

{ #category : #'property - generated' }
JinCombobox >> gridlineStyleTop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineStyleTop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> gridlineThemeColorIndex [
<getter>
	^ (handle propertyNamed: #'GridlineThemeColorIndex' ).

]

{ #category : #'property - generated' }
JinCombobox >> gridlineThemeColorIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineThemeColorIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> gridlineTint [
<getter>
	^ (handle propertyNamed: #'GridlineTint' ).

]

{ #category : #'property - generated' }
JinCombobox >> gridlineTint: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineTint' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> gridlineWidthBottom [
<getter>
	^ (handle propertyNamed: #'GridlineWidthBottom' ).

]

{ #category : #'property - generated' }
JinCombobox >> gridlineWidthBottom: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthBottom' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> gridlineWidthLeft [
<getter>
	^ (handle propertyNamed: #'GridlineWidthLeft' ).

]

{ #category : #'property - generated' }
JinCombobox >> gridlineWidthLeft: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthLeft' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> gridlineWidthRight [
<getter>
	^ (handle propertyNamed: #'GridlineWidthRight' ).

]

{ #category : #'property - generated' }
JinCombobox >> gridlineWidthRight: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthRight' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> gridlineWidthTop [
<getter>
	^ (handle propertyNamed: #'GridlineWidthTop' ).

]

{ #category : #'property - generated' }
JinCombobox >> gridlineWidthTop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'GridlineWidthTop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> height [
<getter>
	^ (handle propertyNamed: #'Height' ).

]

{ #category : #'property - generated' }
JinCombobox >> height: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Height' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> helpContextId [
<getter>
	^ (handle propertyNamed: #'HelpContextId' ).

]

{ #category : #'property - generated' }
JinCombobox >> helpContextId: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HelpContextId' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> hideDuplicates [
<getter>
	^ (handle propertyNamed: #'HideDuplicates' ).

]

{ #category : #'property - generated' }
JinCombobox >> hideDuplicates: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HideDuplicates' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> horizontalAnchor [
<getter>
	^ (handle propertyNamed: #'HorizontalAnchor' ).

]

{ #category : #'property - generated' }
JinCombobox >> horizontalAnchor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HorizontalAnchor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> hyperlink [
<getter>
	^ (handle propertyNamed: #'Hyperlink' ).

]

{ #category : #'property - generated' }
JinCombobox >> iMEHold [
<getter>
	^ (handle propertyNamed: #'IMEHold' ).

]

{ #category : #'property - generated' }
JinCombobox >> iMEHold: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IMEHold' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> iMEMode [
<getter>
	^ (handle propertyNamed: #'IMEMode' ).

]

{ #category : #'property - generated' }
JinCombobox >> iMEMode: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IMEMode' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> iMESentenceMode [
<getter>
	^ (handle propertyNamed: #'IMESentenceMode' ).

]

{ #category : #'property - generated' }
JinCombobox >> iMESentenceMode: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IMESentenceMode' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> inSelection [
<getter>
	^ (handle propertyNamed: #'InSelection' ).

]

{ #category : #'property - generated' }
JinCombobox >> inSelection: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'InSelection' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> inheritValueList [
<getter>
	^ (handle propertyNamed: #'InheritValueList' ).

]

{ #category : #'property - generated' }
JinCombobox >> inheritValueList: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'InheritValueList' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> inputMask [
<getter>
	^ (handle propertyNamed: #'InputMask' ).

]

{ #category : #'property - generated' }
JinCombobox >> inputMask: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'InputMask' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> isHyperlink [
<getter>
	^ (handle propertyNamed: #'IsHyperlink' ).

]

{ #category : #'property - generated' }
JinCombobox >> isHyperlink: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IsHyperlink' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> isVisible [
<getter>
	^ (handle propertyNamed: #'IsVisible' ).

]

{ #category : #'property - generated' }
JinCombobox >> isVisible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IsVisible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> itemData: aIndex [
<getter>

	^ (handle propertyNamed: #'ItemData' withArguments: {aIndex} ).

]

{ #category : #'property - generated' }
JinCombobox >> itemsSelected [
<getter>
	^ (handle propertyNamed: #'ItemsSelected' ).

]

{ #category : #'property - generated' }
JinCombobox >> keyboardLanguage [
<getter>
	^ (handle propertyNamed: #'KeyboardLanguage' ).

]

{ #category : #'property - generated' }
JinCombobox >> keyboardLanguage: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'KeyboardLanguage' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> labelAlign [
<getter>
	^ (handle propertyNamed: #'LabelAlign' ).

]

{ #category : #'property - generated' }
JinCombobox >> labelAlign: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LabelAlign' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> labelX [
<getter>
	^ (handle propertyNamed: #'LabelX' ).

]

{ #category : #'property - generated' }
JinCombobox >> labelX: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LabelX' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> labelY [
<getter>
	^ (handle propertyNamed: #'LabelY' ).

]

{ #category : #'property - generated' }
JinCombobox >> labelY: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LabelY' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> layout [
<getter>
	^ (handle propertyNamed: #'Layout' ).

]

{ #category : #'property - generated' }
JinCombobox >> layoutID [
<getter>
	^ (handle propertyNamed: #'LayoutID' ).

]

{ #category : #'property - generated' }
JinCombobox >> left [
<getter>
	^ (handle propertyNamed: #'Left' ).

]

{ #category : #'property - generated' }
JinCombobox >> left: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Left' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> leftMargin [
<getter>
	^ (handle propertyNamed: #'LeftMargin' ).

]

{ #category : #'property - generated' }
JinCombobox >> leftMargin: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LeftMargin' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> leftPadding [
<getter>
	^ (handle propertyNamed: #'LeftPadding' ).

]

{ #category : #'property - generated' }
JinCombobox >> leftPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LeftPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> limitToList [
<getter>
	^ (handle propertyNamed: #'LimitToList' ).

]

{ #category : #'property - generated' }
JinCombobox >> limitToList: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'LimitToList' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> listCount [
<getter>
	^ (handle propertyNamed: #'ListCount' ).

]

{ #category : #'property - generated' }
JinCombobox >> listCount: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ListCount' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> listIndex [
<getter>
	^ (handle propertyNamed: #'ListIndex' ).

]

{ #category : #'property - generated' }
JinCombobox >> listIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ListIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> listItemsEditForm [
<getter>
	^ (handle propertyNamed: #'ListItemsEditForm' ).

]

{ #category : #'property - generated' }
JinCombobox >> listItemsEditForm: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ListItemsEditForm' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> listRows [
<getter>
	^ (handle propertyNamed: #'ListRows' ).

]

{ #category : #'property - generated' }
JinCombobox >> listRows: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ListRows' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> listWidth [
<getter>
	^ (handle propertyNamed: #'ListWidth' ).

]

{ #category : #'property - generated' }
JinCombobox >> listWidth: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ListWidth' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> locked [
<getter>
	^ (handle propertyNamed: #'Locked' ).

]

{ #category : #'property - generated' }
JinCombobox >> locked: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Locked' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinCombobox >> move: aLeft top: aTop width: aWidth height: aHeight [
<method>
"This method can be called with optional parameters. Top,Width,Height"
	^ (handle dispatch: #'Move' withArguments: {aLeft . aTop . aWidth . aHeight} ).

]

{ #category : #'property - generated' }
JinCombobox >> name: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Name' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> numeralShapes [
<getter>
	^ (handle propertyNamed: #'NumeralShapes' ).

]

{ #category : #'property - generated' }
JinCombobox >> numeralShapes: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'NumeralShapes' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> oldBorderStyle [
<getter>
	^ (handle propertyNamed: #'OldBorderStyle' ).

]

{ #category : #'property - generated' }
JinCombobox >> oldBorderStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OldBorderStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> oldValue [
<getter>
	^ (handle propertyNamed: #'OldValue' ).

]

{ #category : #'property - generated' }
JinCombobox >> onChange [
<getter>
	^ (handle propertyNamed: #'OnChange' ).

]

{ #category : #'property - generated' }
JinCombobox >> onChange: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnChange' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> onClick [
<getter>
	^ (handle propertyNamed: #'OnClick' ).

]

{ #category : #'property - generated' }
JinCombobox >> onClick: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnClick' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> onDblClick [
<getter>
	^ (handle propertyNamed: #'OnDblClick' ).

]

{ #category : #'property - generated' }
JinCombobox >> onDblClick: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnDblClick' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> onDirty [
<getter>
	^ (handle propertyNamed: #'OnDirty' ).

]

{ #category : #'property - generated' }
JinCombobox >> onDirty: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnDirty' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> onEnter [
<getter>
	^ (handle propertyNamed: #'OnEnter' ).

]

{ #category : #'property - generated' }
JinCombobox >> onEnter: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnEnter' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> onExit [
<getter>
	^ (handle propertyNamed: #'OnExit' ).

]

{ #category : #'property - generated' }
JinCombobox >> onExit: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnExit' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> onGotFocus [
<getter>
	^ (handle propertyNamed: #'OnGotFocus' ).

]

{ #category : #'property - generated' }
JinCombobox >> onGotFocus: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnGotFocus' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> onKeyDown [
<getter>
	^ (handle propertyNamed: #'OnKeyDown' ).

]

{ #category : #'property - generated' }
JinCombobox >> onKeyDown: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyDown' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> onKeyPress [
<getter>
	^ (handle propertyNamed: #'OnKeyPress' ).

]

{ #category : #'property - generated' }
JinCombobox >> onKeyPress: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyPress' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> onKeyUp [
<getter>
	^ (handle propertyNamed: #'OnKeyUp' ).

]

{ #category : #'property - generated' }
JinCombobox >> onKeyUp: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyUp' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> onLostFocus [
<getter>
	^ (handle propertyNamed: #'OnLostFocus' ).

]

{ #category : #'property - generated' }
JinCombobox >> onLostFocus: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnLostFocus' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> onMouseDown [
<getter>
	^ (handle propertyNamed: #'OnMouseDown' ).

]

{ #category : #'property - generated' }
JinCombobox >> onMouseDown: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseDown' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> onMouseMove [
<getter>
	^ (handle propertyNamed: #'OnMouseMove' ).

]

{ #category : #'property - generated' }
JinCombobox >> onMouseMove: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseMove' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> onMouseUp [
<getter>
	^ (handle propertyNamed: #'OnMouseUp' ).

]

{ #category : #'property - generated' }
JinCombobox >> onMouseUp: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseUp' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> onNotInList [
<getter>
	^ (handle propertyNamed: #'OnNotInList' ).

]

{ #category : #'property - generated' }
JinCombobox >> onNotInList: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnNotInList' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> onUndo [
<getter>
	^ (handle propertyNamed: #'OnUndo' ).

]

{ #category : #'property - generated' }
JinCombobox >> onUndo: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnUndo' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> readingOrder [
<getter>
	^ (handle propertyNamed: #'ReadingOrder' ).

]

{ #category : #'property - generated' }
JinCombobox >> readingOrder: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ReadingOrder' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> recordset [
<getter>
	^ (handle propertyNamed: #'Recordset' ).

]

{ #category : #'method - generated' }
JinCombobox >> recordset: aParam1 [
<method>

	^ (handle dispatch: #'Recordset' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinCombobox >> removeItem: aIndex [
<method>

	^ (handle dispatch: #'RemoveItem' withArguments: {aIndex} ).

]

{ #category : #'method - generated' }
JinCombobox >> requery [
<method>
	^ (handle dispatch: #'Requery' ).

]

{ #category : #'property - generated' }
JinCombobox >> rightMargin [
<getter>
	^ (handle propertyNamed: #'RightMargin' ).

]

{ #category : #'property - generated' }
JinCombobox >> rightMargin: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'RightMargin' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> rightPadding [
<getter>
	^ (handle propertyNamed: #'RightPadding' ).

]

{ #category : #'property - generated' }
JinCombobox >> rightPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'RightPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> rowSource [
<getter>
	^ (handle propertyNamed: #'RowSource' ).

]

{ #category : #'property - generated' }
JinCombobox >> rowSource: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'RowSource' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> rowSourceType [
<getter>
	^ (handle propertyNamed: #'RowSourceType' ).

]

{ #category : #'property - generated' }
JinCombobox >> rowSourceType: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'RowSourceType' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> scrollBarAlign [
<getter>
	^ (handle propertyNamed: #'ScrollBarAlign' ).

]

{ #category : #'property - generated' }
JinCombobox >> scrollBarAlign: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ScrollBarAlign' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> section [
<getter>
	^ (handle propertyNamed: #'Section' ).

]

{ #category : #'property - generated' }
JinCombobox >> section: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Section' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> selLength [
<getter>
	^ (handle propertyNamed: #'SelLength' ).

]

{ #category : #'property - generated' }
JinCombobox >> selLength: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'SelLength' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> selStart [
<getter>
	^ (handle propertyNamed: #'SelStart' ).

]

{ #category : #'property - generated' }
JinCombobox >> selStart: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'SelStart' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> selText [
<getter>
	^ (handle propertyNamed: #'SelText' ).

]

{ #category : #'property - generated' }
JinCombobox >> selText: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'SelText' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> selected: aLRow [
<getter>

	^ (handle propertyNamed: #'Selected' withArguments: {aLRow} ).

]

{ #category : #'property - generated' }
JinCombobox >> selected: aLRow aParam1: aParam1 [
<setter>
	
	^ (handle propertyNamed: #'Selected' withArguments: {aLRow . aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> separatorCharacters [
<getter>
	^ (handle propertyNamed: #'SeparatorCharacters' ).

]

{ #category : #'property - generated' }
JinCombobox >> separatorCharacters: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'SeparatorCharacters' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinCombobox >> setFocus [
<method>
	^ (handle dispatch: #'SetFocus' ).

]

{ #category : #'property - generated' }
JinCombobox >> shortcutMenuBar [
<getter>
	^ (handle propertyNamed: #'ShortcutMenuBar' ).

]

{ #category : #'property - generated' }
JinCombobox >> shortcutMenuBar: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ShortcutMenuBar' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> showOnlyRowSourceValues [
<getter>
	^ (handle propertyNamed: #'ShowOnlyRowSourceValues' ).

]

{ #category : #'property - generated' }
JinCombobox >> showOnlyRowSourceValues: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ShowOnlyRowSourceValues' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinCombobox >> sizeToFit [
<method>
	^ (handle dispatch: #'SizeToFit' ).

]

{ #category : #'property - generated' }
JinCombobox >> smartTags [
<getter>
	^ (handle propertyNamed: #'SmartTags' ).

]

{ #category : #'property - generated' }
JinCombobox >> specialEffect [
<getter>
	^ (handle propertyNamed: #'SpecialEffect' ).

]

{ #category : #'property - generated' }
JinCombobox >> specialEffect: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'SpecialEffect' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> statusBarText [
<getter>
	^ (handle propertyNamed: #'StatusBarText' ).

]

{ #category : #'property - generated' }
JinCombobox >> statusBarText: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'StatusBarText' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> tabIndex [
<getter>
	^ (handle propertyNamed: #'TabIndex' ).

]

{ #category : #'property - generated' }
JinCombobox >> tabIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TabIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> tabStop [
<getter>
	^ (handle propertyNamed: #'TabStop' ).

]

{ #category : #'property - generated' }
JinCombobox >> tabStop: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TabStop' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> tag [
<getter>
	^ (handle propertyNamed: #'Tag' ).

]

{ #category : #'property - generated' }
JinCombobox >> tag: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Tag' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> text [
<getter>
	^ (handle propertyNamed: #'Text' ).

]

{ #category : #'property - generated' }
JinCombobox >> text: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Text' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> textAlign [
<getter>
	^ (handle propertyNamed: #'TextAlign' ).

]

{ #category : #'property - generated' }
JinCombobox >> textAlign: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TextAlign' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> themeFontIndex [
<getter>
	^ (handle propertyNamed: #'ThemeFontIndex' ).

]

{ #category : #'property - generated' }
JinCombobox >> themeFontIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ThemeFontIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> top [
<getter>
	^ (handle propertyNamed: #'Top' ).

]

{ #category : #'property - generated' }
JinCombobox >> top: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Top' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> topMargin [
<getter>
	^ (handle propertyNamed: #'TopMargin' ).

]

{ #category : #'property - generated' }
JinCombobox >> topMargin: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TopMargin' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> topPadding [
<getter>
	^ (handle propertyNamed: #'TopPadding' ).

]

{ #category : #'property - generated' }
JinCombobox >> topPadding: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TopPadding' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> validationRule [
<getter>
	^ (handle propertyNamed: #'ValidationRule' ).

]

{ #category : #'property - generated' }
JinCombobox >> validationRule: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ValidationRule' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> validationText [
<getter>
	^ (handle propertyNamed: #'ValidationText' ).

]

{ #category : #'property - generated' }
JinCombobox >> validationText: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ValidationText' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> value [
	<getter>
	^ handle propertyNamed: #Value
]

{ #category : #'property - generated' }
JinCombobox >> value: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Value' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> verticalAnchor [
<getter>
	^ (handle propertyNamed: #'VerticalAnchor' ).

]

{ #category : #'property - generated' }
JinCombobox >> verticalAnchor: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'VerticalAnchor' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> visible [
<getter>
	^ (handle propertyNamed: #'Visible' ).

]

{ #category : #'property - generated' }
JinCombobox >> visible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Visible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinCombobox >> width [
<getter>
	^ (handle propertyNamed: #'Width' ).

]

{ #category : #'property - generated' }
JinCombobox >> width: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Width' withArguments: {aParam1} ).

]
