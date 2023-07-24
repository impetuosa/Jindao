"
I am here to abstract the methods that are part of many elements, but are not particularly interesting for my only subclass.
"
Class {
	#name : #JinControlAbstractAttachment,
	#superclass : #JinControlGenerated,
	#category : #'Jindao-MSAccess-Widgets-Builtin-Controls-Abstract'
}

{ #category : #'method - generated' }
JinControlAbstractAttachment >> _Evaluate: aBstrExpr ppsa: aPpsa [
<method>

	^ (handle dispatch: #'_Evaluate' withArguments: {aBstrExpr . aPpsa} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> _Name [
<getter>
	^ (handle propertyNamed: #'_Name' ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> _Name: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'_Name' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> accChild: aVarChild [
<getter>

	^ (handle propertyNamed: #'accChild' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> accChildCount [
<getter>
	^ (handle propertyNamed: #'accChildCount' ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> accDefaultAction: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accDefaultAction' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> accDescription: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accDescription' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractAttachment >> accDoDefaultAction: aVarChild [
<method>
"This method can be called with optional parameters. varChild"
	^ (handle dispatch: #'accDoDefaultAction' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> accFocus [
<getter>
	^ (handle propertyNamed: #'accFocus' ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> accHelp: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accHelp' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> accHelpTopic: aPszHelpFile varChild: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accHelpTopic' withArguments: {aPszHelpFile . aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractAttachment >> accHitTest: aXLeft yTop: aYTop [
<method>

	^ (handle dispatch: #'accHitTest' withArguments: {aXLeft . aYTop} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> accKeyboardShortcut: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accKeyboardShortcut' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractAttachment >> accLocation: aPxLeft pyTop: aPyTop pcxWidth: aPcxWidth pcyHeight: aPcyHeight varChild: aVarChild [
<method>
"This method can be called with optional parameters. varChild"
	^ (handle dispatch: #'accLocation' withArguments: {aPxLeft . aPyTop . aPcxWidth . aPcyHeight . aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> accName: aVarChild [
<setter>
		"This method can be called with optional parameters. aParam1"
	^ (handle propertyNamed: #'accName' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractAttachment >> accNavigate: aNavDir varStart: aVarStart [
<method>
"This method can be called with optional parameters. varStart"
	^ (handle dispatch: #'accNavigate' withArguments: {aNavDir . aVarStart} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> accParent [
<getter>
	^ (handle propertyNamed: #'accParent' ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> accRole: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accRole' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractAttachment >> accSelect: aFlagsSelect varChild: aVarChild [
<method>
"This method can be called with optional parameters. varChild"
	^ (handle dispatch: #'accSelect' withArguments: {aFlagsSelect . aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> accSelection [
<getter>
	^ (handle propertyNamed: #'accSelection' ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> accState: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accState' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> accValue: aVarChild [
<setter>
		"This method can be called with optional parameters. aParam1"
	^ (handle propertyNamed: #'accValue' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractAttachment >> addRef [
<method>
	^ (handle dispatch: #'AddRef' ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> afterUpdate [
<getter>
	^ (handle propertyNamed: #'AfterUpdate' ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> afterUpdate: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AfterUpdate' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> afterUpdateMacro [
<getter>
	^ (handle propertyNamed: #'AfterUpdateMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> afterUpdateMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AfterUpdateMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> beforeUpdate [
<getter>
	^ (handle propertyNamed: #'BeforeUpdate' ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> beforeUpdate: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BeforeUpdate' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> beforeUpdateMacro [
<getter>
	^ (handle propertyNamed: #'BeforeUpdateMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> beforeUpdateMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BeforeUpdateMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> borderLineStyle [
<getter>
	^ (handle propertyNamed: #'BorderLineStyle' ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> borderLineStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderLineStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> controlName [
<getter>
	^ (handle propertyNamed: #'ControlName' ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> controlName: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlName' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> fileData: aVar [
<getter>
"This method can be called with optional parameters. var"
	^ (handle propertyNamed: #'FileData' withArguments: {aVar} ).

]

{ #category : #'method - generated' }
JinControlAbstractAttachment >> getIDsOfNames: aRiid rgszNames: aRgszNames cNames: aCNames lcid: aLcid rgdispid: aRgdispid [
<method>

	^ (handle dispatch: #'GetIDsOfNames' withArguments: {aRiid . aRgszNames . aCNames . aLcid . aRgdispid} ).

]

{ #category : #'method - generated' }
JinControlAbstractAttachment >> getTypeInfo: aItinfo lcid: aLcid pptinfo: aPptinfo [
<method>

	^ (handle dispatch: #'GetTypeInfo' withArguments: {aItinfo . aLcid . aPptinfo} ).

]

{ #category : #'method - generated' }
JinControlAbstractAttachment >> getTypeInfoCount: aPctinfo [
<method>

	^ (handle dispatch: #'GetTypeInfoCount' withArguments: {aPctinfo} ).

]

{ #category : #'method - generated' }
JinControlAbstractAttachment >> goto [
<method>
	^ (handle dispatch: #'Goto' ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> hyperlink [
<getter>
	^ (handle propertyNamed: #'Hyperlink' ).

]

{ #category : #'method - generated' }
JinControlAbstractAttachment >> invoke: aDispidMember riid: aRiid lcid: aLcid wFlags: aWFlags pdispparams: aPdispparams pvarResult: aPvarResult pexcepinfo: aPexcepinfo puArgErr: aPuArgErr [
<method>

	^ (handle dispatch: #'Invoke' withArguments: {aDispidMember . aRiid . aLcid . aWFlags . aPdispparams . aPvarResult . aPexcepinfo . aPuArgErr} ).

]

{ #category : #'method - generated' }
JinControlAbstractAttachment >> isMemberSafe: aDispid [
<method>

	^ (handle dispatch: #'IsMemberSafe' withArguments: {aDispid} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onAttachmentCurrentMacro [
<getter>
	^ (handle propertyNamed: #'OnAttachmentCurrentMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onAttachmentCurrentMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnAttachmentCurrentMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onChangeMacro [
<getter>
	^ (handle propertyNamed: #'OnChangeMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onChangeMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnChangeMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onClickMacro [
<getter>
	^ (handle propertyNamed: #'OnClickMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onClickMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnClickMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onDblClickMacro [
<getter>
	^ (handle propertyNamed: #'OnDblClickMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onDblClickMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnDblClickMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onDirtyMacro [
<getter>
	^ (handle propertyNamed: #'OnDirtyMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onDirtyMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnDirtyMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onEnterMacro [
<getter>
	^ (handle propertyNamed: #'OnEnterMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onEnterMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnEnterMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onExitMacro [
<getter>
	^ (handle propertyNamed: #'OnExitMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onExitMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnExitMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onGotFocusMacro [
<getter>
	^ (handle propertyNamed: #'OnGotFocusMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onGotFocusMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnGotFocusMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onKeyDownMacro [
<getter>
	^ (handle propertyNamed: #'OnKeyDownMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onKeyDownMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyDownMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onKeyPressMacro [
<getter>
	^ (handle propertyNamed: #'OnKeyPressMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onKeyPressMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyPressMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onKeyUpMacro [
<getter>
	^ (handle propertyNamed: #'OnKeyUpMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onKeyUpMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyUpMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onLostFocusMacro [
<getter>
	^ (handle propertyNamed: #'OnLostFocusMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onLostFocusMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnLostFocusMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onMouseDownMacro [
<getter>
	^ (handle propertyNamed: #'OnMouseDownMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onMouseDownMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseDownMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onMouseMoveMacro [
<getter>
	^ (handle propertyNamed: #'OnMouseMoveMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onMouseMoveMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseMoveMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onMouseUpMacro [
<getter>
	^ (handle propertyNamed: #'OnMouseUpMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> onMouseUpMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseUpMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractAttachment >> pictureDisp: aVar [
<getter>
"This method can be called with optional parameters. var"
	^ (handle propertyNamed: #'PictureDisp' withArguments: {aVar} ).

]

{ #category : #'method - generated' }
JinControlAbstractAttachment >> queryInterface: aRiid ppvObj: aPpvObj [
<method>

	^ (handle dispatch: #'QueryInterface' withArguments: {aRiid . aPpvObj} ).

]

{ #category : #'method - generated' }
JinControlAbstractAttachment >> release [
<method>
	^ (handle dispatch: #'Release' ).

]
