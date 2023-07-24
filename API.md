# Jindao - API
## JinAccessApplication
This is the basic access handle manager. 
Application. First instance to access through COM. This application object is bound to a running instance of Access. It exposes an explorable API, and it allows access to the project components, directly or indirectly.


### Properties
handle
name
visible
references

### Methods
#### JinAccessApplication>>addReference: aName builtIn: isBuiltIn path: aFileReference guid: aGuid major: aMajor minor: aMinor
Adds a reference to the module that has been used to open the application. A reference may be an other Microsoft Access module or a DLL

#### JinAccessApplication>>rename: anObject with: aName
Renames a given first class citizen with a given name

#### JinAccessApplication>>save: aJinModelObject
Saves a given object. Form, Report, Module, etc

#### JinAccessApplication>>visible: aBoolean
Turns visible or invisible the instance of Microsoft Access

#### JinAccessApplication>>openForm: aJinForm
[https://learn.microsoft.com/en-us/office/vba/api/access.docmd.openform](https://learn.microsoft.com/en-us/office/vba/api/access.docmd.openform)
	Open a given form in edition mode

#### JinAccessApplication>>activeEntity
Obtains the entity that is been seen by the user. Either a report or a form. It fails if none of those is active. 

#### JinAccessApplication>>compileAll
Runs command acCmdCompileAllModules 	125. This is equivalent to click on the Microsoft Access "Compile All" menu.  It forces the compilation of all the modules

#### JinAccessApplication>>createFormNamed: aString
[https://learn.microsoft.com/en-us/office/vba/api/access.application.createform](https://learn.microsoft.com/en-us/office/vba/api/access.application.createform) 	
Use the CreateForm method when designing a wizard that creates a new form.
The CreateForm method opens a new, minimized form in form Design view.
If the name that you use for the FormTemplate argument isn't valid, Visual Basic uses the form template specified by the Form Template setting on the Forms/Reports tab of the Options dialog box.

#### JinAccessApplication>>open: aFileReference
Opens a given project with Microsoft Access, creates a new project object

#### JinAccessApplication>>refreshDatabaseWindow
[https://learn.microsoft.com/en-us/office/vba/api/access.application.refreshdatabasewindow](https://learn.microsoft.com/en-us/office/vba/api/access.application.refreshdatabasewindow) The RefreshDatabaseWindow method updates the Database window after a database object has been created, deleted, or renamed.

#### JinAccessApplication>>close: aJinModelObject save: aBool
Closes a given first class citizen (Form, Class, etc). It saves or not accordign to the :save: parameter.

#### JinAccessApplication>>activeReport
Obtains the report that is been seen by the user. It fails if there is no report been seen

#### JinAccessApplication>>exportXml: aJinModelObject toFolder: aFileReference
Saves a given first class citizen as XML. It works only with queries and tables

#### JinAccessApplication>>export: aJinModelObject toFolder: aFileReference
Saves a given first class citizen as text. This is a nondocumented feature. We encourage not using it. This command does not work with tables or queries.

#### JinAccessApplication>>activeForm
Obtains the form that is been seen by the user. It fails if there is no form been seen

#### JinAccessApplication>>createForm
[https://learn.microsoft.com/en-us/office/vba/api/access.application.createform](https://learn.microsoft.com/en-us/office/vba/api/access.application.createform) 
	
Use the CreateForm method when designing a wizard that creates a new NAMELESS form.
The CreateForm method opens a new, minimized form in form Design view.
If the name that you use for the FormTemplate argument isn't valid, Visual Basic uses the form template specified by the Form Template setting on the Forms/Reports tab of the Options dialog box.

#### JinAccessApplication>>vbeProjectFor: aJinAccessProject
Obtains the VB Project related to a given Access Module(project)

#### JinAccessApplication>>closeProject: aProject
Closes the currently opened project.

#### JinAccessApplication>>open: aFileReference into: aProject
Opens a given project with Microsoft Access, using a given project object

#### JinAccessApplication>>ensureNonOtherFormtIsOpen
Closes any active form

#### JinAccessApplication>>command: aString withArguments: aCollection
DoCmd. (Do Command) is an object that reifies most of the available operations to apply on the application. It must be used for opening a project, databases and others. Most of the objects below have this object as a dependency.

#### JinAccessApplication>>vbeProjects
Use the VBProjects collection to access the collection of projects (Access modules) of the related VBEnvironment. The VBE property of the Application object represents the Microsoft Visual Basic for Applications editor. 

#### JinAccessApplication>>quit
Quits the instance of Microsoft Access

#### JinAccessApplication>>close: aJinModelObject
Closes a given first class citizen (Form, Class, etc) without saving, therfore losing all modification

#### JinAccessApplication>>reopen: aFileReference into: aProject
Tries to close the opened project and application, to open it again. 



## JinAccessProject
I represent a access project. I am instantiated by the access application object. 
I am a first access to collections of defined elements 

### Properties
programHandle
dataHandle
application
projectPath
forms
modules
macros
tables
reports
relations
queries

### Methods
#### JinAccessProject>>closeAndQuit
Closes this project, then closes the Microsoft Access running instance.

#### JinAccessProject>>close
Closes this project.



## JinQuery
I represent a query 

### Methods
#### JinQuery>>exportToFolder: aFolder
export as text into a given folder 

#### JinQuery>>fields
Returns the fields of the Query

#### JinQuery>>sql
Returns the SQL used to build the Query



## JinTable
dbAttachedODBC	536870912	Linked ODBC database table.
dbAttachedTable	1073741824	Linked non-ODBC database table.
dbAttachExclusive	65536	Opens a linked Microsoft Access database engine table for exclusive use.
dbAttachSavePWD	131072	Saves user ID and password for linked remote table.
dbHiddenObject	1	Hidden table (for temporary use).
dbSystemObject	-2147483646	System table.


### Methods
#### JinTable>>isRemote
Returns if the table stored in a remote database 

#### JinTable>>isAttachedAndSavesPassword
Returns if the table is or not dbAttachSavePWD	131072	Saves user ID and password for linked remote table.

#### JinTable>>isAttachedNonODBC
Returns if the table is or not dbAttachedTable	1073741824	Linked non-ODBC database table

#### JinTable>>isAttachedODBC
Returns if the table is or not dbAttachedODBC	536870912	 Linked ODBC database table. 

#### JinTable>>indexes
Returns all the indexes defined in the table

#### JinTable>>recordset
Returns a Recordset accessing all the data of this table. Must connect before usign. 

#### JinTable>>relations
Returns all the relations (FK) with other tables 

#### JinTable>>fields
Returns the fields of the table 

#### JinTable>>connect
Connects to the table. Required to open a recordset.

#### JinTable>>createIndex: aString
Creates an index over this table named as given by the parameter. 

#### JinTable>>attributes
Returns the attributes of the table 

#### JinTable>>isAttachedExclusively
Returns if the table is or not dbAttachExclusive	65536	Opens a linked Microsoft Access database engine table for exclusive use.

#### JinTable>>isLocal
Returns if the table stored in the database where we got the object from

#### JinTable>>isHidden
Returns if the table is or not visible 



## JinForm
I am a form. 

### Properties
description
body
project
vbeComponent
src
documentedProperties

### Methods
#### JinForm>>formType
Returns the type #(SingleForm ContinuousForm Datasheet PivotTable PivotChart SplitForm) 

#### JinForm>>allowEdits
 Responds if the form allows to modify information from a bound table

#### JinForm>>installHeaderFooter
Installs a header and footer on this form

#### JinForm>>installPageHeaderFooter
Installs a PAGE header and footer on this form

#### JinForm>>createControl: aName type: aTypeNumber section: aSection parent: aParentName
[https://learn.microsoft.com/en-us/office/vba/api/access.application.createcontrol](https://learn.microsoft.com/en-us/office/vba/api/access.application.createcontrol) Creates a control inside the form with a specific parent. 

#### JinForm>>ast
Returns a VBParser AST of the module, if it has one.

#### JinForm>>allowFilters
 Responds if the form allows to filter information from a bound table

#### JinForm>>width
Gets the width of the widget. 

#### JinForm>>allowAdditions
 Responds if the form allows to add information into a bound table

#### JinForm>>allowDeletions
 Responds if the form allows to delete information from a bound table

#### JinForm>>width: anInteger
Sets the width of the widget. 

#### JinForm>>code
Returns source of the module, if it has one.

#### JinForm>>createControl: aName type: aTypeNumber section: aSection
[https://learn.microsoft.com/en-us/office/vba/api/access.application.createcontrol](https://learn.microsoft.com/en-us/office/vba/api/access.application.createcontrol) Creates a control inside the form. 

#### JinForm>>controls
Returns all the controls defined in the form



## JinAttachment
---
title: Attachment object (Access)
keywords: vbaac10.chm14036
f1_keywords:
- vbaac10.chm14036
ms.prod: access
api_name:
- Access.Attachment
ms.assetid: b0756145-9012-f9b9-7df9-e168defed3bf
ms.date: 02/07/2019
localization_priority: Normal
---

# Attachment object (Access)
This object corresponds to an attachment control. Use an attachment control when you want to manipulate the contents fields of the attachment data type.

## Remarks
> [!NOTE] 
> You can attach files only to databases that you create in Office Access 2007 and later and that use the new .accdb file format. You cannot share attachments between an Office Access 2007 (.accdb) database and a database in the earlier (.mdb) file format.
You can attach a maximum of two gigabytes of data (the maximum size for an Access database). Individual files cannot exceed 256 megabytes in size.

### Supported image file formats
Office Access 2007 and later support the following graphic file formats natively, meaning the attachment control renders them without the need for additional software.
- BMP (Windows Bitmap)   
- RLE (Run Length Encoded Bitmap)   
- DIB (Device Independent Bitmap)    
- GIF (Graphics Interchange Format)    
- JPEG, JPG, JPE (Joint Photographic Experts Group)    
- EXIF (Exchangeable File Format)    
- PNG (Portable Network Graphics)    
- TIFF, TIF (Tagged Image File Format)    
- ICON, ICO (Icon)    
- WMF (Windows Metafile)    
- EMF (Enhanced Metafile)
    
### Supported formats for documents and other files
As a rule, you can attach any file that was created with one of the 2007 Microsoft Office or later system programs. You can also attach log files (.log), text files (.text, .txt), and compressed .zip files.

### File-naming conventions
The names of your attached files can contain any Unicode character supported by the NTFS file system used in Microsoft Windows NT (NTFS). In addition, file names must conform to these guidelines:
- Names must not exceed 255 characters, including the file name extensions.
    
- Names cannot contain the following characters: question marks (?), quotation marks ("), forward or backward slashes (/ \\), opening or closing brackets (< >), asterisks (*), vertical bars or pipes ( | ), colons ( : ), or paragraph marks.
    
### Types of files that Access compresses
Access will compress your attached files unless those files are compressed natively. For example, JPEG files are compressed by the graphics program that created them, so Access does not compress them. The following table lists some supported file types and whether or not Access compresses them.
|File extension|Compressed?|Reason|
|:-----|:-----|:-----|
|.jpg, .jpeg|No|Already compressed|
|.gif|No|Already compressed|
|.png|No|Already compressed|
|.tif, .tiff|Yes||
|.exif|Yes||
| .bmp|Yes||
|.emf|Yes||
|.wmf|Yes||
|.ico|Yes||
|.zip|No|Already compressed|
|.cab|No|Already compressed|
|.docx|No|Already compressed|
|.xlsx|No|Already compressed|
|.xlsb|No|Already compressed|
|.pptx|No|Already compressed|
### Blocked file formats
Office Access 2007 blocks the following types of attached files. At this time, you cannot unblock any of the file types listed here.
|||||
|:-----|:-----|:-----|:-----|
|.ade|.ins|.mda|.scr|
|.adp|.isp|.mdb|.sct|
|.app|.its|.mde|.shb|
|.asp|.js |.mdt|.shs|
|.bas|.jse|.mdw|.tmp|
|.bat|.ksh|.mdz|.url|
|.cer|.lnk|.msc|.vb|
|.chm|.mad|.msi|.vbe|
|.cmd|.maf|.msp|.vbs|
|.com|.mag|.mst|.vsmacros|
|.cpl|.mam|.ops|.vss|
|.crt|.maq|.pcd|.vst|
|.csh|.mar|.pif|.vsw|
|.exe|.mas|.prf|.ws|
|.fxp|.mat|.prg|.wsc|
|.hlp|.mau|.pst|.wsf|
|.hta|.mav|.reg|.wsh|
|.inf|.maw|.scf||


### Methods
#### JinAttachment>>acceptVisitor: aVisitor
Accepts visitor



## JinCheckbox
---
title: CheckBox object (Access)
keywords: vbaac10.chm10798
f1_keywords:
- vbaac10.chm10798
ms.prod: access
api_name:
- Access.CheckBox
ms.assetid: 63e75704-af4d-7b38-7b8b-04f7f17fa1ec
ms.date: 02/22/2019
localization_priority: Normal
---

# CheckBox object (Access)
This object corresponds to a check box on a form or report. This check box is a stand-alone control that displays a Yes/No value from an underlying record source.
## Remarks
|Control|Tool|
|:------|:---|
|![Check box](../images/t-chkbox_ZA06053977.gif)|![Check box](../images/chkbox_ZA06047229.gif)|
When you select or clear a check box that's bound to a Yes/No field, Microsoft Access displays the value in the underlying table according to the field's **Format** property (Yes/No, **True**/**False**, or On/Off).
You can also use check boxes in an option group to display values to choose from.


### Methods
#### JinCheckbox>>acceptVisitor: aVisitor
Accepts visitor



## JinCombobox
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
    db.QueryDefs.Delete "Query1"
    On Error GoTo 0
    
    vWhere = Null
    vWhere = vWhere & " AND [PymtTypeID]=" & Me.cboPaymentTypes
    vWhere = vWhere & " AND [RefundTypeID]=" & Me.cboRefundType
    vWhere = vWhere & " AND [RefundCDMID]=" & Me.cboRefundCDM
    vWhere = vWhere & " AND [RefundOptionID]=" & Me.cboRefundOption
    vWhere = vWhere & " AND [RefundCodeID]=" & Me.cboRefundCode
    
    If Nz(vWhere, "") = "" Then
        MsgBox "There are no search criteria selected." & vbCrLf & vbCrLf & _
        "Search Cancelled.", vbInformation, "Search Canceled."
        
    Else
        Set qd = db.CreateQueryDef("Query1", "SELECT * FROM tblRefundData WHERE " & _
        Mid(vWhere, 6))
        
        db.Close
        Set db = Nothing
        
        DoCmd.OpenQuery "Query1", acViewNormal, acReadOnly
    End If
End Sub
```
<br/>
The following example shows how to set the **RowSource** property of a combo box when a form is loaded. When the form is displayed, the items stored in the **Departments** field of the **tblDepartment** combo box are displayed in the **cboDept** combo box.
```vb
Private Sub Form_Load()
    Me.Caption = "Today is " & Format$(Date, "dddd mmm-d-yyyy")
    Me.RecordSource = "tblDepartments"
    DoCmd.Maximize  
    txtDept.ControlSource = "Department"
    cmdClose.Caption = "&Close"
    cboDept.RowSourceType = "Table/Query"
    cboDept.RowSource = "SELECT Department FROM tblDepartments"
End Sub
```
<br/>
The following example shows how to create a combo box that is bound to one column while displaying another. Setting the **ColumnCount** property to 2 specifies that the **cboDept** combo box will display the first two columns of the data source specified by the **RowSource** property. Setting the **BoundColumn** property to 1 specifies that the value stored in the first column will be returned when you inspect the value of the combo box.
The **ColumnWidths** property specifies the width of the two columns. By setting the width of the first column to **0in.**, the first column is not displayed in the combo box.
```vb
Private Sub cboDept_Enter()
    With cboDept
        .RowSource = "SELECT * FROM tblDepartments ORDER BY Department"
        .ColumnCount = 2
        .BoundColumn = 1
        .ColumnWidths = "0in.;1in."
    End With
End Sub
```
<br/>
The following example shows how to add an item to a bound combo box.
```vb
Private Sub cboMainCategory_NotInList(NewData As String, Response As Integer)
    On Error GoTo Error_Handler
    Dim intAnswer As Integer
    intAnswer = MsgBox("""" & NewData & """ is not an approved category. " & vbcrlf _
        & "Do you want to add it now?", vbYesNo + vbQuestion, "Invalid Category")
    Select Case intAnswer
        Case vbYes
            DoCmd.SetWarnings False
            DoCmd.RunSQL "INSERT INTO tlkpCategoryNotInList (Category) " & _ 
                         "Select """ & NewData & """;"
            DoCmd.SetWarnings True
            Response = acDataErrAdded
        Case vbNo
            MsgBox "Please select an item from the list.", _
                vbExclamation + vbOKOnly, "Invalid Entry"
            Response = acDataErrContinue
    End Select
    Exit_Procedure:
        DoCmd.SetWarnings True
        Exit Sub
    Error_Handler:
        MsgBox Err.Number & ", " & Err.Description
        Resume Exit_Procedure
        Resume
End Sub
```


### Methods
#### JinCombobox>>acceptVisitor: aVisitor
Accepts visitor



## JinCommandButton
---
title: CommandButton object (Access)
keywords: vbaac10.chm10554
f1_keywords:
- vbaac10.chm10554
ms.prod: access
api_name:
- Access.CommandButton
ms.assetid: 25e7c0b7-03c1-dffe-8f52-4ec59739f6b8
ms.date: 03/05/2019
localization_priority: Normal
---

# CommandButton object (Access)
This object corresponds to a command button. A command button on a form can start an action or a set of actions. For example, you could create a command button that opens another form. To make a command button do something, you write a macro or event procedure and attach it to the button's **OnClick** property.

## Remarks
|Control|Tool|
|:------|:---|
|![Command button](../images/t-cmdbtn_ZA06053979.gif)|![Command button](../images/command_ZA06047243.gif)|
You can display text on a command button by setting its **Caption** property, or you can display a picture by setting its **Picture** property.
> [!NOTE] 
> You can create over 30 different types of command buttons with the Command Button Wizard. When you use the Command Button Wizard, Microsoft Access creates the button and the event procedure for you.



### Methods
#### JinCommandButton>>acceptVisitor: aVisitor
Accepts visitor



## JinImage
---
title: Image object (Access)
keywords: vbaac10.chm10436
f1_keywords:
- vbaac10.chm10436
ms.prod: access
api_name:
- Access.Image
ms.assetid: 1bcc8552-94e2-b799-6903-392205cb4341
ms.date: 03/20/2019
localization_priority: Normal
---

# Image object (Access)
This object corresponds to an image control. The image control can add a picture to a form or report. For example, you could include an image control for a logo on an **Invoice** report.
> [!NOTE] 
> The functionality for the **Image** object's **Click** and **DoubleClick** events has been deprecated. If you want an image with click/double-click events, use instead a **Button** control and associate an image with that control to provide better accessibility. **Button** controls are part of the Tab Order loop, but **Image** controls are not. Existing applications will not be affected by this change.
## Remarks
|Control|Tool|
|:------|:----|
|![Image control](../images/t-imgctl_ZA06053959.gif)|![Image tool](../images/imagefrm_ZA06044465.gif)|
You can use the image control or an [Unbound object frame](overview/Access.md) for unbound pictures. The advantage of using the image control is that it's faster to display. The advantage of using the unbound object frame is that you can edit the object directly from the form or report.



### Methods
#### JinImage>>acceptVisitor: aVisitor
Accepts visitor



## JinLabel
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


### Methods
#### JinLabel>>acceptVisitor: aVisitor
Accepts visitor



## JinLine
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


### Methods
#### JinLine>>acceptVisitor: aVisitor
Accepts visitor



## JinListBox
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
    sql = "SELECT ColorID, ColorName FROM Colors WHERE ColorName Like '" & Me.FilterBy.Text & "*' ORDER BY ColorName"
    
    'If you want to match any part of the string then add wildcard (*) before
    'the FilterBy.Text, too:
    'sql = "SELECT ColorID, ColorName FROM Colors WHERE ColorName Like '*" & Me.FilterBy.Text & "*' ORDER BY ColorName"
    
    Me.ColorID.RowSource = sql
    
End Sub
```


### Methods
#### JinListBox>>acceptVisitor: aVisitor
Accepts visitor



## JinPage
---
title: Page object (Access)
keywords: vbaac10.chm10124
f1_keywords:
- vbaac10.chm10124
ms.prod: access
api_name:
- Access.Page
ms.assetid: 6351b0ea-bd07-5ee6-ea20-0d410e09d939
ms.date: 03/21/2019
localization_priority: Normal
---

# Page object (Access)
A **Page** object corresponds to an individual page on a tab control.

## Remarks
A **Page** object is a member of a tab control's **[Pages](Access.Pages.md)** collection.
To return a reference to a particular **Page** object in the **Pages** collection, use any of the following syntax forms.
|Syntax|Description|
|:-----|:-----|
|**Pages**!_pagename_|The _pagename_ argument is the name of the **Page** object.|
|**Pages**("_pagename_")|The _pagename_ argument is the name of the **Page** object.|
|**Pages**(_index_)|The _index_ argument is the numeric position of the object within the collection.|
You can create, move, or delete **Page** objects and set their properties either in Visual Basic or in form Design view. To create a new **Page** object in Visual Basic, use the **[Add](access.pages.add.md)** method of the **Pages** collection. To delete a **Page** object, use the **[Remove](access.pages.remove.md)** method of the **Pages** collection.
To create a new **Page** object in form Design view, right-click the tab control and then choose **Insert Page** on the shortcut menu. You can also copy an existing page and paste it. You can set the properties of the new **Page** object in form Design view by using the property sheet.
Each **Page** object has a **PageIndex** property that indicates its position within the **Pages** collection. The **Value** property of the tab control is equal to the **PageIndex** property of the current page. You can use these properties to determine which page is currently selected after the user has switched from one page to another, or to change the order in which the pages appear in the control.
A **Page** object is also a type of **Control** object. The **ControlType** property constant for a **Page** object is **acPage**. Although it is a control, a **Page** object belongs to a **Pages** collection, rather than a **Controls** collection. A tab control's **Pages** collection is a special type of **Controls** collection.
Each **Page** object can also contain one or more controls. Controls on a **Page** object belong to that **Page** object's **Controls** collection. To work with a control on a **Page** object, you must refer to that control within the **Page** object's **Controls** collection.


### Methods
#### JinPage>>acceptVisitor: aVisitor
Accepts visitor



## JinRectangle
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



### Methods
#### JinRectangle>>acceptVisitor: aVisitor
Accepts visitor



## JinSubForm
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
    


### Methods
#### JinSubForm>>acceptVisitor: aVisitor
Accepts visitor



## JinTabControl
---
title: TabControl object (Access)
keywords: vbaac10.chm12136
f1_keywords:
- vbaac10.chm12136
ms.prod: access
api_name:
- Access.TabControl
ms.assetid: 05f7de7b-8665-df6d-3fbb-47f8547d3baf
ms.date: 03/21/2019
localization_priority: Normal
---

# TabControl object (Access)
A tab control contains multiple pages on which you can place other controls, such as text boxes or option buttons. When a user chooses the corresponding tab, that page becomes active.

## Remarks
With the tab control, you can construct a single form or dialog box that contains several different tabs, and you can group similar options or data on each tab's page. For example, you might use a tab control on an **Employees** form to separate general and personal information.


### Methods
#### JinTabControl>>acceptVisitor: aVisitor
Accepts visitor



## JinTextbox
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
MsgBox "The Text box is being updated."
End Sub
```


### Methods
#### JinTextbox>>acceptVisitor: aVisitor
Accepts visitor



## JinLibrary
This class allows to inspect libraries. For doing so it leverages DBHelp and COM interfaces. 


### Properties
reference
functions
libraryHandle
dbgHandle
types
typeLoader

### Methods
#### JinLibrary>>path
Obtains the path from the remote entity. 

#### JinLibrary>>types
Instantiates the types collection by crawling all the types defined in the library. It uses COM interfaces for doing so. 

#### JinLibrary>>fetchLibraryFunctions
Instantiates the functions collection by crawling all the functions defined in the library. It uses DBHelp Library for doing so. 


