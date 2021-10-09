Class {
	#name : #JinDAMInitializeProcess,
	#superclass : #JinDAMBehavioural,
	#category : #'JinDAM-Model'
}

{ #category : #accessing }
JinDAMInitializeProcess >> accept: aVisitor [  
	^ aVisitor visitInitializeProcess: self.

]

{ #category : #accessing }
JinDAMInitializeProcess >> initialize [
	super initialize.
	selector := '__INITIALIZE_WIDGET_FROM_UI_CONFIGURATION'
]

{ #category : #accessing }
JinDAMInitializeProcess >> isInitializer [
	^ true 
]

{ #category : #accessing }
JinDAMInitializeProcess >> relatedSymbolKind [ 
	^ JinNSKind entry: #WidgetInitialization
]
