"
I represent a Dispatch interface defined in the library. I include  variables and functions/methods. I can be considered like an object or a static class with static methods.
"
Class {
	#name : #JinLibraryDispatchInterface,
	#superclass : #JinLibraryModule,
	#category : #'Jindao-DLL-Library'
}

{ #category : #'as yet unclassified' }
JinLibraryDispatchInterface >> acceptVisitor: aVisitor [

	^ aVisitor visitLibraryDispatchInterface: self
]
