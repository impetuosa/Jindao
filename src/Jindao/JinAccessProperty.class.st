"
Property defines a Proprety object from the Access model. 
This properties are an object representation of attributes from some specific object.

"
Class {
	#name : #JinAccessProperty,
	#superclass : #JinAccessObject,
	#category : #'Jindao-Core'
}

{ #category : #visiting }
JinAccessProperty >> acceptVisitor: aVisitor [
	^ aVisitor visitAccessProperty: self
]

{ #category : #'remote methods' }
JinAccessProperty >> addRef [
<method>
	^ (handle dispatch: #'AddRef' ).

]

{ #category : #'remote properties' }
JinAccessProperty >> application [
<getter>
	^ (handle propertyNamed: #'Application' ).

]

{ #category : #'remote properties' }
JinAccessProperty >> category [
<getter>
	^ (handle propertyNamed: #'Category' ).

]

{ #category : #'remote methods' }
JinAccessProperty >> getIDsOfNames: aRiid rgszNames: aRgszNames cNames: aCNames lcid: aLcid rgdispid: aRgdispid [
<method>

	^ (handle dispatch: #'GetIDsOfNames' withArguments: {aRiid . aRgszNames . aCNames . aLcid . aRgdispid} ).

]

{ #category : #'remote methods' }
JinAccessProperty >> getTypeInfo: aItinfo lcid: aLcid pptinfo: aPptinfo [
<method>

	^ (handle dispatch: #'GetTypeInfo' withArguments: {aItinfo . aLcid . aPptinfo} ).

]

{ #category : #'remote methods' }
JinAccessProperty >> getTypeInfoCount: aPctinfo [
<method>

	^ (handle dispatch: #'GetTypeInfoCount' withArguments: {aPctinfo} ).

]

{ #category : #'remote properties' }
JinAccessProperty >> inherited [
<getter>
	^ (handle propertyNamed: #'Inherited' ).

]

{ #category : #'remote methods' }
JinAccessProperty >> invoke: aDispidMember riid: aRiid lcid: aLcid wFlags: aWFlags pdispparams: aPdispparams pvarResult: aPvarResult pexcepinfo: aPexcepinfo puArgErr: aPuArgErr [
<method>

	^ (handle dispatch: #'Invoke' withArguments: {aDispidMember . aRiid . aLcid . aWFlags . aPdispparams . aPvarResult . aPexcepinfo . aPuArgErr} ).

]

{ #category : #'as yet unclassified' }
JinAccessProperty >> isEasyToTransfer [
	^ true
]

{ #category : #'remote methods' }
JinAccessProperty >> isMemberSafe: aDispid [
<method>

	^ (handle dispatch: #'IsMemberSafe' withArguments: {aDispid} ).

]

{ #category : #'remote properties' }
JinAccessProperty >> name: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Name' withArguments: {aParam1} ).

]

{ #category : #'remote methods' }
JinAccessProperty >> queryInterface: aRiid ppvObj: aPpvObj [
<method>

	^ (handle dispatch: #'QueryInterface' withArguments: {aRiid . aPpvObj} ).

]

{ #category : #'remote methods' }
JinAccessProperty >> release [
<method>
	^ (handle dispatch: #'Release' ).

]

{ #category : #'remote properties' }
JinAccessProperty >> type [
<getter>
	^ (handle propertyNamed: #'Type' ).

]

{ #category : #'remote properties' }
JinAccessProperty >> type: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Type' withArguments: {aParam1} ).

]

{ #category : #'remote properties' }
JinAccessProperty >> value [
<getter>
	^ (handle propertyNamed: #'Value' ).

]

{ #category : #'remote properties' }
JinAccessProperty >> value: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Value' put: aParam1 ).

]
