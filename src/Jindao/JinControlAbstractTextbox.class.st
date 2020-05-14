"
I am here to abstract the methods that are part of many elements, but are not particularly interesting for my only subclass.
"
Class {
	#name : #JinControlAbstractTextbox,
	#superclass : #JinControlGenerated,
	#category : #'Jindao-DomainObjects-GeneratedControls-Abstract'
}

{ #category : #'method - generated' }
JinControlAbstractTextbox >> _Evaluate: aBstrExpr ppsa: aPpsa [
<method>

	^ (handle dispatch: #'_Evaluate' withArguments: {aBstrExpr . aPpsa} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> _Name [
<getter>
	^ (handle propertyNamed: #'_Name' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> _Name: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'_Name' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> accChild: aVarChild [
<getter>

	^ (handle propertyNamed: #'accChild' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> accChildCount [
<getter>
	^ (handle propertyNamed: #'accChildCount' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> accDefaultAction: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accDefaultAction' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> accDescription: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accDescription' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractTextbox >> accDoDefaultAction: aVarChild [
<method>
"This method can be called with optional parameters. varChild"
	^ (handle dispatch: #'accDoDefaultAction' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> accFocus [
<getter>
	^ (handle propertyNamed: #'accFocus' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> accHelp: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accHelp' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> accHelpTopic: aPszHelpFile varChild: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accHelpTopic' withArguments: {aPszHelpFile . aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractTextbox >> accHitTest: aXLeft yTop: aYTop [
<method>

	^ (handle dispatch: #'accHitTest' withArguments: {aXLeft . aYTop} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> accKeyboardShortcut: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accKeyboardShortcut' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractTextbox >> accLocation: aPxLeft pyTop: aPyTop pcxWidth: aPcxWidth pcyHeight: aPcyHeight varChild: aVarChild [
<method>
"This method can be called with optional parameters. varChild"
	^ (handle dispatch: #'accLocation' withArguments: {aPxLeft . aPyTop . aPcxWidth . aPcyHeight . aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> accName: aVarChild [
<setter>
		"This method can be called with optional parameters. aParam1"
	^ (handle propertyNamed: #'accName' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractTextbox >> accNavigate: aNavDir varStart: aVarStart [
<method>
"This method can be called with optional parameters. varStart"
	^ (handle dispatch: #'accNavigate' withArguments: {aNavDir . aVarStart} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> accParent [
<getter>
	^ (handle propertyNamed: #'accParent' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> accRole: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accRole' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractTextbox >> accSelect: aFlagsSelect varChild: aVarChild [
<method>
"This method can be called with optional parameters. varChild"
	^ (handle dispatch: #'accSelect' withArguments: {aFlagsSelect . aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> accSelection [
<getter>
	^ (handle propertyNamed: #'accSelection' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> accState: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accState' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> accValue: aVarChild [
<setter>
		"This method can be called with optional parameters. aParam1"
	^ (handle propertyNamed: #'accValue' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractTextbox >> addRef [
<method>
	^ (handle dispatch: #'AddRef' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> afterUpdate [
<getter>
	^ (handle propertyNamed: #'AfterUpdate' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> afterUpdate: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AfterUpdate' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> afterUpdateMacro [
<getter>
	^ (handle propertyNamed: #'AfterUpdateMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> afterUpdateMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AfterUpdateMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> allowedText [
<getter>
	^ (handle propertyNamed: #'AllowedText' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> allowedText: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'AllowedText' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> beforeUpdate [
<getter>
	^ (handle propertyNamed: #'BeforeUpdate' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> beforeUpdate: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BeforeUpdate' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> beforeUpdateMacro [
<getter>
	^ (handle propertyNamed: #'BeforeUpdateMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> beforeUpdateMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BeforeUpdateMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> borderLineStyle [
<getter>
	^ (handle propertyNamed: #'BorderLineStyle' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> borderLineStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderLineStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> coltyp [
<getter>
	^ (handle propertyNamed: #'Coltyp' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> coltyp: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Coltyp' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> controlName [
<getter>
	^ (handle propertyNamed: #'ControlName' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> controlName: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlName' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> fELineBreak [
<getter>
	^ (handle propertyNamed: #'FELineBreak' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> fELineBreak: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FELineBreak' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> formatPictureText [
<getter>
	^ (handle propertyNamed: #'FormatPictureText' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> formatPictureText: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'FormatPictureText' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlAbstractTextbox >> getIDsOfNames: aRiid rgszNames: aRgszNames cNames: aCNames lcid: aLcid rgdispid: aRgdispid [
<method>

	^ (handle dispatch: #'GetIDsOfNames' withArguments: {aRiid . aRgszNames . aCNames . aLcid . aRgdispid} ).

]

{ #category : #'method - generated' }
JinControlAbstractTextbox >> getTypeInfo: aItinfo lcid: aLcid pptinfo: aPptinfo [
<method>

	^ (handle dispatch: #'GetTypeInfo' withArguments: {aItinfo . aLcid . aPptinfo} ).

]

{ #category : #'method - generated' }
JinControlAbstractTextbox >> getTypeInfoCount: aPctinfo [
<method>

	^ (handle dispatch: #'GetTypeInfoCount' withArguments: {aPctinfo} ).

]

{ #category : #'method - generated' }
JinControlAbstractTextbox >> goto [
<method>
	^ (handle dispatch: #'Goto' ).

]

{ #category : #'method - generated' }
JinControlAbstractTextbox >> invoke: aDispidMember riid: aRiid lcid: aLcid wFlags: aWFlags pdispparams: aPdispparams pvarResult: aPvarResult pexcepinfo: aPexcepinfo puArgErr: aPuArgErr [
<method>

	^ (handle dispatch: #'Invoke' withArguments: {aDispidMember . aRiid . aLcid . aWFlags . aPdispparams . aPvarResult . aPexcepinfo . aPuArgErr} ).

]

{ #category : #'method - generated' }
JinControlAbstractTextbox >> isMemberSafe: aDispid [
<method>

	^ (handle dispatch: #'IsMemberSafe' withArguments: {aDispid} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> onChangeMacro [
<getter>
	^ (handle propertyNamed: #'OnChangeMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> onChangeMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnChangeMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> onClickMacro [
<getter>
	^ (handle propertyNamed: #'OnClickMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> onClickMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnClickMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> onDblClickMacro [
<getter>
	^ (handle propertyNamed: #'OnDblClickMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> onDblClickMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnDblClickMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> onEnterMacro [
<getter>
	^ (handle propertyNamed: #'OnEnterMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> onEnterMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnEnterMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> onExitMacro [
<getter>
	^ (handle propertyNamed: #'OnExitMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> onExitMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnExitMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> onGotFocusMacro [
<getter>
	^ (handle propertyNamed: #'OnGotFocusMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> onGotFocusMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnGotFocusMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> onKeyDownMacro [
<getter>
	^ (handle propertyNamed: #'OnKeyDownMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> onKeyDownMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyDownMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> onKeyPressMacro [
<getter>
	^ (handle propertyNamed: #'OnKeyPressMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> onKeyPressMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyPressMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> onKeyUpMacro [
<getter>
	^ (handle propertyNamed: #'OnKeyUpMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> onKeyUpMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyUpMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> onLostFocusMacro [
<getter>
	^ (handle propertyNamed: #'OnLostFocusMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> onLostFocusMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnLostFocusMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> onMouseDownMacro [
<getter>
	^ (handle propertyNamed: #'OnMouseDownMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> onMouseDownMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseDownMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> onMouseMoveMacro [
<getter>
	^ (handle propertyNamed: #'OnMouseMoveMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> onMouseMoveMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseMoveMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> onMouseUpMacro [
<getter>
	^ (handle propertyNamed: #'OnMouseUpMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> onMouseUpMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseUpMacro' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlAbstractTextbox >> queryInterface: aRiid ppvObj: aPpvObj [
<method>

	^ (handle dispatch: #'QueryInterface' withArguments: {aRiid . aPpvObj} ).

]

{ #category : #'method - generated' }
JinControlAbstractTextbox >> release [
<method>
	^ (handle dispatch: #'Release' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> target [
<getter>
	^ (handle propertyNamed: #'Target' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> target: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Target' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> textAlignGeneral [
<getter>
	^ (handle propertyNamed: #'TextAlignGeneral' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> textAlignGeneral: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TextAlignGeneral' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> textFontCharSet [
<getter>
	^ (handle propertyNamed: #'TextFontCharSet' ).

]

{ #category : #'property - generated' }
JinControlAbstractTextbox >> textFontCharSet: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TextFontCharSet' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlAbstractTextbox >> undo [
<method>
	^ (handle dispatch: #'Undo' ).

]
