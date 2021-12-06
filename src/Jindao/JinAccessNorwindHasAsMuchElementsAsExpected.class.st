Class {
	#name : #JinAccessNorwindHasAsMuchElementsAsExpected,
	#superclass : #JinNorwindBasedTests,
	#category : #'Jindao-Tests'
}

{ #category : #running }
JinAccessNorwindHasAsMuchElementsAsExpected >> testNorwindHas15Reports [
	self assert: project reports size equals: 15
]

{ #category : #running }
JinAccessNorwindHasAsMuchElementsAsExpected >> testNorwindHas27Queries [
	self assert: project queries size equals: 27
]

{ #category : #running }
JinAccessNorwindHasAsMuchElementsAsExpected >> testNorwindHas2Macros [
	self assert: project macros size equals: 2
]

{ #category : #running }
JinAccessNorwindHasAsMuchElementsAsExpected >> testNorwindHas32Tables [
	self assert: project tables size equals: 32
]

{ #category : #running }
JinAccessNorwindHasAsMuchElementsAsExpected >> testNorwindHas34Forms [
	self assert: project forms size equals: 34
]

{ #category : #running }
JinAccessNorwindHasAsMuchElementsAsExpected >> testNorwindHas8Modules [
	self assert: project modules size equals: 8
]
