"
I am here to abstract the methods that are part of many elements, but are not particularly interesting for my only subclass.
"
Class {
	#name : #JinControlAbstractListBox,
	#superclass : #JinControlGenerated,
	#category : #'Jindao-FormControls-Generated-Abstract'
}

{ #category : #'method - generated' }
JinControlAbstractListBox >> _Evaluate: aBstrExpr ppsa: aPpsa [
<method>

	^ (handle dispatch: #'_Evaluate' withArguments: {aBstrExpr . aPpsa} ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> _Name [
<getter>
	^ (handle propertyNamed: #'_Name' ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> _Name: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'_Name' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> accChild: aVarChild [
<getter>

	^ (handle propertyNamed: #'accChild' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> accChildCount [
<getter>
	^ (handle propertyNamed: #'accChildCount' ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> accDefaultAction: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accDefaultAction' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> accDescription: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accDescription' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractListBox >> accDoDefaultAction: aVarChild [
<method>
"This method can be called with optional parameters. varChild"
	^ (handle dispatch: #'accDoDefaultAction' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> accFocus [
<getter>
	^ (handle propertyNamed: #'accFocus' ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> accHelp: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accHelp' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> accHelpTopic: aPszHelpFile varChild: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accHelpTopic' withArguments: {aPszHelpFile . aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractListBox >> accHitTest: aXLeft yTop: aYTop [
<method>

	^ (handle dispatch: #'accHitTest' withArguments: {aXLeft . aYTop} ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> accKeyboardShortcut: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accKeyboardShortcut' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractListBox >> accLocation: aPxLeft pyTop: aPyTop pcxWidth: aPcxWidth pcyHeight: aPcyHeight varChild: aVarChild [
<method>
"This method can be called with optional parameters. varChild"
	^ (handle dispatch: #'accLocation' withArguments: {aPxLeft . aPyTop . aPcxWidth . aPcyHeight . aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> accName: aVarChild [
<setter>
		"This method can be called with optional parameters. aParam1"
	^ (handle propertyNamed: #'accName' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractListBox >> accNavigate: aNavDir varStart: aVarStart [
<method>
"This method can be called with optional parameters. varStart"
	^ (handle dispatch: #'accNavigate' withArguments: {aNavDir . aVarStart} ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> accParent [
<getter>
	^ (handle propertyNamed: #'accParent' ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> accRole: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accRole' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractListBox >> accSelect: aFlagsSelect varChild: aVarChild [
<method>
"This method can be called with optional parameters. varChild"
	^ (handle dispatch: #'accSelect' withArguments: {aFlagsSelect . aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> accSelection [
<getter>
	^ (handle propertyNamed: #'accSelection' ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> accState: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accState' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> accValue: aVarChild [
<setter>
		"This method can be called with optional parameters. aParam1"
	^ (handle propertyNamed: #'accValue' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractListBox >> addRef [
<method>
	^ (handle dispatch: #'AddRef' ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> afterUpdate [
<getter>
	^ (handle propertyNamed: #'AfterUpdate' ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> afterUpdate: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AfterUpdate' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> afterUpdateMacro [
<getter>
	^ (handle propertyNamed: #'AfterUpdateMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> afterUpdateMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AfterUpdateMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> beforeUpdate [
<getter>
	^ (handle propertyNamed: #'BeforeUpdate' ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> beforeUpdate: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BeforeUpdate' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> beforeUpdateMacro [
<getter>
	^ (handle propertyNamed: #'BeforeUpdateMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> beforeUpdateMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BeforeUpdateMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> borderLineStyle [
<getter>
	^ (handle propertyNamed: #'BorderLineStyle' ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> borderLineStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderLineStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> controlName [
<getter>
	^ (handle propertyNamed: #'ControlName' ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> controlName: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlName' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlAbstractListBox >> getIDsOfNames: aRiid rgszNames: aRgszNames cNames: aCNames lcid: aLcid rgdispid: aRgdispid [
<method>

	^ (handle dispatch: #'GetIDsOfNames' withArguments: {aRiid . aRgszNames . aCNames . aLcid . aRgdispid} ).

]

{ #category : #'method - generated' }
JinControlAbstractListBox >> getTypeInfo: aItinfo lcid: aLcid pptinfo: aPptinfo [
<method>

	^ (handle dispatch: #'GetTypeInfo' withArguments: {aItinfo . aLcid . aPptinfo} ).

]

{ #category : #'method - generated' }
JinControlAbstractListBox >> getTypeInfoCount: aPctinfo [
<method>

	^ (handle dispatch: #'GetTypeInfoCount' withArguments: {aPctinfo} ).

]

{ #category : #'method - generated' }
JinControlAbstractListBox >> goto [
<method>
	^ (handle dispatch: #'Goto' ).

]

{ #category : #'method - generated' }
JinControlAbstractListBox >> invoke: aDispidMember riid: aRiid lcid: aLcid wFlags: aWFlags pdispparams: aPdispparams pvarResult: aPvarResult pexcepinfo: aPexcepinfo puArgErr: aPuArgErr [
<method>

	^ (handle dispatch: #'Invoke' withArguments: {aDispidMember . aRiid . aLcid . aWFlags . aPdispparams . aPvarResult . aPexcepinfo . aPuArgErr} ).

]

{ #category : #'method - generated' }
JinControlAbstractListBox >> isMemberSafe: aDispid [
<method>

	^ (handle dispatch: #'IsMemberSafe' withArguments: {aDispid} ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> onClickMacro [
<getter>
	^ (handle propertyNamed: #'OnClickMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> onClickMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnClickMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> onDblClickMacro [
<getter>
	^ (handle propertyNamed: #'OnDblClickMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> onDblClickMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnDblClickMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> onEnterMacro [
<getter>
	^ (handle propertyNamed: #'OnEnterMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> onEnterMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnEnterMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> onExitMacro [
<getter>
	^ (handle propertyNamed: #'OnExitMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> onExitMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnExitMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> onGotFocusMacro [
<getter>
	^ (handle propertyNamed: #'OnGotFocusMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> onGotFocusMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnGotFocusMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> onKeyDownMacro [
<getter>
	^ (handle propertyNamed: #'OnKeyDownMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> onKeyDownMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyDownMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> onKeyPressMacro [
<getter>
	^ (handle propertyNamed: #'OnKeyPressMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> onKeyPressMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyPressMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> onKeyUpMacro [
<getter>
	^ (handle propertyNamed: #'OnKeyUpMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> onKeyUpMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyUpMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> onLostFocusMacro [
<getter>
	^ (handle propertyNamed: #'OnLostFocusMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> onLostFocusMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnLostFocusMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> onMouseDownMacro [
<getter>
	^ (handle propertyNamed: #'OnMouseDownMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> onMouseDownMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseDownMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> onMouseMoveMacro [
<getter>
	^ (handle propertyNamed: #'OnMouseMoveMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> onMouseMoveMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseMoveMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> onMouseUpMacro [
<getter>
	^ (handle propertyNamed: #'OnMouseUpMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> onMouseUpMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseUpMacro' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlAbstractListBox >> queryInterface: aRiid ppvObj: aPpvObj [
<method>

	^ (handle dispatch: #'QueryInterface' withArguments: {aRiid . aPpvObj} ).

]

{ #category : #'method - generated' }
JinControlAbstractListBox >> release [
<method>
	^ (handle dispatch: #'Release' ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> textAlign [
<getter>
	^ (handle propertyNamed: #'TextAlign' ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> textAlign: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TextAlign' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> textFontCharSet [
<getter>
	^ (handle propertyNamed: #'TextFontCharSet' ).

]

{ #category : #'property - generated' }
JinControlAbstractListBox >> textFontCharSet: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TextFontCharSet' withArguments: {aParam1} ).

]
