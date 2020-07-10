"
I am here to abstract the methods that are part of many elements, but are not particularly interesting for my only subclass.
"
Class {
	#name : #JinControlAbstractTabControl,
	#superclass : #JinControlGenerated,
	#category : #'Jindao-FormControls-BuiltIn-Abstract'
}

{ #category : #'method - generated' }
JinControlAbstractTabControl >> _Evaluate: aBstrExpr ppsa: aPpsa [
<method>

	^ (handle dispatch: #'_Evaluate' withArguments: {aBstrExpr . aPpsa} ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> _Name [
<getter>
	^ (handle propertyNamed: #'_Name' ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> _Name: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'_Name' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlAbstractTabControl >> _NewEnum [
<method>
	^ (handle dispatch: #'_NewEnum' ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> accChild: aVarChild [
<getter>

	^ (handle propertyNamed: #'accChild' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> accChildCount [
<getter>
	^ (handle propertyNamed: #'accChildCount' ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> accDefaultAction: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accDefaultAction' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> accDescription: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accDescription' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractTabControl >> accDoDefaultAction: aVarChild [
<method>
"This method can be called with optional parameters. varChild"
	^ (handle dispatch: #'accDoDefaultAction' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> accFocus [
<getter>
	^ (handle propertyNamed: #'accFocus' ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> accHelp: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accHelp' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> accHelpTopic: aPszHelpFile varChild: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accHelpTopic' withArguments: {aPszHelpFile . aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractTabControl >> accHitTest: aXLeft yTop: aYTop [
<method>

	^ (handle dispatch: #'accHitTest' withArguments: {aXLeft . aYTop} ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> accKeyboardShortcut: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accKeyboardShortcut' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractTabControl >> accLocation: aPxLeft pyTop: aPyTop pcxWidth: aPcxWidth pcyHeight: aPcyHeight varChild: aVarChild [
<method>
"This method can be called with optional parameters. varChild"
	^ (handle dispatch: #'accLocation' withArguments: {aPxLeft . aPyTop . aPcxWidth . aPcyHeight . aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> accName: aVarChild [
<setter>
		"This method can be called with optional parameters. aParam1"
	^ (handle propertyNamed: #'accName' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractTabControl >> accNavigate: aNavDir varStart: aVarStart [
<method>
"This method can be called with optional parameters. varStart"
	^ (handle dispatch: #'accNavigate' withArguments: {aNavDir . aVarStart} ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> accParent [
<getter>
	^ (handle propertyNamed: #'accParent' ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> accRole: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accRole' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractTabControl >> accSelect: aFlagsSelect varChild: aVarChild [
<method>
"This method can be called with optional parameters. varChild"
	^ (handle dispatch: #'accSelect' withArguments: {aFlagsSelect . aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> accSelection [
<getter>
	^ (handle propertyNamed: #'accSelection' ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> accState: aVarChild [
<getter>
"This method can be called with optional parameters. varChild"
	^ (handle propertyNamed: #'accState' withArguments: {aVarChild} ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> accValue: aVarChild [
<setter>
		"This method can be called with optional parameters. aParam1"
	^ (handle propertyNamed: #'accValue' withArguments: {aVarChild} ).

]

{ #category : #'method - generated' }
JinControlAbstractTabControl >> addRef [
<method>
	^ (handle dispatch: #'AddRef' ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> controlName [
<getter>
	^ (handle propertyNamed: #'ControlName' ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> controlName: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlName' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlAbstractTabControl >> getIDsOfNames: aRiid rgszNames: aRgszNames cNames: aCNames lcid: aLcid rgdispid: aRgdispid [
<method>

	^ (handle dispatch: #'GetIDsOfNames' withArguments: {aRiid . aRgszNames . aCNames . aLcid . aRgdispid} ).

]

{ #category : #'method - generated' }
JinControlAbstractTabControl >> getTypeInfo: aItinfo lcid: aLcid pptinfo: aPptinfo [
<method>

	^ (handle dispatch: #'GetTypeInfo' withArguments: {aItinfo . aLcid . aPptinfo} ).

]

{ #category : #'method - generated' }
JinControlAbstractTabControl >> getTypeInfoCount: aPctinfo [
<method>

	^ (handle dispatch: #'GetTypeInfoCount' withArguments: {aPctinfo} ).

]

{ #category : #'method - generated' }
JinControlAbstractTabControl >> invoke: aDispidMember riid: aRiid lcid: aLcid wFlags: aWFlags pdispparams: aPdispparams pvarResult: aPvarResult pexcepinfo: aPexcepinfo puArgErr: aPuArgErr [
<method>

	^ (handle dispatch: #'Invoke' withArguments: {aDispidMember . aRiid . aLcid . aWFlags . aPdispparams . aPvarResult . aPexcepinfo . aPuArgErr} ).

]

{ #category : #'method - generated' }
JinControlAbstractTabControl >> isMemberSafe: aDispid [
<method>

	^ (handle dispatch: #'IsMemberSafe' withArguments: {aDispid} ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> onChangeMacro [
<getter>
	^ (handle propertyNamed: #'OnChangeMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> onChangeMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnChangeMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> onClickMacro [
<getter>
	^ (handle propertyNamed: #'OnClickMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> onClickMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnClickMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> onDblClickMacro [
<getter>
	^ (handle propertyNamed: #'OnDblClickMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> onDblClickMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnDblClickMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> onKeyDownMacro [
<getter>
	^ (handle propertyNamed: #'OnKeyDownMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> onKeyDownMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyDownMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> onKeyPressMacro [
<getter>
	^ (handle propertyNamed: #'OnKeyPressMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> onKeyPressMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyPressMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> onKeyUpMacro [
<getter>
	^ (handle propertyNamed: #'OnKeyUpMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> onKeyUpMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnKeyUpMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> onMouseDownMacro [
<getter>
	^ (handle propertyNamed: #'OnMouseDownMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> onMouseDownMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseDownMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> onMouseMoveMacro [
<getter>
	^ (handle propertyNamed: #'OnMouseMoveMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> onMouseMoveMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseMoveMacro' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> onMouseUpMacro [
<getter>
	^ (handle propertyNamed: #'OnMouseUpMacro' ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> onMouseUpMacro: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'OnMouseUpMacro' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlAbstractTabControl >> queryInterface: aRiid ppvObj: aPpvObj [
<method>

	^ (handle dispatch: #'QueryInterface' withArguments: {aRiid . aPpvObj} ).

]

{ #category : #'method - generated' }
JinControlAbstractTabControl >> release [
<method>
	^ (handle dispatch: #'Release' ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> textFontCharSet [
<getter>
	^ (handle propertyNamed: #'TextFontCharSet' ).

]

{ #category : #'property - generated' }
JinControlAbstractTabControl >> textFontCharSet: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'TextFontCharSet' withArguments: {aParam1} ).

]
