"
I am here to abstract the methods that are part of many elements, but are not particularly interesting for my only subclass.
"
Class {
	#name : #JinControlAbstractCheckbox,
	#superclass : #JinControlGenerated,
	#category : #'Jindao-FormControls-BuiltIn-Abstract'
}

{ #category : #'method - generated' }
JinControlAbstractCheckbox >> _Evaluate: aBstrExpr ppsa: aPpsa [
<method>

	^ (handle dispatch: #'_Evaluate' withArguments: {aBstrExpr . aPpsa} ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> _Name [
<getter>
	^ (handle propertyNamed: #'_Name' ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> _Name: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'_Name' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> accChild: aVarChild [
<getter>

	^ (handle propertyNamed: #'accChild' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> accChildCount [
<getter>
	^ (handle propertyNamed: #'accChildCount' ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> accDefaultAction: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accDefaultAction' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> accDescription: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accDescription' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractCheckbox >> accDoDefaultAction: aVarChild [
<method>
"This method can be called with optional parameters. varChild"
	^ (handle dispatch: #'accDoDefaultAction' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> accFocus [
<getter>
	^ (handle propertyNamed: #'accFocus' ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> accHelp: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accHelp' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> accHelpTopic: aPszHelpFile varChild: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accHelpTopic' withArguments: {aPszHelpFile . aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractCheckbox >> accHitTest: aXLeft yTop: aYTop [
<method>

	^ (handle dispatch: #'accHitTest' withArguments: {aXLeft . aYTop} ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> accKeyboardShortcut: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accKeyboardShortcut' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractCheckbox >> accLocation: aPxLeft pyTop: aPyTop pcxWidth: aPcxWidth pcyHeight: aPcyHeight varChild: aVarChild [
<method>
"This method can be called with optional parameters. varChild"
	^ (handle dispatch: #'accLocation' withArguments: {aPxLeft . aPyTop . aPcxWidth . aPcyHeight . aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> accName: aVarChild [
<setter>
		"This method can be called with optional parameters. aParam1"
	^ (handle propertyNamed: #'accName' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractCheckbox >> accNavigate: aNavDir varStart: aVarStart [
<method>
"This method can be called with optional parameters. varStart"
	^ (handle dispatch: #'accNavigate' withArguments: {aNavDir . aVarStart} ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> accParent [
<getter>
	^ (handle propertyNamed: #'accParent' ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> accRole: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accRole' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractCheckbox >> accSelect: aFlagsSelect varChild: aVarChild [
<method>
"This method can be called with optional parameters. varChild"
	^ (handle dispatch: #'accSelect' withArguments: {aFlagsSelect . aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> accSelection [
<getter>
	^ (handle propertyNamed: #'accSelection' ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> accState: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accState' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> accValue: aVarChild [
<setter>
		"This method can be called with optional parameters. aParam1"
	^ (handle propertyNamed: #'accValue' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractCheckbox >> addRef [
<method>
	^ (handle dispatch: #'AddRef' ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> afterUpdate [
<getter>
	^ (handle propertyNamed: #'AfterUpdate' ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> afterUpdate: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AfterUpdate' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> afterUpdateMacro [
<getter>
	^ (handle propertyNamed: #'AfterUpdateMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> afterUpdateMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AfterUpdateMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> beforeUpdate [
<getter>
	^ (handle propertyNamed: #'BeforeUpdate' ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> beforeUpdate: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BeforeUpdate' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> beforeUpdateMacro [
<getter>
	^ (handle propertyNamed: #'BeforeUpdateMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> beforeUpdateMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BeforeUpdateMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> borderLineStyle [
<getter>
	^ (handle propertyNamed: #'BorderLineStyle' ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> borderLineStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderLineStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> controlName [
<getter>
	^ (handle propertyNamed: #'ControlName' ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> controlName: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlName' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlAbstractCheckbox >> getIDsOfNames: aRiid rgszNames: aRgszNames cNames: aCNames lcid: aLcid rgdispid: aRgdispid [
<method>

	^ (handle dispatch: #'GetIDsOfNames' withArguments: {aRiid . aRgszNames . aCNames . aLcid . aRgdispid} ).

]

{ #category : #'method - generated' }
JinControlAbstractCheckbox >> getTypeInfo: aItinfo lcid: aLcid pptinfo: aPptinfo [
<method>

	^ (handle dispatch: #'GetTypeInfo' withArguments: {aItinfo . aLcid . aPptinfo} ).

]

{ #category : #'method - generated' }
JinControlAbstractCheckbox >> getTypeInfoCount: aPctinfo [
<method>

	^ (handle dispatch: #'GetTypeInfoCount' withArguments: {aPctinfo} ).

]

{ #category : #'method - generated' }
JinControlAbstractCheckbox >> goto [
<method>
	^ (handle dispatch: #'Goto' ).

]

{ #category : #'method - generated' }
JinControlAbstractCheckbox >> invoke: aDispidMember riid: aRiid lcid: aLcid wFlags: aWFlags pdispparams: aPdispparams pvarResult: aPvarResult pexcepinfo: aPexcepinfo puArgErr: aPuArgErr [
<method>

	^ (handle dispatch: #'Invoke' withArguments: {aDispidMember . aRiid . aLcid . aWFlags . aPdispparams . aPvarResult . aPexcepinfo . aPuArgErr} ).

]

{ #category : #'method - generated' }
JinControlAbstractCheckbox >> isMemberSafe: aDispid [
<method>

	^ (handle dispatch: #'IsMemberSafe' withArguments: {aDispid} ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> onClickMacro [
<getter>
	^ (handle propertyNamed: #'OnClickMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> onClickMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnClickMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> onDblClickMacro [
<getter>
	^ (handle propertyNamed: #'OnDblClickMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> onDblClickMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnDblClickMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> onEnterMacro [
<getter>
	^ (handle propertyNamed: #'OnEnterMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> onEnterMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnEnterMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> onExitMacro [
<getter>
	^ (handle propertyNamed: #'OnExitMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> onExitMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnExitMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> onGotFocusMacro [
<getter>
	^ (handle propertyNamed: #'OnGotFocusMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> onGotFocusMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnGotFocusMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> onKeyDownMacro [
<getter>
	^ (handle propertyNamed: #'OnKeyDownMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> onKeyDownMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyDownMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> onKeyPressMacro [
<getter>
	^ (handle propertyNamed: #'OnKeyPressMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> onKeyPressMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyPressMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> onKeyUpMacro [
<getter>
	^ (handle propertyNamed: #'OnKeyUpMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> onKeyUpMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyUpMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> onLostFocusMacro [
<getter>
	^ (handle propertyNamed: #'OnLostFocusMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> onLostFocusMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnLostFocusMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> onMouseDownMacro [
<getter>
	^ (handle propertyNamed: #'OnMouseDownMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> onMouseDownMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseDownMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> onMouseMoveMacro [
<getter>
	^ (handle propertyNamed: #'OnMouseMoveMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> onMouseMoveMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseMoveMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> onMouseUpMacro [
<getter>
	^ (handle propertyNamed: #'OnMouseUpMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractCheckbox >> onMouseUpMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseUpMacro' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlAbstractCheckbox >> queryInterface: aRiid ppvObj: aPpvObj [
<method>

	^ (handle dispatch: #'QueryInterface' withArguments: {aRiid . aPpvObj} ).

]

{ #category : #'method - generated' }
JinControlAbstractCheckbox >> release [
<method>
	^ (handle dispatch: #'Release' ).

]
