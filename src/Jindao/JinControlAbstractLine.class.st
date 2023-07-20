"
I am here to abstract the methods that are part of many elements, but are not particularly interesting for my only subclass.
"
Class {
	#name : #JinControlAbstractLine,
	#superclass : #JinControlGenerated,
	#category : #'Jindao-FormControls-BuiltIn-Abstract'
}

{ #category : #'method - generated' }
JinControlAbstractLine >> _Evaluate: aBstrExpr ppsa: aPpsa [
<method>

	^ (handle dispatch: #'_Evaluate' withArguments: {aBstrExpr . aPpsa} ).

]

{ #category : #'property - generated' }
JinControlAbstractLine >> _Name [
<getter>
	^ (handle propertyNamed: #'_Name' ).

]

{ #category : #'property - generated' }
JinControlAbstractLine >> _Name: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'_Name' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlAbstractLine >> addRef [
<method>
	^ (handle dispatch: #'AddRef' ).

]

{ #category : #'property - generated' }
JinControlAbstractLine >> borderLineStyle [
<getter>
	^ (handle propertyNamed: #'BorderLineStyle' ).

]

{ #category : #'property - generated' }
JinControlAbstractLine >> borderLineStyle: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'BorderLineStyle' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinControlAbstractLine >> controlName [
<getter>
	^ (handle propertyNamed: #'ControlName' ).

]

{ #category : #'property - generated' }
JinControlAbstractLine >> controlName: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'ControlName' withArguments: {aParam1} ).

]

{ #category : #'method - generated' }
JinControlAbstractLine >> getIDsOfNames: aRiid rgszNames: aRgszNames cNames: aCNames lcid: aLcid rgdispid: aRgdispid [
<method>

	^ (handle dispatch: #'GetIDsOfNames' withArguments: {aRiid . aRgszNames . aCNames . aLcid . aRgdispid} ).

]

{ #category : #'method - generated' }
JinControlAbstractLine >> getTypeInfo: aItinfo lcid: aLcid pptinfo: aPptinfo [
<method>

	^ (handle dispatch: #'GetTypeInfo' withArguments: {aItinfo . aLcid . aPptinfo} ).

]

{ #category : #'method - generated' }
JinControlAbstractLine >> getTypeInfoCount: aPctinfo [
<method>

	^ (handle dispatch: #'GetTypeInfoCount' withArguments: {aPctinfo} ).

]

{ #category : #'method - generated' }
JinControlAbstractLine >> invoke: aDispidMember riid: aRiid lcid: aLcid wFlags: aWFlags pdispparams: aPdispparams pvarResult: aPvarResult pexcepinfo: aPexcepinfo puArgErr: aPuArgErr [
<method>

	^ (handle dispatch: #'Invoke' withArguments: {aDispidMember . aRiid . aLcid . aWFlags . aPdispparams . aPvarResult . aPexcepinfo . aPuArgErr} ).

]

{ #category : #'method - generated' }
JinControlAbstractLine >> isMemberSafe: aDispid [
<method>

	^ (handle dispatch: #'IsMemberSafe' withArguments: {aDispid} ).

]

{ #category : #'method - generated' }
JinControlAbstractLine >> queryInterface: aRiid ppvObj: aPpvObj [
<method>

	^ (handle dispatch: #'QueryInterface' withArguments: {aRiid . aPpvObj} ).

]

{ #category : #'method - generated' }
JinControlAbstractLine >> release [
<method>
	^ (handle dispatch: #'Release' ).

]
