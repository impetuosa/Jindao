"
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
|**Pages**(""_pagename_"")|The _pagename_ argument is the name of the **Page** object.|
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
"
Class {
	#name : #JinControlPage,
	#superclass : #JinControlAbstractPage,
	#category : #'Jindao-DomainObjects-GeneratedControls'
}

{ #category : #generated }
JinControlPage class >> mappedTypeName [
	^#'_Page'
]

{ #category : #generated }
JinControlPage >> acceptVisitor: aVisitor [
	^ aVisitor visitPage: self
]

{ #category : #'property - generated' }
JinControlPage >> application [
<getter>
	^ (handle propertyNamed: #'Application' ).

]

{ #category : #'property - generated' }
JinControlPage >> caption [
<getter>
	^ (handle propertyNamed: #'Caption' ).

]

{ #category : #'property - generated' }
JinControlPage >> caption: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Caption' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlPage >> controlTipText [
<getter>
	^ (handle propertyNamed: #'ControlTipText' ).

]

{ #category : #'property - generated' }
JinControlPage >> controlTipText: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlTipText' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlPage >> controlType [
<getter>
	^ (handle propertyNamed: #'ControlType' ).

]

{ #category : #'property - generated' }
JinControlPage >> controlType: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlType' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlPage >> controls [
<getter>
	^ (handle propertyNamed: #'Controls' ).

]

{ #category : #'property - generated' }
JinControlPage >> enabled [
<getter>
	^ (handle propertyNamed: #'Enabled' ).

]

{ #category : #'property - generated' }
JinControlPage >> enabled: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Enabled' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlPage >> eventProcPrefix [
<getter>
	^ (handle propertyNamed: #'EventProcPrefix' ).

]

{ #category : #'property - generated' }
JinControlPage >> eventProcPrefix: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'EventProcPrefix' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlPage >> height [
<getter>
	^ (handle propertyNamed: #'Height' ).

]

{ #category : #'property - generated' }
JinControlPage >> height: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Height' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlPage >> helpContextId [
<getter>
	^ (handle propertyNamed: #'HelpContextId' ).

]

{ #category : #'property - generated' }
JinControlPage >> helpContextId: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'HelpContextId' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlPage >> inSelection [
<getter>
	^ (handle propertyNamed: #'InSelection' ).

]

{ #category : #'property - generated' }
JinControlPage >> inSelection: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'InSelection' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlPage >> isVisible [
<getter>
	^ (handle propertyNamed: #'IsVisible' ).

]

{ #category : #'property - generated' }
JinControlPage >> isVisible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'IsVisible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlPage >> left [
<getter>
	^ (handle propertyNamed: #'Left' ).

]

{ #category : #'property - generated' }
JinControlPage >> left: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Left' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlPage >> move: aLeft top: aTop width: aWidth height: aHeight [
<method>
"This method can be called with optional parameters. Top,Width,Height"
	^ (handle dispatch: #'Move' withArguments: {aLeft . aTop . aWidth . aHeight} ).

]

{ #category : #'property - generated' }
JinControlPage >> name [
<getter>
	^ (handle propertyNamed: #'Name' ).

]

{ #category : #'property - generated' }
JinControlPage >> name: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Name' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlPage >> onClick [
<getter>
	^ (handle propertyNamed: #'OnClick' ).

]

{ #category : #'property - generated' }
JinControlPage >> onClick: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnClick' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlPage >> onDblClick [
<getter>
	^ (handle propertyNamed: #'OnDblClick' ).

]

{ #category : #'property - generated' }
JinControlPage >> onDblClick: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnDblClick' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlPage >> onMouseDown [
<getter>
	^ (handle propertyNamed: #'OnMouseDown' ).

]

{ #category : #'property - generated' }
JinControlPage >> onMouseDown: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseDown' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlPage >> onMouseMove [
<getter>
	^ (handle propertyNamed: #'OnMouseMove' ).

]

{ #category : #'property - generated' }
JinControlPage >> onMouseMove: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseMove' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlPage >> onMouseUp [
<getter>
	^ (handle propertyNamed: #'OnMouseUp' ).

]

{ #category : #'property - generated' }
JinControlPage >> onMouseUp: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseUp' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlPage >> pageIndex [
<getter>
	^ (handle propertyNamed: #'PageIndex' ).

]

{ #category : #'property - generated' }
JinControlPage >> pageIndex: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'PageIndex' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlPage >> parent [
<getter>
	^ (handle propertyNamed: #'Parent' ).

]

{ #category : #'property - generated' }
JinControlPage >> picture [
<getter>
	^ (handle propertyNamed: #'Picture' ).

]

{ #category : #'property - generated' }
JinControlPage >> picture: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Picture' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlPage >> pictureData [
<getter>
	^ (handle propertyNamed: #'PictureData' ).

]

{ #category : #'property - generated' }
JinControlPage >> pictureData: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'PictureData' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlPage >> pictureType [
<getter>
	^ (handle propertyNamed: #'PictureType' ).

]

{ #category : #'property - generated' }
JinControlPage >> pictureType: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'PictureType' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlPage >> properties [
<getter>
	^ (handle propertyNamed: #'Properties' ).

]

{ #category : #'method - generated' }
JinControlPage >> requery [
<method>
	^ (handle dispatch: #'Requery' ).

]

{ #category : #'property - generated' }
JinControlPage >> section [
<getter>
	^ (handle propertyNamed: #'Section' ).

]

{ #category : #'property - generated' }
JinControlPage >> section: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Section' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlPage >> setFocus [
<method>
	^ (handle dispatch: #'SetFocus' ).

]

{ #category : #'method - generated' }
JinControlPage >> setTabOrder [
<method>
	^ (handle dispatch: #'SetTabOrder' ).

]

{ #category : #'property - generated' }
JinControlPage >> shortcutMenuBar [
<getter>
	^ (handle propertyNamed: #'ShortcutMenuBar' ).

]

{ #category : #'property - generated' }
JinControlPage >> shortcutMenuBar: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ShortcutMenuBar' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlPage >> sizeToFit [
<method>
	^ (handle dispatch: #'SizeToFit' ).

]

{ #category : #'property - generated' }
JinControlPage >> statusBarText [
<getter>
	^ (handle propertyNamed: #'StatusBarText' ).

]

{ #category : #'property - generated' }
JinControlPage >> statusBarText: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'StatusBarText' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlPage >> tag [
<getter>
	^ (handle propertyNamed: #'Tag' ).

]

{ #category : #'property - generated' }
JinControlPage >> tag: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Tag' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlPage >> top [
<getter>
	^ (handle propertyNamed: #'Top' ).

]

{ #category : #'property - generated' }
JinControlPage >> top: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Top' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlPage >> visible [
<getter>
	^ (handle propertyNamed: #'Visible' ).

]

{ #category : #'property - generated' }
JinControlPage >> visible: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Visible' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlPage >> width [
<getter>
	^ (handle propertyNamed: #'Width' ).

]

{ #category : #'property - generated' }
JinControlPage >> width: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Width' withArguments: {aParam1} ).

]
