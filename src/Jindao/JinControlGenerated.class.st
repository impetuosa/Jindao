"
I am only here to remind which controls have being generated.
Controls in Access are extremely complex, having hundreds of properties, therefore all of my subclasses are split into an Abstract Class and the Concrete Class. 
The concrete class implements accessors and methods for all *documented* properties and methods of the represented element. 
The abstract class of each of these concrete class implement the rest of methods and accessors, which are available programatically, but not in the documentation. 

The idea with this splitting is to reduce the API of these objects and avoid misunderstandings. 

"
Class {
	#name : #JinControlGenerated,
	#superclass : #JinControl,
	#category : #'Jindao-MSAccess-Widgets'
}

{ #category : #'as yet unclassified' }
JinControlGenerated class >> mappedTypeName [
	^ self 
]
