# Jindao
JinDao (進道) is a project faor Microsoft Access usage. JinDao does not mean anything, but puts together Jin (get into) and Dao (way).




# Jindao - Generated Doc
## Manifest
Jindao is a library which provides online access to Microsoft Access projects through the usage of Microsoft COM. 
Jindao follows generally the implementation proposed by [https://inria.hal.science/hal-02966146v1](https://inria.hal.science/hal-02966146v1).
Access provides a visual interface to export some entities by point and click. This process is time consuming and prone to error. It is not tractable for full applications and in addition not all the elements can be exported. Leading to what we call a partially observable domain, since, by the usage of given tooling we cannot obtain artefact to analyze.
![Figure-Blind-Metamodel](https://github.com/impetuosa/Jindao/blob/master/figures/access-metamodel-blind.pdf?raw=true).

The figure shows a simplified model of \access main elements.
In grey we show the elements that \textbf{cannot} be exported from the GUI, in white those that can.
Most of the structural entities are not available for export such as the table definitions, the query SQL definition, reports and forms structures not even the macros. 
The main GUI exporting features are related to the visual basic part of the project, including modules, class-modules, and the report or form companion-modules.
The latter happens to be useless since their structure is not migrated.All analysis proposed over this partial content should be fully based on heuristics. 

Through COM, Access exposes a large and powerful API, that allows high in- teroperability in between different applications.
For interacting with Access through COM we must interact with an object model, composed by the followings.
* Remote handle. For interacting with remote Access entities COM provides remote memory addresses. We call these addresses handles.
* Application. First instance to access through COM. This application object is bound to a running instance of Access. It exposes an explorable API, and it allows access to the project components, directly or indirectly.
* DoCmd. (Do Command) is an object that reifies most of the available operations to apply on the application. It must be used for opening a project, databases and others. Most of the objects below have this object as a dependency.
* References. This collection contains Reference objects describing a project’s static dependencies.
* CurrentProject. Depends on DoCmd. It holds basic metadata for each element in the project, by pointing to the collections AllForms, AllReports, AllMacros, AllModules that contains objects describing each form, report, macro and module correspondingly.
* CurrentData. Depends on DoCmd. It holds metadata for each element related with data structures. In this object the available collections are AllTables, AllQueries that contains objects describing each table and query correspondingly.
* DbEngine. Depends on DoCmd. It is the main access point to the data model. It provides access to workspaces.
* Workspace. Depends on DbEngine. Represent database schemes, and provides access to the scheme elements by pointing to the collections QueryDefs and TableDefs.
* TableDef and QueryDef. Depends on Workspace. Each of these objects contains a description. For the TableDefs name and fields. For the QueryDefs name and SQL.
* Forms, Reports and Modules. Depends on DoCmd. Finally, we have three main collections where we can find the Form, Report and Module objects with their inner composition. This internal definition includes composed controls (textbox, labels, etc.), properties (layout, naming, companion-module, etc) and VBA source code.
## Architecture Implementation
![Figure-Architecture](https://github.com/impetuosa/Jindao/blob/master/figures/uml-arc-jindao.pdf?raw=true).
As general architecture we propose to create a model that uses the COM model as a back-end as shown in the next figure We propose lazy access to the COM model back-end, what will guarantee that we access and load only what is needed. This feature aims to limit the memory usage (constraint stated in Section 2) by construction. The lazy approach will also allow us to map each binary-model-entity to a model-entity one at a time. We also propose to cache the results, for reducing the COM calls and therefore CPU time and inter-process communication.
Regarding the mapping between the COM model entity-type and our model, we propose to use two kinds of mapping: by type and by attribute value. First- class citizen entities are represented by two COM models, and that is why all of them subclass from a LoadableObject class, which maps two COM models instead of one.
For mapping the binary-model-entities to model-entity types, we propose to use factories. The mapping factory by type maps one binary-entity-type to one model-entity-type. The mapping factory by attribute value maps one binary- entity to one specific model-entity-type according to one specific binary-entity value.






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
## Events
- [AfterUpdate](Access.Attachment.AfterUpdate-event.md)
- [AttachmentCurrent](Access.Attachment.AttachmentCurrent.md)
- [BeforeUpdate](Access.Attachment.BeforeUpdate-event.md)
- [Change](Access.Attachment.Change.md)
- [Click](Access.Attachment.Click.md)
- [DblClick](Access.Attachment.DblClick.md)
- [Dirty](Access.Attachment.Dirty.md)
- [Enter](Access.Attachment.Enter.md)
- [Exit](Access.Attachment.Exit.md)
- [GotFocus](Access.Attachment.GotFocus.md)
- [KeyDown](Access.Attachment.KeyDown.md)
- [KeyPress](Access.Attachment.KeyPress.md)
- [KeyUp](Access.Attachment.KeyUp.md)
- [LostFocus](Access.Attachment.LostFocus.md)
- [MouseDown](Access.Attachment.MouseDown.md)
- [MouseMove](Access.Attachment.MouseMove.md)
- [MouseUp](Access.Attachment.MouseUp.md)
## Methods
- [Back](Access.Attachment.Back.md)
- [Forward](Access.Attachment.Forward.md)
- [Move](Access.Attachment.Move.md)
- [Requery](Access.Attachment.Requery.md)
- [SetFocus](Access.Attachment.SetFocus.md)
- [SizeToFit](Access.Attachment.SizeToFit.md)
## Properties
- [AddColon](Access.Attachment.AddColon.md)
- [AfterUpdate](Access.Attachment.AfterUpdate-property.md)
- [Application](Access.Attachment.Application.md)
- [AttachmentCount](Access.Attachment.AttachmentCount.md)
- [AutoLabel](Access.Attachment.AutoLabel.md)
- [BackColor](Access.Attachment.BackColor.md)
- [BackShade](Access.Attachment.BackShade.md)
- [BackStyle](Access.Attachment.BackStyle.md)
- [BackThemeColorIndex](Access.Attachment.BackThemeColorIndex.md)
- [BackTint](Access.Attachment.BackTint.md)
- [BeforeUpdate](Access.Attachment.BeforeUpdate-property.md)
- [BorderColor](Access.Attachment.BorderColor.md)
- [BorderShade](Access.Attachment.BorderShade.md)
- [BorderStyle](Access.Attachment.BorderStyle.md)
- [BorderThemeColorIndex](Access.Attachment.BorderThemeColorIndex.md)
- [BorderTint](Access.Attachment.BorderTint.md)
- [BorderWidth](Access.Attachment.BorderWidth.md)
- [BottomPadding](Access.Attachment.BottomPadding.md)
- [ColumnHidden](Access.Attachment.ColumnHidden.md)
- [ColumnOrder](Access.Attachment.ColumnOrder.md)
- [ColumnWidth](Access.Attachment.ColumnWidth.md)
- [Controls](Access.Attachment.Controls.md)
- [ControlSource](Access.Attachment.ControlSource.md)
- [ControlTipText](Access.Attachment.ControlTipText.md)
- [ControlType](Access.Attachment.ControlType.md)
- [CurrentAttachment](Access.Attachment.CurrentAttachment.md)
- [DefaultPicture](Access.Attachment.DefaultPicture.md)
- [DefaultPictureType](Access.Attachment.DefaultPictureType.md)
- [DisplayAs](Access.Attachment.DisplayAs.md)
- [DisplayWhen](Access.Attachment.DisplayWhen.md)
- [Enabled](Access.Attachment.Enabled.md)
- [EventProcPrefix](Access.Attachment.EventProcPrefix.md)
- [FileName](Access.Attachment.FileName.md)
- [FileType](Access.Attachment.FileType.md)
- [FileURL](Access.Attachment.FileURL.md)
- [GridlineColor](Access.Attachment.GridlineColor.md)
- [GridlineShade](Access.Attachment.GridlineShade.md)
- [GridlineStyleBottom](Access.Attachment.GridlineStyleBottom.md)
- [GridlineStyleLeft](Access.Attachment.GridlineStyleLeft.md)
- [GridlineStyleRight](Access.Attachment.GridlineStyleRight.md)
- [GridlineStyleTop](Access.Attachment.GridlineStyleTop.md)
- [GridlineThemeColorIndex](Access.Attachment.GridlineThemeColorIndex.md)
- [GridlineTint](Access.Attachment.GridlineTint.md)
- [GridlineWidthBottom](Access.Attachment.GridlineWidthBottom.md)
- [GridlineWidthLeft](Access.Attachment.GridlineWidthLeft.md)
- [GridlineWidthRight](Access.Attachment.GridlineWidthRight.md)
- [GridlineWidthTop](Access.Attachment.GridlineWidthTop.md)
- [Height](Access.Attachment.Height.md)
- [HelpContextId](Access.Attachment.HelpContextId.md)
- [HorizontalAnchor](Access.Attachment.HorizontalAnchor.md)
- [InSelection](Access.Attachment.InSelection.md)
- [IsVisible](Access.Attachment.IsVisible.md)
- [LabelAlign](Access.Attachment.LabelAlign.md)
- [LabelX](Access.Attachment.LabelX.md)
- [LabelY](Access.Attachment.LabelY.md)
- [Layout](Access.Attachment.Layout.md)
- [LayoutID](Access.Attachment.LayoutID.md)
- [Left](Access.Attachment.Left.md)
- [LeftPadding](Access.Attachment.LeftPadding.md)
- [Locked](Access.Attachment.Locked.md)
- [Name](Access.Attachment.Name.md)
- [OldBorderStyle](Access.Attachment.OldBorderStyle.md)
- [OldValue](Access.Attachment.OldValue.md)
- [OnAttachmentCurrent](Access.Attachment.OnAttachmentCurrent.md)
- [OnChange](Access.Attachment.OnChange.md)
- [OnClick](Access.Attachment.OnClick.md)
- [OnDblClick](Access.Attachment.OnDblClick.md)
- [OnDirty](Access.Attachment.OnDirty.md)
- [OnEnter](Access.Attachment.OnEnter.md)
- [OnExit](Access.Attachment.OnExit.md)
- [OnGotFocus](Access.Attachment.OnGotFocus.md)
- [OnKeyDown](Access.Attachment.OnKeyDown.md)
- [OnKeyPress](Access.Attachment.OnKeyPress.md)
- [OnKeyUp](Access.Attachment.OnKeyUp.md)
- [OnLostFocus](Access.Attachment.OnLostFocus.md)
- [OnMouseDown](Access.Attachment.OnMouseDown.md)
- [OnMouseMove](Access.Attachment.OnMouseMove.md)
- [OnMouseUp](Access.Attachment.OnMouseUp.md)
- [Parent](Access.Attachment.Parent.md)
- [PictureAlignment](Access.Attachment.PictureAlignment.md)
- [PictureSizeMode](Access.Attachment.PictureSizeMode.md)
- [PictureTiling](Access.Attachment.PictureTiling.md)
- [Properties](Access.Attachment.Properties.md)
- [RightPadding](Access.Attachment.RightPadding.md)
- [Section](Access.Attachment.Section.md)
- [ShortcutMenuBar](Access.Attachment.ShortcutMenuBar.md)
- [SpecialEffect](Access.Attachment.SpecialEffect.md)
- [StatusBarText](Access.Attachment.StatusBarText.md)
- [TabIndex](Access.Attachment.TabIndex.md)
- [TabStop](Access.Attachment.TabStop.md)
- [Tag](Access.Attachment.Tag.md)
- [Top](Access.Attachment.Top.md)
- [TopPadding](Access.Attachment.TopPadding.md)
- [VerticalAnchor](Access.Attachment.VerticalAnchor.md)
- [Visible](Access.Attachment.Visible.md)
- [Width](Access.Attachment.Width.md)
## See also
- [Access Object Model Reference](overview/Access/object-model.md)

[!include[Support and feedback](~/includes/feedback-boilerplate.md)]


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

## Events
- [AfterUpdate](Access.CheckBox.AfterUpdate-event.md)
- [BeforeUpdate](Access.CheckBox.BeforeUpdate-event.md)
- [Click](Access.CheckBox.Click.md)
- [DblClick](Access.CheckBox.DblClick.md)
- [Enter](Access.CheckBox.Enter.md)
- [Exit](Access.CheckBox.Exit.md)
- [GotFocus](Access.CheckBox.GotFocus.md)
- [KeyDown](Access.CheckBox.KeyDown.md)
- [KeyPress](Access.CheckBox.KeyPress.md)
- [KeyUp](Access.CheckBox.KeyUp.md)
- [LostFocus](Access.CheckBox.LostFocus.md)
- [MouseDown](Access.CheckBox.MouseDown.md)
- [MouseMove](Access.CheckBox.MouseMove.md)
- [MouseUp](Access.CheckBox.MouseUp.md)
## Methods
- [Move](Access.CheckBox.Move.md)
- [Requery](Access.CheckBox.Requery.md)
- [SetFocus](Access.CheckBox.SetFocus.md)
- [SizeToFit](Access.CheckBox.SizeToFit.md)
- [Undo](Access.CheckBox.Undo.md)
## Properties
- [AddColon](Access.CheckBox.AddColon.md)
- [AfterUpdate](Access.CheckBox.AfterUpdate-property.md)
- [Application](Access.CheckBox.Application.md)
- [AutoLabel](Access.CheckBox.AutoLabel.md)
- [BeforeUpdate](Access.CheckBox.BeforeUpdate-property.md)
- [BorderColor](Access.CheckBox.BorderColor.md)
- [BorderShade](Access.CheckBox.BorderShade.md)
- [BorderStyle](Access.CheckBox.BorderStyle.md)
- [BorderThemeColorIndex](Access.CheckBox.BorderThemeColorIndex.md)
- [BorderTint](Access.CheckBox.BorderTint.md)
- [BorderWidth](Access.CheckBox.BorderWidth.md)
- [BottomPadding](Access.CheckBox.BottomPadding.md)
- [ColumnHidden](Access.CheckBox.ColumnHidden.md)
- [ColumnOrder](Access.CheckBox.ColumnOrder.md)
- [ColumnWidth](Access.CheckBox.ColumnWidth.md)
- [Controls](Access.CheckBox.Controls.md)
- [ControlSource](Access.CheckBox.ControlSource.md)
- [ControlTipText](Access.CheckBox.ControlTipText.md)
- [ControlType](Access.CheckBox.ControlType.md)
- [DefaultValue](Access.CheckBox.DefaultValue.md)
- [DisplayWhen](Access.CheckBox.DisplayWhen.md)
- [Enabled](Access.CheckBox.Enabled.md)
- [EventProcPrefix](Access.CheckBox.EventProcPrefix.md)
- [GridlineColor](Access.CheckBox.GridlineColor.md)
- [GridlineShade](Access.CheckBox.GridlineShade.md)
- [GridlineStyleBottom](Access.CheckBox.GridlineStyleBottom.md)
- [GridlineStyleLeft](Access.CheckBox.GridlineStyleLeft.md)
- [GridlineStyleRight](Access.CheckBox.GridlineStyleRight.md)
- [GridlineStyleTop](Access.CheckBox.GridlineStyleTop.md)
- [GridlineThemeColorIndex](Access.CheckBox.GridlineThemeColorIndex.md)
- [GridlineTint](Access.CheckBox.GridlineTint.md)
- [GridlineWidthBottom](Access.CheckBox.GridlineWidthBottom.md)
- [GridlineWidthLeft](Access.CheckBox.GridlineWidthLeft.md)
- [GridlineWidthRight](Access.CheckBox.GridlineWidthRight.md)
- [GridlineWidthTop](Access.CheckBox.GridlineWidthTop.md)
- [Height](Access.CheckBox.Height.md)
- [HelpContextId](Access.CheckBox.HelpContextId.md)
- [HideDuplicates](Access.CheckBox.HideDuplicates.md)
- [HorizontalAnchor](Access.CheckBox.HorizontalAnchor.md)
- [InSelection](Access.CheckBox.InSelection.md)
- [IsVisible](Access.CheckBox.IsVisible.md)
- [LabelAlign](Access.CheckBox.LabelAlign.md)
- [LabelX](Access.CheckBox.LabelX.md)
- [LabelY](Access.CheckBox.LabelY.md)
- [Layout](Access.CheckBox.Layout.md)
- [LayoutID](Access.CheckBox.LayoutID.md)
- [Left](Access.CheckBox.Left.md)
- [LeftPadding](Access.CheckBox.LeftPadding.md)
- [Locked](Access.CheckBox.Locked.md)
- [Name](Access.CheckBox.Name.md)
- [OldBorderStyle](Access.CheckBox.OldBorderStyle.md)
- [OldValue](Access.CheckBox.OldValue.md)
- [OnClick](Access.CheckBox.OnClick.md)
- [OnDblClick](Access.CheckBox.OnDblClick.md)
- [OnEnter](Access.CheckBox.OnEnter.md)
- [OnExit](Access.CheckBox.OnExit.md)
- [OnGotFocus](Access.CheckBox.OnGotFocus.md)
- [OnKeyDown](Access.CheckBox.OnKeyDown.md)
- [OnKeyPress](Access.CheckBox.OnKeyPress.md)
- [OnKeyUp](Access.CheckBox.OnKeyUp.md)
- [OnLostFocus](Access.CheckBox.OnLostFocus.md)
- [OnMouseDown](Access.CheckBox.OnMouseDown.md)
- [OnMouseMove](Access.CheckBox.OnMouseMove.md)
- [OnMouseUp](Access.CheckBox.OnMouseUp.md)
- [OptionValue](Access.CheckBox.OptionValue.md)
- [Parent](Access.CheckBox.Parent.md)
- [Properties](Access.CheckBox.Properties.md)
- [ReadingOrder](Access.CheckBox.ReadingOrder.md)
- [RightPadding](Access.CheckBox.RightPadding.md)
- [Section](Access.CheckBox.Section.md)
- [ShortcutMenuBar](Access.CheckBox.ShortcutMenuBar.md)
- [SpecialEffect](Access.CheckBox.SpecialEffect.md)
- [StatusBarText](Access.CheckBox.StatusBarText.md)
- [TabIndex](Access.CheckBox.TabIndex.md)
- [TabStop](Access.CheckBox.TabStop.md)
- [Tag](Access.CheckBox.Tag.md)
- [Top](Access.CheckBox.Top.md)
- [TopPadding](Access.CheckBox.TopPadding.md)
- [TripleState](Access.CheckBox.TripleState.md)
- [ValidationRule](Access.CheckBox.ValidationRule.md)
- [ValidationText](Access.CheckBox.ValidationText.md)
- [Value](Access.CheckBox.Value.md)
- [VerticalAnchor](Access.CheckBox.VerticalAnchor.md)
- [Visible](Access.CheckBox.Visible.md)
- [Width](Access.CheckBox.Width.md)
## See also
- [Access Object Model Reference](overview/Access/object-model.md)

[!include[Support and feedback](~/includes/feedback-boilerplate.md)]


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

## Events
- [Click](Access.CommandButton.Click.md)
- [DblClick](Access.CommandButton.DblClick.md)
- [Enter](Access.CommandButton.Enter.md)
- [Exit](Access.CommandButton.Exit.md)
- [GotFocus](Access.CommandButton.GotFocus.md)
- [KeyDown](Access.CommandButton.KeyDown.md)
- [KeyPress](Access.CommandButton.KeyPress.md)
- [KeyUp](Access.CommandButton.KeyUp.md)
- [LostFocus](Access.CommandButton.LostFocus.md)
- [MouseDown](Access.CommandButton.MouseDown.md)
- [MouseMove](Access.CommandButton.MouseMove.md)
- [MouseUp](Access.CommandButton.MouseUp.md)

## Methods
- [Move](Access.CommandButton.Move.md)
- [Requery](Access.CommandButton.Requery.md)
- [SetFocus](Access.CommandButton.SetFocus.md)
- [SizeToFit](Access.CommandButton.SizeToFit.md)

## Properties
- [AddColon](Access.CommandButton.AddColon.md)
- [Alignment](Access.CommandButton.Alignment.md)
- [Application](Access.CommandButton.Application.md)
- [AutoLabel](Access.CommandButton.AutoLabel.md)
- [AutoRepeat](Access.CommandButton.AutoRepeat.md)
- [BackColor](Access.CommandButton.BackColor.md)
- [BackShade](Access.CommandButton.BackShade.md)
- [BackStyle](Access.CommandButton.BackStyle.md)
- [BackThemeColorIndex](Access.CommandButton.BackThemeColorIndex.md)
- [BackTint](Access.CommandButton.BackTint.md)
- [Bevel](Access.CommandButton.Bevel.md)
- [BorderColor](Access.CommandButton.BorderColor.md)
- [BorderShade](Access.CommandButton.BorderShade.md)
- [BorderStyle](Access.CommandButton.BorderStyle.md)
- [BorderThemeColorIndex](Access.CommandButton.BorderThemeColorIndex.md)
- [BorderTint](Access.CommandButton.BorderTint.md)
- [BorderWidth](Access.CommandButton.BorderWidth.md)
- [BottomPadding](Access.CommandButton.BottomPadding.md)
- [Cancel](Access.CommandButton.Cancel.md)
- [Caption](Access.CommandButton.Caption.md)
- [Controls](Access.CommandButton.Controls.md)
- [ControlTipText](Access.CommandButton.ControlTipText.md)
- [ControlType](Access.CommandButton.ControlType.md)
- [CursorOnHover](Access.CommandButton.CursorOnHover.md)
- [Default](Access.CommandButton.Default.md)
- [DisplayWhen](Access.CommandButton.DisplayWhen.md)
- [Enabled](Access.CommandButton.Enabled.md)
- [EventProcPrefix](Access.CommandButton.EventProcPrefix.md)
- [FontBold](Access.CommandButton.FontBold.md)
- [FontItalic](Access.CommandButton.FontItalic.md)
- [FontName](Access.CommandButton.FontName.md)
- [FontSize](Access.CommandButton.FontSize.md)
- [FontUnderline](Access.CommandButton.FontUnderline.md)
- [FontWeight](Access.CommandButton.FontWeight.md)
- [ForeColor](Access.CommandButton.ForeColor.md)
- [ForeShade](Access.CommandButton.ForeShade.md)
- [ForeThemeColorIndex](Access.CommandButton.ForeThemeColorIndex.md)
- [ForeTint](Access.CommandButton.ForeTint.md)
- [Glow](Access.CommandButton.Glow.md)
- [Gradient](Access.CommandButton.Gradient.md)
- [GridlineColor](Access.CommandButton.GridlineColor.md)
- [GridlineShade](Access.CommandButton.GridlineShade.md)
- [GridlineStyleBottom](Access.CommandButton.GridlineStyleBottom.md)
- [GridlineStyleLeft](Access.CommandButton.GridlineStyleLeft.md)
- [GridlineStyleRight](Access.CommandButton.GridlineStyleRight.md)
- [GridlineStyleTop](Access.CommandButton.GridlineStyleTop.md)
- [GridlineThemeColorIndex](Access.CommandButton.GridlineThemeColorIndex.md)
- [GridlineTint](Access.CommandButton.GridlineTint.md)
- [GridlineWidthBottom](Access.CommandButton.GridlineWidthBottom.md)
- [GridlineWidthLeft](Access.CommandButton.GridlineWidthLeft.md)
- [GridlineWidthRight](Access.CommandButton.GridlineWidthRight.md)
- [GridlineWidthTop](Access.CommandButton.GridlineWidthTop.md)
- [Height](Access.CommandButton.Height.md)
- [HelpContextId](Access.CommandButton.HelpContextId.md)
- [HorizontalAnchor](Access.CommandButton.HorizontalAnchor.md)
- [HoverColor](Access.CommandButton.HoverColor.md)
- [HoverForeColor](Access.CommandButton.HoverForeColor.md)
- [HoverForeShade](Access.CommandButton.HoverForeShade.md)
- [HoverForeThemeColorIndex](Access.CommandButton.HoverForeThemeColorIndex.md)
- [HoverForeTint](Access.CommandButton.HoverForeTint.md)
- [HoverShade](Access.CommandButton.HoverShade.md)
- [HoverThemeColorIndex](Access.CommandButton.HoverThemeColorIndex.md)
- [HoverTint](Access.CommandButton.HoverTint.md)
- [Hyperlink](Access.CommandButton.Hyperlink.md)
- [HyperlinkAddress](Access.CommandButton.HyperlinkAddress.md)
- [HyperlinkSubAddress](Access.CommandButton.HyperlinkSubAddress.md)
- [InSelection](Access.CommandButton.InSelection.md)
- [IsVisible](Access.CommandButton.IsVisible.md)
- [LabelAlign](Access.CommandButton.LabelAlign.md)
- [LabelX](Access.CommandButton.LabelX.md)
- [LabelY](Access.CommandButton.LabelY.md)
- [Layout](Access.CommandButton.Layout.md)
- [LayoutID](Access.CommandButton.LayoutID.md)
- [Left](Access.CommandButton.Left.md)
- [LeftPadding](Access.CommandButton.LeftPadding.md)
- [Name](Access.CommandButton.Name.md)
- [ObjectPalette](Access.CommandButton.ObjectPalette.md)
- [OldValue](Access.CommandButton.OldValue.md)
- [OnClick](Access.CommandButton.OnClick.md)
- [OnDblClick](Access.CommandButton.OnDblClick.md)
- [OnEnter](Access.CommandButton.OnEnter.md)
- [OnExit](Access.CommandButton.OnExit.md)
- [OnGotFocus](Access.CommandButton.OnGotFocus.md)
- [OnKeyDown](Access.CommandButton.OnKeyDown.md)
- [OnKeyPress](Access.CommandButton.OnKeyPress.md)
- [OnKeyUp](Access.CommandButton.OnKeyUp.md)
- [OnLostFocus](Access.CommandButton.OnLostFocus.md)
- [OnMouseDown](Access.CommandButton.OnMouseDown.md)
- [OnMouseMove](Access.CommandButton.OnMouseMove.md)
- [OnMouseUp](Access.CommandButton.OnMouseUp.md)
- [OnPush](Access.CommandButton.OnPush.md)
- [Parent](Access.CommandButton.Parent.md)
- [Picture](Access.CommandButton.Picture.md)
- [PictureCaptionArrangement](Access.CommandButton.PictureCaptionArrangement.md)
- [PictureData](Access.CommandButton.PictureData.md)
- [PictureType](Access.CommandButton.PictureType.md)
- [PressedColor](Access.CommandButton.PressedColor.md)
- [PressedForeColor](Access.CommandButton.PressedForeColor.md)
- [PressedForeShade](Access.CommandButton.PressedForeShade.md)
- [PressedForeThemeColorIndex](Access.CommandButton.PressedForeThemeColorIndex.md)
- [PressedForeTint](Access.CommandButton.PressedForeTint.md)
- [PressedShade](Access.CommandButton.PressedShade.md)
- [PressedThemeColorIndex](Access.CommandButton.PressedThemeColorIndex.md)
- [PressedTint](Access.CommandButton.PressedTint.md)
- [Properties](Access.CommandButton.Properties.md)
- [QuickStyle](Access.CommandButton.QuickStyle.md)
- [QuickStyleMask](Access.commandbutton.quickstylemask.md)
- [ReadingOrder](Access.CommandButton.ReadingOrder.md)
- [RightPadding](Access.CommandButton.RightPadding.md)
- [Section](Access.CommandButton.Section.md)
- [Shadow](Access.CommandButton.Shadow.md)
- [Shape](Access.CommandButton.Shape.md)
- [ShortcutMenuBar](Access.CommandButton.ShortcutMenuBar.md)
- [SoftEdges](Access.CommandButton.SoftEdges.md)
- [StatusBarText](Access.CommandButton.StatusBarText.md)
- [TabIndex](Access.CommandButton.TabIndex.md)
- [TabStop](Access.CommandButton.TabStop.md)
- [Tag](Access.CommandButton.Tag.md)
- [ThemeFontIndex](Access.CommandButton.ThemeFontIndex.md)
- [Top](Access.CommandButton.Top.md)
- [TopPadding](Access.CommandButton.TopPadding.md)
- [Transparent](Access.CommandButton.Transparent.md)
- [UseTheme](Access.CommandButton.UseTheme.md)
- [VerticalAnchor](Access.CommandButton.VerticalAnchor.md)
- [Visible](Access.CommandButton.Visible.md)
- [Width](Access.CommandButton.Width.md)

## See also
- [Access Object Model Reference](overview/Access/object-model.md)

[!include[Support and feedback](~/includes/feedback-boilerplate.md)]


### Methods
#### JinCommandButton>>acceptVisitor: aVisitor
Accepts visitor



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

## Events
- [Click](Access.Image.Click.md)
- [DblClick](Access.Image.DblClick.md)
- [MouseDown](Access.Image.MouseDown.md)
- [MouseMove](Access.Image.MouseMove.md)
- [MouseUp](Access.Image.MouseUp.md)
## Methods
- [Move](Access.Image.Move.md)
- [Requery](Access.Image.Requery.md)
- [SetFocus](Access.Image.SetFocus.md)
- [SizeToFit](Access.Image.SizeToFit.md)
## Properties
- [Application](Access.Image.Application.md)
- [BackColor](Access.Image.BackColor.md)
- [BackShade](Access.Image.BackShade.md)
- [BackStyle](Access.Image.BackStyle.md)
- [BackThemeColorIndex](Access.Image.BackThemeColorIndex.md)
- [BackTint](Access.Image.BackTint.md)
- [BorderColor](Access.Image.BorderColor.md)
- [BorderShade](Access.Image.BorderShade.md)
- [BorderStyle](Access.Image.BorderStyle.md)
- [BorderThemeColorIndex](Access.Image.BorderThemeColorIndex.md)
- [BorderTint](Access.Image.BorderTint.md)
- [BorderWidth](Access.Image.BorderWidth.md)
- [BottomPadding](Access.Image.BottomPadding.md)
- [Controls](Access.Image.Controls.md)
- [ControlTipText](Access.Image.ControlTipText.md)
- [ControlType](Access.Image.ControlType.md)
- [DisplayWhen](Access.Image.DisplayWhen.md)
- [EventProcPrefix](Access.Image.EventProcPrefix.md)
- [GridlineColor](Access.Image.GridlineColor.md)
- [GridlineShade](Access.Image.GridlineShade.md)
- [GridlineStyleBottom](Access.Image.GridlineStyleBottom.md)
- [GridlineStyleLeft](Access.Image.GridlineStyleLeft.md)
- [GridlineStyleRight](Access.Image.GridlineStyleRight.md)
- [GridlineStyleTop](Access.Image.GridlineStyleTop.md)
- [GridlineThemeColorIndex](Access.Image.GridlineThemeColorIndex.md)
- [GridlineTint](Access.Image.GridlineTint.md)
- [GridlineWidthBottom](Access.Image.GridlineWidthBottom.md)
- [GridlineWidthLeft](Access.Image.GridlineWidthLeft.md)
- [GridlineWidthRight](Access.Image.GridlineWidthRight.md)
- [GridlineWidthTop](Access.Image.GridlineWidthTop.md)
- [Height](Access.Image.Height.md)
- [HelpContextId](Access.Image.HelpContextId.md)
- [HorizontalAnchor](Access.Image.HorizontalAnchor.md)
- [Hyperlink](Access.Image.Hyperlink.md)
- [HyperlinkAddress](Access.Image.HyperlinkAddress.md)
- [HyperlinkSubAddress](Access.Image.HyperlinkSubAddress.md)
- [ImageHeight](Access.Image.ImageHeight.md)
- [ImageWidth](Access.Image.ImageWidth.md)
- [InSelection](Access.Image.InSelection.md)
- [IsVisible](Access.Image.IsVisible.md)
- [Layout](Access.Image.Layout.md)
- [LayoutID](Access.Image.LayoutID.md)
- [Left](Access.Image.Left.md)
- [LeftPadding](Access.Image.LeftPadding.md)
- [Name](Access.Image.Name.md)
- [ObjectPalette](Access.Image.ObjectPalette.md)
- [OldBorderStyle](Access.Image.OldBorderStyle.md)
- [OldValue](Access.Image.OldValue.md)
- [OnClick](Access.Image.OnClick.md)
- [OnDblClick](Access.Image.OnDblClick.md)
- [OnMouseDown](Access.Image.OnMouseDown.md)
- [OnMouseMove](Access.Image.OnMouseMove.md)
- [OnMouseUp](Access.Image.OnMouseUp.md)
- [Parent](Access.Image.Parent.md)
- [Picture](Access.Image.Picture.md)
- [PictureAlignment](Access.Image.PictureAlignment.md)
- [PictureData](Access.Image.PictureData.md)
- [PictureTiling](Access.Image.PictureTiling.md)
- [PictureType](Access.Image.PictureType.md)
- [Properties](Access.Image.Properties.md)
- [RightPadding](Access.Image.RightPadding.md)
- [Section](Access.Image.Section.md)
- [ShortcutMenuBar](Access.Image.ShortcutMenuBar.md)
- [SizeMode](Access.Image.SizeMode.md)
- [SpecialEffect](Access.Image.SpecialEffect.md)
- [Tag](Access.Image.Tag.md)
- [Top](Access.Image.Top.md)
- [TopPadding](Access.Image.TopPadding.md)
- [VerticalAnchor](Access.Image.VerticalAnchor.md)
- [Visible](Access.Image.Visible.md)
- [Width](Access.Image.Width.md)
## See also
- [Access Object Model Reference](overview/Access/object-model.md)

[!include[Support and feedback](~/includes/feedback-boilerplate.md)]


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

## Events
- [Click](Access.Label.Click.md)
- [DblClick](Access.Label.DblClick.md)
- [MouseDown](Access.Label.MouseDown.md)
- [MouseMove](Access.Label.MouseMove.md)
- [MouseUp](Access.Label.MouseUp.md)
## Methods
- [Move](Access.Label.Move.md)
- [SizeToFit](Access.Label.SizeToFit.md)
## Properties
- [Application](Access.Label.Application.md)
- [BackColor](Access.Label.BackColor.md)
- [BackShade](Access.Label.BackShade.md)
- [BackStyle](Access.Label.BackStyle.md)
- [BackThemeColorIndex](Access.Label.BackThemeColorIndex.md)
- [BackTint](Access.Label.BackTint.md)
- [BorderColor](Access.Label.BorderColor.md)
- [BorderShade](Access.Label.BorderShade.md)
- [BorderStyle](Access.Label.BorderStyle.md)
- [BorderThemeColorIndex](Access.Label.BorderThemeColorIndex.md)
- [BorderTint](Access.Label.BorderTint.md)
- [BorderWidth](Access.Label.BorderWidth.md)
- [BottomMargin](Access.Label.BottomMargin.md)
- [BottomPadding](Access.Label.BottomPadding.md)
- [Caption](Access.Label.Caption.md)
- [ControlTipText](Access.Label.ControlTipText.md)
- [ControlType](Access.Label.ControlType.md)
- [DisplayWhen](Access.Label.DisplayWhen.md)
- [EventProcPrefix](Access.Label.EventProcPrefix.md)
- [FontBold](Access.Label.FontBold.md)
- [FontItalic](Access.Label.FontItalic.md)
- [FontName](Access.Label.FontName.md)
- [FontSize](Access.Label.FontSize.md)
- [FontUnderline](Access.Label.FontUnderline.md)
- [FontWeight](Access.Label.FontWeight.md)
- [ForeColor](Access.Label.ForeColor.md)
- [ForeShade](Access.Label.ForeShade.md)
- [ForeThemeColorIndex](Access.Label.ForeThemeColorIndex.md)
- [ForeTint](Access.Label.ForeTint.md)
- [GridlineColor](Access.Label.GridlineColor.md)
- [GridlineShade](Access.Label.GridlineShade.md)
- [GridlineStyleBottom](Access.Label.GridlineStyleBottom.md)
- [GridlineStyleLeft](Access.Label.GridlineStyleLeft.md)
- [GridlineStyleRight](Access.Label.GridlineStyleRight.md)
- [GridlineStyleTop](Access.Label.GridlineStyleTop.md)
- [GridlineThemeColorIndex](Access.Label.GridlineThemeColorIndex.md)
- [GridlineTint](Access.Label.GridlineTint.md)
- [GridlineWidthBottom](Access.Label.GridlineWidthBottom.md)
- [GridlineWidthLeft](Access.Label.GridlineWidthLeft.md)
- [GridlineWidthRight](Access.Label.GridlineWidthRight.md)
- [GridlineWidthTop](Access.Label.GridlineWidthTop.md)
- [Height](Access.Label.Height.md)
- [HelpContextId](Access.Label.HelpContextId.md)
- [HorizontalAnchor](Access.Label.HorizontalAnchor.md)
- [Hyperlink](Access.Label.Hyperlink.md)
- [HyperlinkAddress](Access.Label.HyperlinkAddress.md)
- [HyperlinkSubAddress](Access.Label.HyperlinkSubAddress.md)
- [InSelection](Access.Label.InSelection.md)
- [IsVisible](Access.Label.IsVisible.md)
- [Layout](Access.Label.Layout.md)
- [LayoutID](Access.Label.LayoutID.md)
- [Left](Access.Label.Left.md)
- [LeftMargin](Access.Label.LeftMargin.md)
- [LeftPadding](Access.Label.LeftPadding.md)
- [LineSpacing](Access.Label.LineSpacing.md)
- [Name](Access.Label.Name.md)
- [NumeralShapes](Access.Label.NumeralShapes.md)
- [OldBorderStyle](Access.Label.OldBorderStyle.md)
- [OnClick](Access.Label.OnClick.md)
- [OnDblClick](Access.Label.OnDblClick.md)
- [OnMouseDown](Access.Label.OnMouseDown.md)
- [OnMouseMove](Access.Label.OnMouseMove.md)
- [OnMouseUp](Access.Label.OnMouseUp.md)
- [Parent](Access.Label.Parent.md)
- [Properties](Access.Label.Properties.md)
- [ReadingOrder](Access.Label.ReadingOrder.md)
- [RightMargin](Access.Label.RightMargin.md)
- [RightPadding](Access.Label.RightPadding.md)
- [Section](Access.Label.Section.md)
- [ShortcutMenuBar](Access.Label.ShortcutMenuBar.md)
- [SmartTags](Access.Label.SmartTags.md)
- [SpecialEffect](Access.Label.SpecialEffect.md)
- [Tag](Access.Label.Tag.md)
- [TextAlign](Access.Label.TextAlign.md)
- [ThemeFontIndex](Access.Label.ThemeFontIndex.md)
- [Top](Access.Label.Top.md)
- [TopMargin](Access.Label.TopMargin.md)
- [TopPadding](Access.Label.TopPadding.md)
- [Vertical](Access.Label.Vertical.md)
- [VerticalAnchor](Access.Label.VerticalAnchor.md)
- [Visible](Access.Label.Visible.md)
- [Width](Access.Label.Width.md)
## See also
- [Access Object Model Reference](overview/Access/object-model.md)

[!include[Support and feedback](~/includes/feedback-boilerplate.md)]


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


### Methods
#### JinListBox>>acceptVisitor: aVisitor
Accepts visitor



## JinModelObject
I represent a first citizen element. 
I have the feature of being loadable, i put together many faces of the same concept (ex JinForm+JinFormBody+JinVBeForm)

### Properties
description
body
project

### Methods
#### JinModelObject>>closeAndSave
Closes and save this first class citizen

#### JinModelObject>>load
Opens the first class citizen object in edition mode in the context of the Microsoft Access environment. 

#### JinModelObject>>save
Saves any modification of a firstclass citizen 

#### JinModelObject>>exportToFolder: aFolder
export as text into a given folder 

#### JinModelObject>>close
Closes this first class citizen



## JinNorwindBasedTests
This class contains tests

### Properties
testSelector
expectedFails
parametersToUse
project

### Methods
#### JinNorwindBasedTests>>setUp
This testcase expects the existance of the Northwind database in c:\Northwind.accdb



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

## Events
- [Click](Access.Page.Click.md)
- [DblClick](Access.Page.DblClick.md)
- [MouseDown](Access.Page.MouseDown.md)
- [MouseMove](Access.Page.MouseMove.md)
- [MouseUp](Access.Page.MouseUp.md)
## Methods
- [Move](Access.Page.Move.md)
- [Requery](Access.Page.Requery.md)
- [SetFocus](Access.Page.SetFocus.md)
- [SetTabOrder](Access.Page.SetTabOrder.md)
- [SizeToFit](Access.Page.SizeToFit.md)
## Properties
- [Application](Access.Page.Application.md)
- [Caption](Access.Page.Caption.md)
- [Controls](Access.Page.Controls.md)
- [ControlTipText](Access.Page.ControlTipText.md)
- [ControlType](Access.Page.ControlType.md)
- [Enabled](Access.Page.Enabled.md)
- [EventProcPrefix](Access.Page.EventProcPrefix.md)
- [Height](Access.Page.Height.md)
- [HelpContextId](Access.Page.HelpContextId.md)
- [InSelection](Access.Page.InSelection.md)
- [IsVisible](Access.Page.IsVisible.md)
- [Left](Access.Page.Left.md)
- [Name](Access.Page.Name.md)
- [OnClick](Access.Page.OnClick.md)
- [OnDblClick](Access.Page.OnDblClick.md)
- [OnMouseDown](Access.Page.OnMouseDown.md)
- [OnMouseMove](Access.Page.OnMouseMove.md)
- [OnMouseUp](Access.Page.OnMouseUp.md)
- [PageIndex](Access.Page.PageIndex.md)
- [Parent](Access.Page.Parent.md)
- [Picture](Access.Page.Picture.md)
- [PictureData](Access.Page.PictureData.md)
- [PictureType](Access.Page.PictureType.md)
- [Properties](Access.Page.Properties.md)
- [Section](Access.Page.Section.md)
- [ShortcutMenuBar](Access.Page.ShortcutMenuBar.md)
- [StatusBarText](Access.Page.StatusBarText.md)
- [Tag](Access.Page.Tag.md)
- [Top](Access.Page.Top.md)
- [Visible](Access.Page.Visible.md)
- [Width](Access.Page.Width.md)
## See also
- [Access Object Model Reference](overview/Access/object-model.md)

[!include[Support and feedback](~/includes/feedback-boilerplate.md)]

### Methods
#### JinPage>>acceptVisitor: aVisitor
Accepts visitor



## JinQuery
I represent a query 

### Methods
#### JinQuery>>exportToFolder: aFolder
export as text into a given folder 

#### JinQuery>>fields
Returns the fields of the Query

#### JinQuery>>sql
Returns the SQL used to build the Query



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

## Events
- [Change](Access.TabControl.Change.md)
- [Click](Access.TabControl.Click.md)
- [DblClick](Access.TabControl.DblClick.md)
- [KeyDown](Access.TabControl.KeyDown.md)
- [KeyPress](Access.TabControl.KeyPress.md)
- [KeyUp](Access.TabControl.KeyUp.md)
- [MouseDown](Access.TabControl.MouseDown.md)
- [MouseMove](Access.TabControl.MouseMove.md)
- [MouseUp](Access.TabControl.MouseUp.md)
## Methods
- [Move](Access.TabControl.Move.md)
- [SizeToFit](Access.TabControl.SizeToFit.md)
## Properties
- [Application](Access.TabControl.Application.md)
- [BackColor](Access.TabControl.BackColor.md)
- [BackShade](Access.TabControl.BackShade.md)
- [BackStyle](Access.TabControl.BackStyle.md)
- [BackThemeColorIndex](Access.TabControl.BackThemeColorIndex.md)
- [BackTint](Access.TabControl.BackTint.md)
- [BorderColor](Access.TabControl.BorderColor.md)
- [BorderShade](Access.TabControl.BorderShade.md)
- [BorderStyle](Access.TabControl.BorderStyle.md)
- [BorderThemeColorIndex](Access.TabControl.BorderThemeColorIndex.md)
- [BorderTint](Access.TabControl.BorderTint.md)
- [BottomPadding](Access.TabControl.BottomPadding.md)
- [ControlType](Access.TabControl.ControlType.md)
- [DisplayWhen](Access.TabControl.DisplayWhen.md)
- [Enabled](Access.TabControl.Enabled.md)
- [EventProcPrefix](Access.TabControl.EventProcPrefix.md)
- [FontBold](Access.TabControl.FontBold.md)
- [FontItalic](Access.TabControl.FontItalic.md)
- [FontName](Access.TabControl.FontName.md)
- [FontSize](Access.TabControl.FontSize.md)
- [FontUnderline](Access.TabControl.FontUnderline.md)
- [FontWeight](Access.TabControl.FontWeight.md)
- [ForeColor](Access.TabControl.ForeColor.md)
- [ForeShade](Access.TabControl.ForeShade.md)
- [ForeThemeColorIndex](Access.TabControl.ForeThemeColorIndex.md)
- [ForeTint](Access.TabControl.ForeTint.md)
- [Gradient](Access.TabControl.Gradient.md)
- [GridlineColor](Access.TabControl.GridlineColor.md)
- [GridlineShade](Access.TabControl.GridlineShade.md)
- [GridlineStyleBottom](Access.TabControl.GridlineStyleBottom.md)
- [GridlineStyleLeft](Access.TabControl.GridlineStyleLeft.md)
- [GridlineStyleRight](Access.TabControl.GridlineStyleRight.md)
- [GridlineStyleTop](Access.TabControl.GridlineStyleTop.md)
- [GridlineThemeColorIndex](Access.TabControl.GridlineThemeColorIndex.md)
- [GridlineTint](Access.TabControl.GridlineTint.md)
- [GridlineWidthBottom](Access.TabControl.GridlineWidthBottom.md)
- [GridlineWidthLeft](Access.TabControl.GridlineWidthLeft.md)
- [GridlineWidthRight](Access.TabControl.GridlineWidthRight.md)
- [GridlineWidthTop](Access.TabControl.GridlineWidthTop.md)
- [Height](Access.TabControl.Height.md)
- [HelpContextId](Access.TabControl.HelpContextId.md)
- [HorizontalAnchor](Access.TabControl.HorizontalAnchor.md)
- [HoverColor](Access.TabControl.HoverColor.md)
- [HoverForeColor](Access.TabControl.HoverForeColor.md)
- [HoverForeShade](Access.TabControl.HoverForeShade.md)
- [HoverForeThemeColorIndex](Access.TabControl.HoverForeThemeColorIndex.md)
- [HoverForeTint](Access.TabControl.HoverForeTint.md)
- [HoverShade](Access.TabControl.HoverShade.md)
- [HoverThemeColorIndex](Access.TabControl.HoverThemeColorIndex.md)
- [HoverTint](Access.TabControl.HoverTint.md)
- [InSelection](Access.TabControl.InSelection.md)
- [IsVisible](Access.TabControl.IsVisible.md)
- [Layout](Access.TabControl.Layout.md)
- [LayoutID](Access.TabControl.LayoutID.md)
- [Left](Access.TabControl.Left.md)
- [LeftPadding](Access.TabControl.LeftPadding.md)
- [MultiRow](Access.TabControl.MultiRow.md)
- [Name](Access.TabControl.Name.md)
- [OldValue](Access.TabControl.OldValue.md)
- [OnChange](Access.TabControl.OnChange.md)
- [OnClick](Access.TabControl.OnClick.md)
- [OnDblClick](Access.TabControl.OnDblClick.md)
- [OnKeyDown](Access.TabControl.OnKeyDown.md)
- [OnKeyPress](Access.TabControl.OnKeyPress.md)
- [OnKeyUp](Access.TabControl.OnKeyUp.md)
- [OnMouseDown](Access.TabControl.OnMouseDown.md)
- [OnMouseMove](Access.TabControl.OnMouseMove.md)
- [OnMouseUp](Access.TabControl.OnMouseUp.md)
- [Pages](Access.TabControl.Pages.md)
- [Parent](Access.TabControl.Parent.md)
- [PressedColor](Access.TabControl.PressedColor.md)
- [PressedForeColor](Access.TabControl.PressedForeColor.md)
- [PressedForeShade](Access.TabControl.PressedForeShade.md)
- [PressedForeThemeColorIndex](Access.TabControl.PressedForeThemeColorIndex.md)
- [PressedForeTint](Access.TabControl.PressedForeTint.md)
- [PressedShade](Access.TabControl.PressedShade.md)
- [PressedThemeColorIndex](Access.TabControl.PressedThemeColorIndex.md)
- [PressedTint](Access.TabControl.PressedTint.md)
- [Properties](Access.TabControl.Properties.md)
- [RightPadding](Access.TabControl.RightPadding.md)
- [Section](Access.TabControl.Section.md)
- [Shape](Access.TabControl.Shape.md)
- [ShortcutMenuBar](Access.TabControl.ShortcutMenuBar.md)
- [StatusBarText](Access.TabControl.StatusBarText.md)
- [Style](Access.TabControl.Style.md)
- [TabFixedHeight](Access.TabControl.TabFixedHeight.md)
- [TabFixedWidth](Access.TabControl.TabFixedWidth.md)
- [TabIndex](Access.TabControl.TabIndex.md)
- [TabStop](Access.TabControl.TabStop.md)
- [Tag](Access.TabControl.Tag.md)
- [ThemeFontIndex](Access.TabControl.ThemeFontIndex.md)
- [Top](Access.TabControl.Top.md)
- [TopPadding](Access.TabControl.TopPadding.md)
- [UseTheme](Access.TabControl.UseTheme.md)
- [Value](Access.TabControl.Value.md)
- [VerticalAnchor](Access.TabControl.VerticalAnchor.md)
- [Visible](Access.TabControl.Visible.md)
- [Width](Access.TabControl.Width.md)
## See also
- [Access Object Model Reference](overview/Access/object-model.md)

[!include[Support and feedback](~/includes/feedback-boilerplate.md)]


### Methods
#### JinTabControl>>acceptVisitor: aVisitor
Accepts visitor



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


### Methods
#### JinTextbox>>acceptVisitor: aVisitor
Accepts visitor



