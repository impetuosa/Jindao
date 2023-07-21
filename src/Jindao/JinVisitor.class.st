"
I am a massive visitor. I can visit what ever in an access system . 
"
Class {
	#name : #JinVisitor,
	#superclass : #Object,
	#category : #'Jindao-Visitors'
}

{ #category : #'visit-first-objects' }
JinVisitor >> visitAccessProperty: anAccessProperty [
	^ self visitHandleObject: anAccessProperty
]

{ #category : #'visit-control-properties' }
JinVisitor >> visitAfterUpdate:aAfterUpdate [
	^ self visitAccessProperty: aAfterUpdate. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitAfterUpdateEmMacro:aAfterUpdateEmMacro [
	^ self visitAccessProperty: aAfterUpdateEmMacro. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitAggregateType:aAggregateType [
	^ self visitAccessProperty: aAggregateType. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitAlignment:aAlignment [
	^ self visitAccessProperty: aAlignment. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitAllowAutoCorrect:aAllowAutoCorrect [
	^ self visitAccessProperty: aAllowAutoCorrect. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitAllowValueListEdits:aAllowValueListEdits [
	^ self visitAccessProperty: aAllowValueListEdits. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitAsianLineBreak:aAsianLineBreak [
	^ self visitAccessProperty: aAsianLineBreak. 

]

{ #category : #'visit-controls' }
JinVisitor >> visitAttachment: aJinControlAttachment [
	self visitFormControl: aJinControlAttachment
]

{ #category : #'visit-control-properties' }
JinVisitor >> visitAutoExpand:aAutoExpand [
	^ self visitAccessProperty: aAutoExpand. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitAutoRepeat:aAutoRepeat [
	^ self visitAccessProperty: aAutoRepeat. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitAutoTab:aAutoTab [
	^ self visitAccessProperty: aAutoTab. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitBackColor:aBackColor [
	^ self visitAccessProperty: aBackColor. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitBackShade:aBackShade [
	^ self visitAccessProperty: aBackShade. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitBackStyle:aBackStyle [
	^ self visitAccessProperty: aBackStyle. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitBackThemeColorIndex:aBackThemeColorIndex [
	^ self visitAccessProperty: aBackThemeColorIndex. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitBackTint:aBackTint [
	^ self visitAccessProperty: aBackTint. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitBeforeUpdate:aBeforeUpdate [
	^ self visitAccessProperty: aBeforeUpdate. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitBeforeUpdateEmMacro:aBeforeUpdateEmMacro [
	^ self visitAccessProperty: aBeforeUpdateEmMacro. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitBevel:aBevel [
	^ self visitAccessProperty: aBevel. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitBorderColor:aBorderColor [
	^ self visitAccessProperty: aBorderColor. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitBorderLineStyle:aBorderLineStyle [
	^ self visitAccessProperty: aBorderLineStyle. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitBorderShade:aBorderShade [
	^ self visitAccessProperty: aBorderShade. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitBorderStyle:aBorderStyle [
	^ self visitAccessProperty: aBorderStyle. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitBorderThemeColorIndex:aBorderThemeColorIndex [
	^ self visitAccessProperty: aBorderThemeColorIndex. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitBorderTint:aBorderTint [
	^ self visitAccessProperty: aBorderTint. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitBorderWidth:aBorderWidth [
	^ self visitAccessProperty: aBorderWidth. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitBottomMargin:aBottomMargin [
	^ self visitAccessProperty: aBottomMargin. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitBottomPadding:aBottomPadding [
	^ self visitAccessProperty: aBottomPadding. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitBoundColumn:aBoundColumn [
	^ self visitAccessProperty: aBoundColumn. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitCanGrow:aCanGrow [
	^ self visitAccessProperty: aCanGrow. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitCanShrink:aCanShrink [
	^ self visitAccessProperty: aCanShrink. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitCancel:aCancel [
	^ self visitAccessProperty: aCancel. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitCaption:aCaption [
	^ self visitAccessProperty: aCaption. 

]

{ #category : #'visit-controls' }
JinVisitor >> visitCheckbox: aJinControlCheckbox [
	self visitFormControl: aJinControlCheckbox
]

{ #category : #'visit-first-objects' }
JinVisitor >> visitCollection: aCollection [

	aCollection do: [ :element | element acceptVisitor: self ]
]

{ #category : #'visit-control-properties' }
JinVisitor >> visitColumnCount:aColumnCount [
	^ self visitAccessProperty: aColumnCount. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitColumnEnd:aColumnEnd [
	^ self visitAccessProperty: aColumnEnd. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitColumnHeads:aColumnHeads [
	^ self visitAccessProperty: aColumnHeads. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitColumnHidden:aColumnHidden [
	^ self visitAccessProperty: aColumnHidden. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitColumnOrder:aColumnOrder [
	^ self visitAccessProperty: aColumnOrder. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitColumnStart:aColumnStart [
	^ self visitAccessProperty: aColumnStart. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitColumnWidth:aColumnWidth [
	^ self visitAccessProperty: aColumnWidth. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitColumnWidths:aColumnWidths [
	^ self visitAccessProperty: aColumnWidths. 

]

{ #category : #'visit-controls' }
JinVisitor >> visitCombobox: aJinControlCombobox [
	self visitFormControl: aJinControlCombobox
]

{ #category : #'visit-controls' }
JinVisitor >> visitCommandButton: aJinControlCommandButton [ 
	self visitFormControl: aJinControlCommandButton
]

{ #category : #'visit-control-properties' }
JinVisitor >> visitConditionalFormat14:aConditionalFormat14 [
	^ self visitAccessProperty: aConditionalFormat14. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitConditionalFormat:aConditionalFormat [
	^ self visitAccessProperty: aConditionalFormat. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitControlSource:aControlSource [
	^ self visitAccessProperty: aControlSource. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitControlTipText:aControlTipText [
	^ self visitAccessProperty: aControlTipText. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitControlType:aControlType [
	^ self visitAccessProperty: aControlType. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitCursorOnHover:aCursorOnHover [
	^ self visitAccessProperty: aCursorOnHover. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitDatasheetCaption:aDatasheetCaption [
	^ self visitAccessProperty: aDatasheetCaption. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitDecimalPlaces:aDecimalPlaces [
	^ self visitAccessProperty: aDecimalPlaces. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitDefault:aDefault [
	^ self visitAccessProperty: aDefault. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitDefaultPicture:aDefaultPicture [
	^ self visitAccessProperty: aDefaultPicture. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitDefaultPictureType:aDefaultPictureType [
	^ self visitAccessProperty: aDefaultPictureType. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitDefaultValue:aDefaultValue [
	^ self visitAccessProperty: aDefaultValue. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitDisplayAs:aDisplayAs [
	^ self visitAccessProperty: aDisplayAs. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitDisplayAsHyperlink:aDisplayAsHyperlink [
	^ self visitAccessProperty: aDisplayAsHyperlink. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitDisplayWhen:aDisplayWhen [
	^ self visitAccessProperty: aDisplayWhen. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitEnabled:aEnabled [
	^ self visitAccessProperty: aEnabled. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitEnterKeyBehavior:aEnterKeyBehavior [
	^ self visitAccessProperty: aEnterKeyBehavior. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitEventProcPrefix:aEventProcPrefix [
	^ self visitAccessProperty: aEventProcPrefix. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitFilterLookup:aFilterLookup [
	^ self visitAccessProperty: aFilterLookup. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitFilterOnEmptyMaster:aFilterOnEmptyMaster [
	^ self visitAccessProperty: aFilterOnEmptyMaster. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitFontBold:aFontBold [
	^ self visitAccessProperty: aFontBold. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitFontItalic:aFontItalic [
	^ self visitAccessProperty: aFontItalic. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitFontName:aFontName [
	^ self visitAccessProperty: aFontName. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitFontSize:aFontSize [
	^ self visitAccessProperty: aFontSize. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitFontUnderline:aFontUnderline [
	^ self visitAccessProperty: aFontUnderline. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitFontWeight:aFontWeight [
	^ self visitAccessProperty: aFontWeight. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitForeColor:aForeColor [
	^ self visitAccessProperty: aForeColor. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitForeShade:aForeShade [
	^ self visitAccessProperty: aForeShade. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitForeThemeColorIndex:aForeThemeColorIndex [
	^ self visitAccessProperty: aForeThemeColorIndex. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitForeTint:aForeTint [
	^ self visitAccessProperty: aForeTint. 

]

{ #category : #'visit-first-objects' }
JinVisitor >> visitForm: aJinForm [
	aJinForm hasModule
		ifTrue: [ aJinForm module acceptVisitor: self ].
	
	self visitCollection: aJinForm controls
]

{ #category : #'visit-first-objects' }
JinVisitor >> visitFormControl: aJinControlObject [
	self visitHandleObject: aJinControlObject.
	self visitCollection: aJinControlObject properties.
]

{ #category : #'visit-first-objects' }
JinVisitor >> visitFormModule: aJinFormModule [ 
	self visitModule: aJinFormModule 
]

{ #category : #'visit-control-properties' }
JinVisitor >> visitFormat:aFormat [
	^ self visitAccessProperty: aFormat. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitFuriganaControl:aFuriganaControl [
	^ self visitAccessProperty: aFuriganaControl. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitGlow:aGlow [
	^ self visitAccessProperty: aGlow. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitGradient:aGradient [
	^ self visitAccessProperty: aGradient. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitGridlineColor:aGridlineColor [
	^ self visitAccessProperty: aGridlineColor. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitGridlineShade:aGridlineShade [
	^ self visitAccessProperty: aGridlineShade. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitGridlineStyleBottom:aGridlineStyleBottom [
	^ self visitAccessProperty: aGridlineStyleBottom. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitGridlineStyleLeft:aGridlineStyleLeft [
	^ self visitAccessProperty: aGridlineStyleLeft. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitGridlineStyleRight:aGridlineStyleRight [
	^ self visitAccessProperty: aGridlineStyleRight. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitGridlineStyleTop:aGridlineStyleTop [
	^ self visitAccessProperty: aGridlineStyleTop. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitGridlineThemeColorIndex:aGridlineThemeColorIndex [
	^ self visitAccessProperty: aGridlineThemeColorIndex. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitGridlineTint:aGridlineTint [
	^ self visitAccessProperty: aGridlineTint. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitGridlineWidthBottom:aGridlineWidthBottom [
	^ self visitAccessProperty: aGridlineWidthBottom. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitGridlineWidthLeft:aGridlineWidthLeft [
	^ self visitAccessProperty: aGridlineWidthLeft. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitGridlineWidthRight:aGridlineWidthRight [
	^ self visitAccessProperty: aGridlineWidthRight. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitGridlineWidthTop:aGridlineWidthTop [
	^ self visitAccessProperty: aGridlineWidthTop. 

]

{ #category : #'visit-first-objects' }
JinVisitor >> visitHandleObject: aJinReference [ 
	" Leaf object arriving "
]

{ #category : #'visit-control-properties' }
JinVisitor >> visitHeight:aHeight [
	^ self visitAccessProperty: aHeight. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitHelpContextId:aHelpContextId [
	^ self visitAccessProperty: aHelpContextId. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitHorizontalAnchor:aHorizontalAnchor [
	^ self visitAccessProperty: aHorizontalAnchor. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitHoverColor:aHoverColor [
	^ self visitAccessProperty: aHoverColor. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitHoverForeColor:aHoverForeColor [
	^ self visitAccessProperty: aHoverForeColor. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitHoverForeShade:aHoverForeShade [
	^ self visitAccessProperty: aHoverForeShade. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitHoverForeThemeColorIndex:aHoverForeThemeColorIndex [
	^ self visitAccessProperty: aHoverForeThemeColorIndex. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitHoverForeTint:aHoverForeTint [
	^ self visitAccessProperty: aHoverForeTint. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitHoverShade:aHoverShade [
	^ self visitAccessProperty: aHoverShade. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitHoverThemeColorIndex:aHoverThemeColorIndex [
	^ self visitAccessProperty: aHoverThemeColorIndex. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitHoverTint:aHoverTint [
	^ self visitAccessProperty: aHoverTint. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitHyperlinkAddress:aHyperlinkAddress [
	^ self visitAccessProperty: aHyperlinkAddress. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitHyperlinkBinderDescription:aHyperlinkBinderDescription [
	^ self visitAccessProperty: aHyperlinkBinderDescription. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitHyperlinkSubAddress:aHyperlinkSubAddress [
	^ self visitAccessProperty: aHyperlinkSubAddress. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitHyperlinkTarget:aHyperlinkTarget [
	^ self visitAccessProperty: aHyperlinkTarget. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitIMEHold:aIMEHold [
	^ self visitAccessProperty: aIMEHold. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitIMEMode:aIMEMode [
	^ self visitAccessProperty: aIMEMode. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitIMESentenceMode:aIMESentenceMode [
	^ self visitAccessProperty: aIMESentenceMode. 

]

{ #category : #'visit-controls' }
JinVisitor >> visitImage: aJinControlImage [ 
	self visitFormControl: aJinControlImage 
]

{ #category : #'visit-control-properties' }
JinVisitor >> visitImageData:aImageData [
	^ self visitAccessProperty: aImageData. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitImageHeight:aImageHeight [
	^ self visitAccessProperty: aImageHeight. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitImageWidth:aImageWidth [
	^ self visitAccessProperty: aImageWidth. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitInSelection:aInSelection [
	^ self visitAccessProperty: aInSelection. 

]

{ #category : #'as yet unclassified' }
JinVisitor >> visitIndex: aJinIndexBody [
	self subclassResponsibility
]

{ #category : #'visit-control-properties' }
JinVisitor >> visitInheritValueList:aInheritValueList [
	^ self visitAccessProperty: aInheritValueList. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitInputMask:aInputMask [
	^ self visitAccessProperty: aInputMask. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitIsHyperlink:aIsHyperlink [
	^ self visitAccessProperty: aIsHyperlink. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitKeyboardLanguage:aKeyboardLanguage [
	^ self visitAccessProperty: aKeyboardLanguage. 

]

{ #category : #'visit-controls' }
JinVisitor >> visitLabel: aJinControlLabel [ 
		self visitFormControl: aJinControlLabel
]

{ #category : #'visit-control-properties' }
JinVisitor >> visitLabelName:aLabelName [
	^ self visitAccessProperty: aLabelName. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitLayout:aLayout [
	^ self visitAccessProperty: aLayout. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitLayoutID:aLayoutID [
	^ self visitAccessProperty: aLayoutID. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitLeft:aLeft [
	^ self visitAccessProperty: aLeft. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitLeftMargin:aLeftMargin [
	^ self visitAccessProperty: aLeftMargin. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitLeftPadding:aLeftPadding [
	^ self visitAccessProperty: aLeftPadding. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitLimitToList:aLimitToList [
	^ self visitAccessProperty: aLimitToList. 

]

{ #category : #'visit-controls' }
JinVisitor >> visitLine: aJinControlLine [ 
	self visitFormControl: aJinControlLine
]

{ #category : #'visit-control-properties' }
JinVisitor >> visitLineSlant:aLineSlant [
	^ self visitAccessProperty: aLineSlant. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitLineSpacing:aLineSpacing [
	^ self visitAccessProperty: aLineSpacing. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitLinkChildFields:aLinkChildFields [
	^ self visitAccessProperty: aLinkChildFields. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitLinkMasterFields:aLinkMasterFields [
	^ self visitAccessProperty: aLinkMasterFields. 

]

{ #category : #'visit-controls' }
JinVisitor >> visitListBox: aJinControlListBox [ 
	self visitFormControl: aJinControlListBox 
]

{ #category : #'visit-control-properties' }
JinVisitor >> visitListCount:aListCount [
	^ self visitAccessProperty: aListCount. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitListIndex:aListIndex [
	^ self visitAccessProperty: aListIndex. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitListItemsEditForm:aListItemsEditForm [
	^ self visitAccessProperty: aListItemsEditForm. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitListRows:aListRows [
	^ self visitAccessProperty: aListRows. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitListWidth:aListWidth [
	^ self visitAccessProperty: aListWidth. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitLocked:aLocked [
	^ self visitAccessProperty: aLocked. 

]

{ #category : #'visit-first-objects' }
JinVisitor >> visitMacro: aMacro [
	self subclassResponsibility
]

{ #category : #'visit-first-objects' }
JinVisitor >> visitModule: aJinModule [ 
	aJinModule code acceptVisitor: self.
	
]

{ #category : #'visit-control-properties' }
JinVisitor >> visitMultiRow:aMultiRow [
	^ self visitAccessProperty: aMultiRow. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitMultiSelect:aMultiSelect [
	^ self visitAccessProperty: aMultiSelect. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitName:aName [
	^ self visitAccessProperty: aName. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitNumeralShapes:aNumeralShapes [
	^ self visitAccessProperty: aNumeralShapes. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitObjectPalette:aObjectPalette [
	^ self visitAccessProperty: aObjectPalette. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOldBorderStyle:aOldBorderStyle [
	^ self visitAccessProperty: aOldBorderStyle. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnAttachmentCurrent:aOnAttachmentCurrent [
	^ self visitAccessProperty: aOnAttachmentCurrent. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnAttachmentCurrentEmMacro:aOnAttachmentCurrentEmMacro [
	^ self visitAccessProperty: aOnAttachmentCurrentEmMacro. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnChange:aOnChange [
	^ self visitAccessProperty: aOnChange. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnChangeEmMacro:aOnChangeEmMacro [
	^ self visitAccessProperty: aOnChangeEmMacro. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnClick:aOnClick [
	^ self visitAccessProperty: aOnClick. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnClickEmMacro:aOnClickEmMacro [
	^ self visitAccessProperty: aOnClickEmMacro. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnDblClick:aOnDblClick [
	^ self visitAccessProperty: aOnDblClick. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnDblClickEmMacro:aOnDblClickEmMacro [
	^ self visitAccessProperty: aOnDblClickEmMacro. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnDirty:aOnDirty [
	^ self visitAccessProperty: aOnDirty. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnDirtyEmMacro:aOnDirtyEmMacro [
	^ self visitAccessProperty: aOnDirtyEmMacro. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnEnter:aOnEnter [
	^ self visitAccessProperty: aOnEnter. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnEnterEmMacro:aOnEnterEmMacro [
	^ self visitAccessProperty: aOnEnterEmMacro. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnExit:aOnExit [
	^ self visitAccessProperty: aOnExit. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnExitEmMacro:aOnExitEmMacro [
	^ self visitAccessProperty: aOnExitEmMacro. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnGotFocus:aOnGotFocus [
	^ self visitAccessProperty: aOnGotFocus. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnGotFocusEmMacro:aOnGotFocusEmMacro [
	^ self visitAccessProperty: aOnGotFocusEmMacro. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnKeyDown:aOnKeyDown [
	^ self visitAccessProperty: aOnKeyDown. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnKeyDownEmMacro:aOnKeyDownEmMacro [
	^ self visitAccessProperty: aOnKeyDownEmMacro. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnKeyPress:aOnKeyPress [
	^ self visitAccessProperty: aOnKeyPress. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnKeyPressEmMacro:aOnKeyPressEmMacro [
	^ self visitAccessProperty: aOnKeyPressEmMacro. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnKeyUp:aOnKeyUp [
	^ self visitAccessProperty: aOnKeyUp. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnKeyUpEmMacro:aOnKeyUpEmMacro [
	^ self visitAccessProperty: aOnKeyUpEmMacro. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnLostFocus:aOnLostFocus [
	^ self visitAccessProperty: aOnLostFocus. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnLostFocusEmMacro:aOnLostFocusEmMacro [
	^ self visitAccessProperty: aOnLostFocusEmMacro. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnMouseDown:aOnMouseDown [
	^ self visitAccessProperty: aOnMouseDown. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnMouseDownEmMacro:aOnMouseDownEmMacro [
	^ self visitAccessProperty: aOnMouseDownEmMacro. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnMouseMove:aOnMouseMove [
	^ self visitAccessProperty: aOnMouseMove. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnMouseMoveEmMacro:aOnMouseMoveEmMacro [
	^ self visitAccessProperty: aOnMouseMoveEmMacro. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnMouseUp:aOnMouseUp [
	^ self visitAccessProperty: aOnMouseUp. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnMouseUpEmMacro:aOnMouseUpEmMacro [
	^ self visitAccessProperty: aOnMouseUpEmMacro. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnNotInList:aOnNotInList [
	^ self visitAccessProperty: aOnNotInList. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnNotInListEmMacro:aOnNotInListEmMacro [
	^ self visitAccessProperty: aOnNotInListEmMacro. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnUndo:aOnUndo [
	^ self visitAccessProperty: aOnUndo. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitOnUndoEmMacro:aOnUndoEmMacro [
	^ self visitAccessProperty: aOnUndoEmMacro. 

]

{ #category : #'visit-controls' }
JinVisitor >> visitPage: aJinControlPage [
	self visitFormControl: aJinControlPage
]

{ #category : #'visit-control-properties' }
JinVisitor >> visitPageIndex:aPageIndex [
	^ self visitAccessProperty: aPageIndex. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitPicture:aPicture [
	^ self visitAccessProperty: aPicture. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitPictureAlignment:aPictureAlignment [
	^ self visitAccessProperty: aPictureAlignment. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitPictureCaptionArrangement:aPictureCaptionArrangement [
	^ self visitAccessProperty: aPictureCaptionArrangement. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitPictureData:aPictureData [
	^ self visitAccessProperty: aPictureData. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitPictureSizeMode:aPictureSizeMode [
	^ self visitAccessProperty: aPictureSizeMode. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitPictureTiling:aPictureTiling [
	^ self visitAccessProperty: aPictureTiling. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitPictureType:aPictureType [
	^ self visitAccessProperty: aPictureType. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitPressedColor:aPressedColor [
	^ self visitAccessProperty: aPressedColor. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitPressedForeColor:aPressedForeColor [
	^ self visitAccessProperty: aPressedForeColor. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitPressedForeShade:aPressedForeShade [
	^ self visitAccessProperty: aPressedForeShade. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitPressedForeThemeColorIndex:aPressedForeThemeColorIndex [
	^ self visitAccessProperty: aPressedForeThemeColorIndex. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitPressedForeTint:aPressedForeTint [
	^ self visitAccessProperty: aPressedForeTint. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitPressedShade:aPressedShade [
	^ self visitAccessProperty: aPressedShade. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitPressedThemeColorIndex:aPressedThemeColorIndex [
	^ self visitAccessProperty: aPressedThemeColorIndex. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitPressedTint:aPressedTint [
	^ self visitAccessProperty: aPressedTint. 

]

{ #category : #'visit-first-objects' }
JinVisitor >> visitProject: aJinAccessProject [
	self visitCollection: aJinAccessProject references.
	self visitCollection: aJinAccessProject tables.
	self visitCollection: aJinAccessProject queries.
	self visitCollection: aJinAccessProject modules.
	self visitCollection: aJinAccessProject reports.
	self visitCollection: aJinAccessProject forms.
	self visitCollection: aJinAccessProject relations
	"	self visitCollection: aJinAccessProject macros."
]

{ #category : #'visit-first-objects' }
JinVisitor >> visitQuery: aJinQuery [ 
	" Not yer something to do "
]

{ #category : #'visit-control-properties' }
JinVisitor >> visitQuickStyle:aQuickStyle [
	^ self visitAccessProperty: aQuickStyle. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitQuickStyleMask:aQuickStyleMask [
	^ self visitAccessProperty: aQuickStyleMask. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitReadingOrder:aReadingOrder [
	^ self visitAccessProperty: aReadingOrder. 

]

{ #category : #'visit-controls' }
JinVisitor >> visitRectangle: aJinControlRectangle [
	self visitFormControl: aJinControlRectangle
]

{ #category : #'visit-first-objects' }
JinVisitor >> visitReference: aJinReference [ 


	self visitHandleObject: aJinReference 
]

{ #category : #'visit-first-objects' }
JinVisitor >> visitReport: aJinReport [
	aJinReport hasModule
		ifTrue: [ aJinReport module acceptVisitor: self ].
	self visitCollection: aJinReport controls
]

{ #category : #'visit-control-properties' }
JinVisitor >> visitRightMargin:aRightMargin [
	^ self visitAccessProperty: aRightMargin. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitRightPadding:aRightPadding [
	^ self visitAccessProperty: aRightPadding. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitRowEnd:aRowEnd [
	^ self visitAccessProperty: aRowEnd. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitRowSource:aRowSource [
	^ self visitAccessProperty: aRowSource. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitRowSourceType:aRowSourceType [
	^ self visitAccessProperty: aRowSourceType. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitRowStart:aRowStart [
	^ self visitAccessProperty: aRowStart. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitScrollBarAlign:aScrollBarAlign [
	^ self visitAccessProperty: aScrollBarAlign. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitScrollBars:aScrollBars [
	^ self visitAccessProperty: aScrollBars. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitSection:aSection [
	^ self visitAccessProperty: aSection. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitSelLength:aSelLength [
	^ self visitAccessProperty: aSelLength. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitSelStart:aSelStart [
	^ self visitAccessProperty: aSelStart. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitSelText:aSelText [
	^ self visitAccessProperty: aSelText. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitSeparatorCharacters:aSeparatorCharacters [
	^ self visitAccessProperty: aSeparatorCharacters. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitShadow:aShadow [
	^ self visitAccessProperty: aShadow. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitShape:aShape [
	^ self visitAccessProperty: aShape. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitShortcutMenuBar:aShortcutMenuBar [
	^ self visitAccessProperty: aShortcutMenuBar. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitShowDatePicker:aShowDatePicker [
	^ self visitAccessProperty: aShowDatePicker. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitShowOnlyRowSourceValues:aShowOnlyRowSourceValues [
	^ self visitAccessProperty: aShowOnlyRowSourceValues. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitShowPageHeaderAndPageFooter:aShowPageHeaderAndPageFooter [
	^ self visitAccessProperty: aShowPageHeaderAndPageFooter. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitSizeMode:aSizeMode [
	^ self visitAccessProperty: aSizeMode. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitSmartTags:aSmartTags [
	^ self visitAccessProperty: aSmartTags. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitSoftEdges:aSoftEdges [
	^ self visitAccessProperty: aSoftEdges. 

]

{ #category : #'visit-first-objects' }
JinVisitor >> visitSourceCode: aJinSourceCode [ 
	self visitHandleObject: aJinSourceCode 
]

{ #category : #'visit-control-properties' }
JinVisitor >> visitSourceObject:aSourceObject [
	^ self visitAccessProperty: aSourceObject. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitSpecialEffect:aSpecialEffect [
	^ self visitAccessProperty: aSpecialEffect. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitStatusBarText:aStatusBarText [
	^ self visitAccessProperty: aStatusBarText. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitStyle:aStyle [
	^ self visitAccessProperty: aStyle. 

]

{ #category : #'visit-controls' }
JinVisitor >> visitSubForm: aJinControlSubForm [
	self visitFormControl: aJinControlSubForm
]

{ #category : #'visit-controls' }
JinVisitor >> visitTabControl: aJinControlTabControl [
	self visitFormControl: aJinControlTabControl
]

{ #category : #'visit-control-properties' }
JinVisitor >> visitTabFixedHeight:aTabFixedHeight [
	^ self visitAccessProperty: aTabFixedHeight. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitTabFixedWidth:aTabFixedWidth [
	^ self visitAccessProperty: aTabFixedWidth. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitTabIndex:aTabIndex [
	^ self visitAccessProperty: aTabIndex. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitTabStop:aTabStop [
	^ self visitAccessProperty: aTabStop. 

]

{ #category : #'visit-first-objects' }
JinVisitor >> visitTable: aJinTable [
	self visitCollection: aJinTable indexes.

]

{ #category : #'as yet unclassified' }
JinVisitor >> visitTableRelation: aJinTableRelation [
	self subclassResponsibility
]

{ #category : #'visit-control-properties' }
JinVisitor >> visitTag:aTag [
	^ self visitAccessProperty: aTag. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitText:aText [
	^ self visitAccessProperty: aText. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitTextAlign:aTextAlign [
	^ self visitAccessProperty: aTextAlign. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitTextFontCharSet:aTextFontCharSet [
	^ self visitAccessProperty: aTextFontCharSet. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitTextFormat:aTextFormat [
	^ self visitAccessProperty: aTextFormat. 

]

{ #category : #'visit-controls' }
JinVisitor >> visitTextbox: aJinControlTextbox [ 
	self visitFormControl: aJinControlTextbox 
]

{ #category : #'visit-control-properties' }
JinVisitor >> visitThemeFontIndex:aThemeFontIndex [
	^ self visitAccessProperty: aThemeFontIndex. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitTop:aTop [
	^ self visitAccessProperty: aTop. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitTopMargin:aTopMargin [
	^ self visitAccessProperty: aTopMargin. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitTopPadding:aTopPadding [
	^ self visitAccessProperty: aTopPadding. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitTransparent:aTransparent [
	^ self visitAccessProperty: aTransparent. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitTripleState:aTripleState [
	^ self visitAccessProperty: aTripleState. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitUseTheme:aUseTheme [
	^ self visitAccessProperty: aUseTheme. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitValidationRule:aValidationRule [
	^ self visitAccessProperty: aValidationRule. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitValidationText:aValidationText [
	^ self visitAccessProperty: aValidationText. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitVertical:aVertical [
	^ self visitAccessProperty: aVertical. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitVerticalAnchor:aVerticalAnchor [
	^ self visitAccessProperty: aVerticalAnchor. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitVisible:aVisible [
	^ self visitAccessProperty: aVisible. 

]

{ #category : #'visit-control-properties' }
JinVisitor >> visitWidth:aWidth [
	^ self visitAccessProperty: aWidth. 

]
