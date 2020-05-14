Class {
	#name : #JinAccessProperty,
	#superclass : #JinProtoHandleObject,
	#instVars : [
		'parent'
	],
	#category : #'Jindao-DomainObjects-Properties'
}

{ #category : #'method - generated' }
JinAccessProperty >> addRef [
<method>
	^ (handle dispatch: #'AddRef' ).

]

{ #category : #'property - generated' }
JinAccessProperty >> application [
<getter>
	^ (handle propertyNamed: #'Application' ).

]

{ #category : #'property - generated' }
JinAccessProperty >> category [
<getter>
	^ (handle propertyNamed: #'Category' ).

]

{ #category : #'method - generated' }
JinAccessProperty >> getIDsOfNames: aRiid rgszNames: aRgszNames cNames: aCNames lcid: aLcid rgdispid: aRgdispid [
<method>

	^ (handle dispatch: #'GetIDsOfNames' withArguments: {aRiid . aRgszNames . aCNames . aLcid . aRgdispid} ).

]

{ #category : #'method - generated' }
JinAccessProperty >> getTypeInfo: aItinfo lcid: aLcid pptinfo: aPptinfo [
<method>

	^ (handle dispatch: #'GetTypeInfo' withArguments: {aItinfo . aLcid . aPptinfo} ).

]

{ #category : #'method - generated' }
JinAccessProperty >> getTypeInfoCount: aPctinfo [
<method>

	^ (handle dispatch: #'GetTypeInfoCount' withArguments: {aPctinfo} ).

]

{ #category : #'property - generated' }
JinAccessProperty >> inherited [
<getter>
	^ (handle propertyNamed: #'Inherited' ).

]

{ #category : #'method - generated' }
JinAccessProperty >> invoke: aDispidMember riid: aRiid lcid: aLcid wFlags: aWFlags pdispparams: aPdispparams pvarResult: aPvarResult pexcepinfo: aPexcepinfo puArgErr: aPuArgErr [
<method>

	^ (handle dispatch: #'Invoke' withArguments: {aDispidMember . aRiid . aLcid . aWFlags . aPdispparams . aPvarResult . aPexcepinfo . aPuArgErr} ).

]

{ #category : #'method - generated' }
JinAccessProperty >> isMemberSafe: aDispid [
<method>

	^ (handle dispatch: #'IsMemberSafe' withArguments: {aDispid} ).

]

{ #category : #'property - generated' }
JinAccessProperty >> name [
<getter>
	^ (handle propertyNamed: #'Name' ).

]

{ #category : #'property - generated' }
JinAccessProperty >> name: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Name' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAccessProperty >> parent [
<getter>
	^ (handle propertyNamed: #'Parent' ).

]

{ #category : #accessing }
JinAccessProperty >> parent: aParent [
	parent := aParent
]

{ #category : #'property - generated' }
JinAccessProperty >> properties [
<getter>
	^ (handle propertyNamed: #'Properties' ).

]

{ #category : #'method - generated' }
JinAccessProperty >> queryInterface: aRiid ppvObj: aPpvObj [
<method>

	^ (handle dispatch: #'QueryInterface' withArguments: {aRiid . aPpvObj} ).

]

{ #category : #'method - generated' }
JinAccessProperty >> release [
<method>
	^ (handle dispatch: #'Release' ).

]

{ #category : #'property - generated' }
JinAccessProperty >> type [
<getter>
	^ (handle propertyNamed: #'Type' ).

]

{ #category : #'property - generated' }
JinAccessProperty >> type: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Type' withArguments: {aParam1} ).

]

{ #category : #'property - generated' }
JinAccessProperty >> value [
<getter>
	^ (handle propertyNamed: #'Value' ).

]

{ #category : #'property - generated' }
JinAccessProperty >> value: aParam1 [
<setter>
		
	^ (handle propertyNamed: #'Value' withArguments: {aParam1} ).

]
