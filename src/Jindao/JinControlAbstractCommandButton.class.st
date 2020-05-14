"
I am here to abstract the methods that are part of many elements, but are not particularly interesting for my only subclass.
"
Class {
	#name : #JinControlAbstractCommandButton,
	#superclass : #JinControlGenerated,
	#category : #'Jindao-DomainObjects-GeneratedControls-Abstract'
}

{ #category : #'method - generated' }
JinControlAbstractCommandButton >> _Evaluate: aBstrExpr ppsa: aPpsa [
<method>

	^ (handle dispatch: #'_Evaluate' withArguments: {aBstrExpr . aPpsa} ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> _Name [
<getter>
	^ (handle propertyNamed: #'_Name' ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> _Name: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'_Name' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> accChild: aVarChild [
<getter>

	^ (handle propertyNamed: #'accChild' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> accChildCount [
<getter>
	^ (handle propertyNamed: #'accChildCount' ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> accDefaultAction: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accDefaultAction' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> accDescription: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accDescription' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractCommandButton >> accDoDefaultAction: aVarChild [
<method>
"This method can be called with optional parameters. varChild"
	^ (handle dispatch: #'accDoDefaultAction' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> accFocus [
<getter>
	^ (handle propertyNamed: #'accFocus' ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> accHelp: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accHelp' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> accHelpTopic: aPszHelpFile varChild: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accHelpTopic' withArguments: {aPszHelpFile . aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractCommandButton >> accHitTest: aXLeft yTop: aYTop [
<method>

	^ (handle dispatch: #'accHitTest' withArguments: {aXLeft . aYTop} ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> accKeyboardShortcut: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accKeyboardShortcut' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractCommandButton >> accLocation: aPxLeft pyTop: aPyTop pcxWidth: aPcxWidth pcyHeight: aPcyHeight varChild: aVarChild [
<method>
"This method can be called with optional parameters. varChild"
	^ (handle dispatch: #'accLocation' withArguments: {aPxLeft . aPyTop . aPcxWidth . aPcyHeight . aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> accName: aVarChild [
<setter>
		"This method can be called with optional parameters. aParam1"
	^ (handle propertyNamed: #'accName' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractCommandButton >> accNavigate: aNavDir varStart: aVarStart [
<method>
"This method can be called with optional parameters. varStart"
	^ (handle dispatch: #'accNavigate' withArguments: {aNavDir . aVarStart} ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> accParent [
<getter>
	^ (handle propertyNamed: #'accParent' ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> accRole: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accRole' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractCommandButton >> accSelect: aFlagsSelect varChild: aVarChild [
<method>
"This method can be called with optional parameters. varChild"
	^ (handle dispatch: #'accSelect' withArguments: {aFlagsSelect . aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> accSelection [
<getter>
	^ (handle propertyNamed: #'accSelection' ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> accState: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accState' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> accValue: aVarChild [
<setter>
		"This method can be called with optional parameters. aParam1"
	^ (handle propertyNamed: #'accValue' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractCommandButton >> addRef [
<method>
	^ (handle dispatch: #'AddRef' ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> afterUpdateMacro [
<getter>
	^ (handle propertyNamed: #'AfterUpdateMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> afterUpdateMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AfterUpdateMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> beforeUpdateMacro [
<getter>
	^ (handle propertyNamed: #'BeforeUpdateMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> beforeUpdateMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BeforeUpdateMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> controlName [
<getter>
	^ (handle propertyNamed: #'ControlName' ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> controlName: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlName' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlAbstractCommandButton >> getIDsOfNames: aRiid rgszNames: aRgszNames cNames: aCNames lcid: aLcid rgdispid: aRgdispid [
<method>

	^ (handle dispatch: #'GetIDsOfNames' withArguments: {aRiid . aRgszNames . aCNames . aLcid . aRgdispid} ).

]

{ #category : #'method - generated' }
JinControlAbstractCommandButton >> getTypeInfo: aItinfo lcid: aLcid pptinfo: aPptinfo [
<method>

	^ (handle dispatch: #'GetTypeInfo' withArguments: {aItinfo . aLcid . aPptinfo} ).

]

{ #category : #'method - generated' }
JinControlAbstractCommandButton >> getTypeInfoCount: aPctinfo [
<method>

	^ (handle dispatch: #'GetTypeInfoCount' withArguments: {aPctinfo} ).

]

{ #category : #'method - generated' }
JinControlAbstractCommandButton >> goto [
<method>
	^ (handle dispatch: #'Goto' ).

]

{ #category : #'method - generated' }
JinControlAbstractCommandButton >> invoke: aDispidMember riid: aRiid lcid: aLcid wFlags: aWFlags pdispparams: aPdispparams pvarResult: aPvarResult pexcepinfo: aPexcepinfo puArgErr: aPuArgErr [
<method>

	^ (handle dispatch: #'Invoke' withArguments: {aDispidMember . aRiid . aLcid . aWFlags . aPdispparams . aPvarResult . aPexcepinfo . aPuArgErr} ).

]

{ #category : #'method - generated' }
JinControlAbstractCommandButton >> isMemberSafe: aDispid [
<method>

	^ (handle dispatch: #'IsMemberSafe' withArguments: {aDispid} ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> onClickMacro [
<getter>
	^ (handle propertyNamed: #'OnClickMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> onClickMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnClickMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> onDblClickMacro [
<getter>
	^ (handle propertyNamed: #'OnDblClickMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> onDblClickMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnDblClickMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> onEnterMacro [
<getter>
	^ (handle propertyNamed: #'OnEnterMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> onEnterMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnEnterMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> onExitMacro [
<getter>
	^ (handle propertyNamed: #'OnExitMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> onExitMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnExitMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> onGotFocusMacro [
<getter>
	^ (handle propertyNamed: #'OnGotFocusMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> onGotFocusMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnGotFocusMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> onKeyDownMacro [
<getter>
	^ (handle propertyNamed: #'OnKeyDownMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> onKeyDownMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyDownMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> onKeyPressMacro [
<getter>
	^ (handle propertyNamed: #'OnKeyPressMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> onKeyPressMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyPressMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> onKeyUpMacro [
<getter>
	^ (handle propertyNamed: #'OnKeyUpMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> onKeyUpMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyUpMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> onLostFocusMacro [
<getter>
	^ (handle propertyNamed: #'OnLostFocusMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> onLostFocusMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnLostFocusMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> onMouseDownMacro [
<getter>
	^ (handle propertyNamed: #'OnMouseDownMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> onMouseDownMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseDownMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> onMouseMoveMacro [
<getter>
	^ (handle propertyNamed: #'OnMouseMoveMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> onMouseMoveMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseMoveMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> onMouseUpMacro [
<getter>
	^ (handle propertyNamed: #'OnMouseUpMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> onMouseUpMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseUpMacro' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlAbstractCommandButton >> queryInterface: aRiid ppvObj: aPpvObj [
<method>

	^ (handle dispatch: #'QueryInterface' withArguments: {aRiid . aPpvObj} ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> quickStyleMask [
<getter>
	^ (handle propertyNamed: #'QuickStyleMask' ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> quickStyleMask: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'QuickStyleMask' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlAbstractCommandButton >> release [
<method>
	^ (handle dispatch: #'Release' ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> target [
<getter>
	^ (handle propertyNamed: #'Target' ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> target: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Target' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> textFontCharSet [
<getter>
	^ (handle propertyNamed: #'TextFontCharSet' ).

]

{ #category : #'property - generated' }
JinControlAbstractCommandButton >> textFontCharSet: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TextFontCharSet' withArguments: {aParam1} ).

]
