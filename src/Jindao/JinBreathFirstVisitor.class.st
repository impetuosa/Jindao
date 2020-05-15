Class {
	#name : #JinBreathFirstVisitor,
	#superclass : #Object,
	#category : #'Jindao-DomainObjects-Visitor'
}

{ #category : #'visit-first-objects' }
JinBreathFirstVisitor >> visitAccessProperty: anAccessProperty [
	^ self visitHandleObject: anAccessProperty
]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitAfterUpdate:aAfterUpdate [
	^ self visitAccessProperty: aAfterUpdate. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitAfterUpdateEmMacro:aAfterUpdateEmMacro [
	^ self visitAccessProperty: aAfterUpdateEmMacro. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitAggregateType:aAggregateType [
	^ self visitAccessProperty: aAggregateType. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitAlignment:aAlignment [
	^ self visitAccessProperty: aAlignment. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitAllowAutoCorrect:aAllowAutoCorrect [
	^ self visitAccessProperty: aAllowAutoCorrect. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitAllowValueListEdits:aAllowValueListEdits [
	^ self visitAccessProperty: aAllowValueListEdits. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitAsianLineBreak:aAsianLineBreak [
	^ self visitAccessProperty: aAsianLineBreak. 

]

{ #category : #'visit-controls' }
JinBreathFirstVisitor >> visitAttachment: aJinControlAttachment [ 
self visitFormControl: aJinControlAttachment
]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitAutoExpand:aAutoExpand [
	^ self visitAccessProperty: aAutoExpand. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitAutoRepeat:aAutoRepeat [
	^ self visitAccessProperty: aAutoRepeat. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitAutoTab:aAutoTab [
	^ self visitAccessProperty: aAutoTab. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitBackColor:aBackColor [
	^ self visitAccessProperty: aBackColor. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitBackShade:aBackShade [
	^ self visitAccessProperty: aBackShade. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitBackStyle:aBackStyle [
	^ self visitAccessProperty: aBackStyle. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitBackThemeColorIndex:aBackThemeColorIndex [
	^ self visitAccessProperty: aBackThemeColorIndex. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitBackTint:aBackTint [
	^ self visitAccessProperty: aBackTint. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitBeforeUpdate:aBeforeUpdate [
	^ self visitAccessProperty: aBeforeUpdate. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitBeforeUpdateEmMacro:aBeforeUpdateEmMacro [
	^ self visitAccessProperty: aBeforeUpdateEmMacro. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitBevel:aBevel [
	^ self visitAccessProperty: aBevel. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitBorderColor:aBorderColor [
	^ self visitAccessProperty: aBorderColor. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitBorderLineStyle:aBorderLineStyle [
	^ self visitAccessProperty: aBorderLineStyle. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitBorderShade:aBorderShade [
	^ self visitAccessProperty: aBorderShade. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitBorderStyle:aBorderStyle [
	^ self visitAccessProperty: aBorderStyle. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitBorderThemeColorIndex:aBorderThemeColorIndex [
	^ self visitAccessProperty: aBorderThemeColorIndex. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitBorderTint:aBorderTint [
	^ self visitAccessProperty: aBorderTint. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitBorderWidth:aBorderWidth [
	^ self visitAccessProperty: aBorderWidth. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitBottomMargin:aBottomMargin [
	^ self visitAccessProperty: aBottomMargin. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitBottomPadding:aBottomPadding [
	^ self visitAccessProperty: aBottomPadding. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitBoundColumn:aBoundColumn [
	^ self visitAccessProperty: aBoundColumn. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitCanGrow:aCanGrow [
	^ self visitAccessProperty: aCanGrow. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitCanShrink:aCanShrink [
	^ self visitAccessProperty: aCanShrink. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitCancel:aCancel [
	^ self visitAccessProperty: aCancel. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitCaption:aCaption [
	^ self visitAccessProperty: aCaption. 

]

{ #category : #'visit-controls' }
JinBreathFirstVisitor >> visitCheckbox: aJinControlCheckbox [
	self visitFormControl: aJinControlCheckbox
]

{ #category : #'visit-first-objects' }
JinBreathFirstVisitor >> visitCollection: aCollection [
	aCollection do: [ :element | element acceptVisitor: self ]
]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitColumnCount:aColumnCount [
	^ self visitAccessProperty: aColumnCount. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitColumnEnd:aColumnEnd [
	^ self visitAccessProperty: aColumnEnd. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitColumnHeads:aColumnHeads [
	^ self visitAccessProperty: aColumnHeads. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitColumnHidden:aColumnHidden [
	^ self visitAccessProperty: aColumnHidden. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitColumnOrder:aColumnOrder [
	^ self visitAccessProperty: aColumnOrder. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitColumnStart:aColumnStart [
	^ self visitAccessProperty: aColumnStart. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitColumnWidth:aColumnWidth [
	^ self visitAccessProperty: aColumnWidth. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitColumnWidths:aColumnWidths [
	^ self visitAccessProperty: aColumnWidths. 

]

{ #category : #'visit-controls' }
JinBreathFirstVisitor >> visitCombobox: aJinControlCombobox [
	self visitFormControl: aJinControlCombobox
]

{ #category : #'visit-controls' }
JinBreathFirstVisitor >> visitCommandButton: aJinControlCommandButton [ 
	self visitFormControl: aJinControlCommandButton
]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitConditionalFormat14:aConditionalFormat14 [
	^ self visitAccessProperty: aConditionalFormat14. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitConditionalFormat:aConditionalFormat [
	^ self visitAccessProperty: aConditionalFormat. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitControlSource:aControlSource [
	^ self visitAccessProperty: aControlSource. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitControlTipText:aControlTipText [
	^ self visitAccessProperty: aControlTipText. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitControlType:aControlType [
	^ self visitAccessProperty: aControlType. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitCursorOnHover:aCursorOnHover [
	^ self visitAccessProperty: aCursorOnHover. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitDatasheetCaption:aDatasheetCaption [
	^ self visitAccessProperty: aDatasheetCaption. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitDecimalPlaces:aDecimalPlaces [
	^ self visitAccessProperty: aDecimalPlaces. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitDefault:aDefault [
	^ self visitAccessProperty: aDefault. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitDefaultPicture:aDefaultPicture [
	^ self visitAccessProperty: aDefaultPicture. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitDefaultPictureType:aDefaultPictureType [
	^ self visitAccessProperty: aDefaultPictureType. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitDefaultValue:aDefaultValue [
	^ self visitAccessProperty: aDefaultValue. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitDisplayAs:aDisplayAs [
	^ self visitAccessProperty: aDisplayAs. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitDisplayAsHyperlink:aDisplayAsHyperlink [
	^ self visitAccessProperty: aDisplayAsHyperlink. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitDisplayWhen:aDisplayWhen [
	^ self visitAccessProperty: aDisplayWhen. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitEnabled:aEnabled [
	^ self visitAccessProperty: aEnabled. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitEnterKeyBehavior:aEnterKeyBehavior [
	^ self visitAccessProperty: aEnterKeyBehavior. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitEventProcPrefix:aEventProcPrefix [
	^ self visitAccessProperty: aEventProcPrefix. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitFilterLookup:aFilterLookup [
	^ self visitAccessProperty: aFilterLookup. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitFilterOnEmptyMaster:aFilterOnEmptyMaster [
	^ self visitAccessProperty: aFilterOnEmptyMaster. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitFontBold:aFontBold [
	^ self visitAccessProperty: aFontBold. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitFontItalic:aFontItalic [
	^ self visitAccessProperty: aFontItalic. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitFontName:aFontName [
	^ self visitAccessProperty: aFontName. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitFontSize:aFontSize [
	^ self visitAccessProperty: aFontSize. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitFontUnderline:aFontUnderline [
	^ self visitAccessProperty: aFontUnderline. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitFontWeight:aFontWeight [
	^ self visitAccessProperty: aFontWeight. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitForeColor:aForeColor [
	^ self visitAccessProperty: aForeColor. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitForeShade:aForeShade [
	^ self visitAccessProperty: aForeShade. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitForeThemeColorIndex:aForeThemeColorIndex [
	^ self visitAccessProperty: aForeThemeColorIndex. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitForeTint:aForeTint [
	^ self visitAccessProperty: aForeTint. 

]

{ #category : #'visit-first-objects' }
JinBreathFirstVisitor >> visitForm: aJinForm [
	aJinForm hasModule ifTrue: [  aJinForm module acceptVisitor: self  ].
	self visitCollection: aJinForm controls 
]

{ #category : #'visit-first-objects' }
JinBreathFirstVisitor >> visitFormControl: aJinControlTextbox [ 
	self visitHandleObject: aJinControlTextbox 
]

{ #category : #'visit-first-objects' }
JinBreathFirstVisitor >> visitFormModule: aJinFormModule [ 
	self visitModule: aJinFormModule 
]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitFormat:aFormat [
	^ self visitAccessProperty: aFormat. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitFuriganaControl:aFuriganaControl [
	^ self visitAccessProperty: aFuriganaControl. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitGlow:aGlow [
	^ self visitAccessProperty: aGlow. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitGradient:aGradient [
	^ self visitAccessProperty: aGradient. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitGridlineColor:aGridlineColor [
	^ self visitAccessProperty: aGridlineColor. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitGridlineShade:aGridlineShade [
	^ self visitAccessProperty: aGridlineShade. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitGridlineStyleBottom:aGridlineStyleBottom [
	^ self visitAccessProperty: aGridlineStyleBottom. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitGridlineStyleLeft:aGridlineStyleLeft [
	^ self visitAccessProperty: aGridlineStyleLeft. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitGridlineStyleRight:aGridlineStyleRight [
	^ self visitAccessProperty: aGridlineStyleRight. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitGridlineStyleTop:aGridlineStyleTop [
	^ self visitAccessProperty: aGridlineStyleTop. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitGridlineThemeColorIndex:aGridlineThemeColorIndex [
	^ self visitAccessProperty: aGridlineThemeColorIndex. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitGridlineTint:aGridlineTint [
	^ self visitAccessProperty: aGridlineTint. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitGridlineWidthBottom:aGridlineWidthBottom [
	^ self visitAccessProperty: aGridlineWidthBottom. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitGridlineWidthLeft:aGridlineWidthLeft [
	^ self visitAccessProperty: aGridlineWidthLeft. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitGridlineWidthRight:aGridlineWidthRight [
	^ self visitAccessProperty: aGridlineWidthRight. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitGridlineWidthTop:aGridlineWidthTop [
	^ self visitAccessProperty: aGridlineWidthTop. 

]

{ #category : #'visit-first-objects' }
JinBreathFirstVisitor >> visitHandleObject: aJinReference [ 
	" Leaf object arriving "
]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitHeight:aHeight [
	^ self visitAccessProperty: aHeight. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitHelpContextId:aHelpContextId [
	^ self visitAccessProperty: aHelpContextId. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitHorizontalAnchor:aHorizontalAnchor [
	^ self visitAccessProperty: aHorizontalAnchor. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitHoverColor:aHoverColor [
	^ self visitAccessProperty: aHoverColor. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitHoverForeColor:aHoverForeColor [
	^ self visitAccessProperty: aHoverForeColor. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitHoverForeShade:aHoverForeShade [
	^ self visitAccessProperty: aHoverForeShade. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitHoverForeThemeColorIndex:aHoverForeThemeColorIndex [
	^ self visitAccessProperty: aHoverForeThemeColorIndex. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitHoverForeTint:aHoverForeTint [
	^ self visitAccessProperty: aHoverForeTint. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitHoverShade:aHoverShade [
	^ self visitAccessProperty: aHoverShade. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitHoverThemeColorIndex:aHoverThemeColorIndex [
	^ self visitAccessProperty: aHoverThemeColorIndex. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitHoverTint:aHoverTint [
	^ self visitAccessProperty: aHoverTint. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitHyperlinkAddress:aHyperlinkAddress [
	^ self visitAccessProperty: aHyperlinkAddress. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitHyperlinkBinderDescription:aHyperlinkBinderDescription [
	^ self visitAccessProperty: aHyperlinkBinderDescription. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitHyperlinkSubAddress:aHyperlinkSubAddress [
	^ self visitAccessProperty: aHyperlinkSubAddress. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitHyperlinkTarget:aHyperlinkTarget [
	^ self visitAccessProperty: aHyperlinkTarget. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitIMEHold:aIMEHold [
	^ self visitAccessProperty: aIMEHold. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitIMEMode:aIMEMode [
	^ self visitAccessProperty: aIMEMode. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitIMESentenceMode:aIMESentenceMode [
	^ self visitAccessProperty: aIMESentenceMode. 

]

{ #category : #'visit-controls' }
JinBreathFirstVisitor >> visitImage: aJinControlImage [ 
	self visitFormControl: aJinControlImage 
]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitImageData:aImageData [
	^ self visitAccessProperty: aImageData. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitImageHeight:aImageHeight [
	^ self visitAccessProperty: aImageHeight. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitImageWidth:aImageWidth [
	^ self visitAccessProperty: aImageWidth. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitInSelection:aInSelection [
	^ self visitAccessProperty: aInSelection. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitInheritValueList:aInheritValueList [
	^ self visitAccessProperty: aInheritValueList. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitInputMask:aInputMask [
	^ self visitAccessProperty: aInputMask. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitIsHyperlink:aIsHyperlink [
	^ self visitAccessProperty: aIsHyperlink. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitKeyboardLanguage:aKeyboardLanguage [
	^ self visitAccessProperty: aKeyboardLanguage. 

]

{ #category : #'visit-controls' }
JinBreathFirstVisitor >> visitLabel: aJinControlLabel [ 
		self visitFormControl: aJinControlLabel
]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitLabelName:aLabelName [
	^ self visitAccessProperty: aLabelName. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitLayout:aLayout [
	^ self visitAccessProperty: aLayout. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitLayoutID:aLayoutID [
	^ self visitAccessProperty: aLayoutID. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitLeft:aLeft [
	^ self visitAccessProperty: aLeft. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitLeftMargin:aLeftMargin [
	^ self visitAccessProperty: aLeftMargin. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitLeftPadding:aLeftPadding [
	^ self visitAccessProperty: aLeftPadding. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitLimitToList:aLimitToList [
	^ self visitAccessProperty: aLimitToList. 

]

{ #category : #'visit-controls' }
JinBreathFirstVisitor >> visitLine: aJinControlLine [ 
	self visitFormControl: aJinControlLine
]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitLineSlant:aLineSlant [
	^ self visitAccessProperty: aLineSlant. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitLineSpacing:aLineSpacing [
	^ self visitAccessProperty: aLineSpacing. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitLinkChildFields:aLinkChildFields [
	^ self visitAccessProperty: aLinkChildFields. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitLinkMasterFields:aLinkMasterFields [
	^ self visitAccessProperty: aLinkMasterFields. 

]

{ #category : #'visit-controls' }
JinBreathFirstVisitor >> visitListBox: aJinControlListBox [ 
	self visitFormControl: aJinControlListBox 
]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitListCount:aListCount [
	^ self visitAccessProperty: aListCount. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitListIndex:aListIndex [
	^ self visitAccessProperty: aListIndex. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitListItemsEditForm:aListItemsEditForm [
	^ self visitAccessProperty: aListItemsEditForm. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitListRows:aListRows [
	^ self visitAccessProperty: aListRows. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitListWidth:aListWidth [
	^ self visitAccessProperty: aListWidth. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitLocked:aLocked [
	^ self visitAccessProperty: aLocked. 

]

{ #category : #'visit-first-objects' }
JinBreathFirstVisitor >> visitModule: aJinModule [ 
	aJinModule code acceptVisitor: self.
	
]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitMultiRow:aMultiRow [
	^ self visitAccessProperty: aMultiRow. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitMultiSelect:aMultiSelect [
	^ self visitAccessProperty: aMultiSelect. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitName:aName [
	^ self visitAccessProperty: aName. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitNumeralShapes:aNumeralShapes [
	^ self visitAccessProperty: aNumeralShapes. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitObjectPalette:aObjectPalette [
	^ self visitAccessProperty: aObjectPalette. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOldBorderStyle:aOldBorderStyle [
	^ self visitAccessProperty: aOldBorderStyle. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnAttachmentCurrent:aOnAttachmentCurrent [
	^ self visitAccessProperty: aOnAttachmentCurrent. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnAttachmentCurrentEmMacro:aOnAttachmentCurrentEmMacro [
	^ self visitAccessProperty: aOnAttachmentCurrentEmMacro. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnChange:aOnChange [
	^ self visitAccessProperty: aOnChange. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnChangeEmMacro:aOnChangeEmMacro [
	^ self visitAccessProperty: aOnChangeEmMacro. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnClick:aOnClick [
	^ self visitAccessProperty: aOnClick. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnClickEmMacro:aOnClickEmMacro [
	^ self visitAccessProperty: aOnClickEmMacro. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnDblClick:aOnDblClick [
	^ self visitAccessProperty: aOnDblClick. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnDblClickEmMacro:aOnDblClickEmMacro [
	^ self visitAccessProperty: aOnDblClickEmMacro. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnDirty:aOnDirty [
	^ self visitAccessProperty: aOnDirty. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnDirtyEmMacro:aOnDirtyEmMacro [
	^ self visitAccessProperty: aOnDirtyEmMacro. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnEnter:aOnEnter [
	^ self visitAccessProperty: aOnEnter. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnEnterEmMacro:aOnEnterEmMacro [
	^ self visitAccessProperty: aOnEnterEmMacro. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnExit:aOnExit [
	^ self visitAccessProperty: aOnExit. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnExitEmMacro:aOnExitEmMacro [
	^ self visitAccessProperty: aOnExitEmMacro. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnGotFocus:aOnGotFocus [
	^ self visitAccessProperty: aOnGotFocus. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnGotFocusEmMacro:aOnGotFocusEmMacro [
	^ self visitAccessProperty: aOnGotFocusEmMacro. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnKeyDown:aOnKeyDown [
	^ self visitAccessProperty: aOnKeyDown. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnKeyDownEmMacro:aOnKeyDownEmMacro [
	^ self visitAccessProperty: aOnKeyDownEmMacro. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnKeyPress:aOnKeyPress [
	^ self visitAccessProperty: aOnKeyPress. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnKeyPressEmMacro:aOnKeyPressEmMacro [
	^ self visitAccessProperty: aOnKeyPressEmMacro. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnKeyUp:aOnKeyUp [
	^ self visitAccessProperty: aOnKeyUp. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnKeyUpEmMacro:aOnKeyUpEmMacro [
	^ self visitAccessProperty: aOnKeyUpEmMacro. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnLostFocus:aOnLostFocus [
	^ self visitAccessProperty: aOnLostFocus. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnLostFocusEmMacro:aOnLostFocusEmMacro [
	^ self visitAccessProperty: aOnLostFocusEmMacro. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnMouseDown:aOnMouseDown [
	^ self visitAccessProperty: aOnMouseDown. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnMouseDownEmMacro:aOnMouseDownEmMacro [
	^ self visitAccessProperty: aOnMouseDownEmMacro. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnMouseMove:aOnMouseMove [
	^ self visitAccessProperty: aOnMouseMove. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnMouseMoveEmMacro:aOnMouseMoveEmMacro [
	^ self visitAccessProperty: aOnMouseMoveEmMacro. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnMouseUp:aOnMouseUp [
	^ self visitAccessProperty: aOnMouseUp. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnMouseUpEmMacro:aOnMouseUpEmMacro [
	^ self visitAccessProperty: aOnMouseUpEmMacro. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnNotInList:aOnNotInList [
	^ self visitAccessProperty: aOnNotInList. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnNotInListEmMacro:aOnNotInListEmMacro [
	^ self visitAccessProperty: aOnNotInListEmMacro. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnUndo:aOnUndo [
	^ self visitAccessProperty: aOnUndo. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitOnUndoEmMacro:aOnUndoEmMacro [
	^ self visitAccessProperty: aOnUndoEmMacro. 

]

{ #category : #'visit-controls' }
JinBreathFirstVisitor >> visitPage: aJinControlPage [
	self visitFormControl: aJinControlPage
]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitPageIndex:aPageIndex [
	^ self visitAccessProperty: aPageIndex. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitPicture:aPicture [
	^ self visitAccessProperty: aPicture. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitPictureAlignment:aPictureAlignment [
	^ self visitAccessProperty: aPictureAlignment. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitPictureCaptionArrangement:aPictureCaptionArrangement [
	^ self visitAccessProperty: aPictureCaptionArrangement. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitPictureData:aPictureData [
	^ self visitAccessProperty: aPictureData. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitPictureSizeMode:aPictureSizeMode [
	^ self visitAccessProperty: aPictureSizeMode. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitPictureTiling:aPictureTiling [
	^ self visitAccessProperty: aPictureTiling. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitPictureType:aPictureType [
	^ self visitAccessProperty: aPictureType. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitPressedColor:aPressedColor [
	^ self visitAccessProperty: aPressedColor. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitPressedForeColor:aPressedForeColor [
	^ self visitAccessProperty: aPressedForeColor. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitPressedForeShade:aPressedForeShade [
	^ self visitAccessProperty: aPressedForeShade. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitPressedForeThemeColorIndex:aPressedForeThemeColorIndex [
	^ self visitAccessProperty: aPressedForeThemeColorIndex. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitPressedForeTint:aPressedForeTint [
	^ self visitAccessProperty: aPressedForeTint. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitPressedShade:aPressedShade [
	^ self visitAccessProperty: aPressedShade. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitPressedThemeColorIndex:aPressedThemeColorIndex [
	^ self visitAccessProperty: aPressedThemeColorIndex. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitPressedTint:aPressedTint [
	^ self visitAccessProperty: aPressedTint. 

]

{ #category : #'visit-first-objects' }
JinBreathFirstVisitor >> visitProject: aJinAccessProject [
	self visitCollection: aJinAccessProject references.
	self visitCollection: aJinAccessProject modules.
	self visitCollection: aJinAccessProject forms.
	self visitCollection: aJinAccessProject queries.
	self visitCollection: aJinAccessProject reports.
	self visitCollection: aJinAccessProject tables
]

{ #category : #'visit-first-objects' }
JinBreathFirstVisitor >> visitQuery: aJinQuery [ 
	" Not yer something to do "
]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitQuickStyle:aQuickStyle [
	^ self visitAccessProperty: aQuickStyle. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitQuickStyleMask:aQuickStyleMask [
	^ self visitAccessProperty: aQuickStyleMask. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitReadingOrder:aReadingOrder [
	^ self visitAccessProperty: aReadingOrder. 

]

{ #category : #'visit-controls' }
JinBreathFirstVisitor >> visitRectangle: aJinControlRectangle [
	self visitFormControl: aJinControlRectangle
]

{ #category : #'visit-first-objects' }
JinBreathFirstVisitor >> visitReference: aJinReference [ 


	self visitHandleObject: aJinReference 
]

{ #category : #'visit-first-objects' }
JinBreathFirstVisitor >> visitReport: aJinReport [ 
	" Visiting "
]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitRightMargin:aRightMargin [
	^ self visitAccessProperty: aRightMargin. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitRightPadding:aRightPadding [
	^ self visitAccessProperty: aRightPadding. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitRowEnd:aRowEnd [
	^ self visitAccessProperty: aRowEnd. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitRowSource:aRowSource [
	^ self visitAccessProperty: aRowSource. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitRowSourceType:aRowSourceType [
	^ self visitAccessProperty: aRowSourceType. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitRowStart:aRowStart [
	^ self visitAccessProperty: aRowStart. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitScrollBarAlign:aScrollBarAlign [
	^ self visitAccessProperty: aScrollBarAlign. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitScrollBars:aScrollBars [
	^ self visitAccessProperty: aScrollBars. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitSection:aSection [
	^ self visitAccessProperty: aSection. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitSelLength:aSelLength [
	^ self visitAccessProperty: aSelLength. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitSelStart:aSelStart [
	^ self visitAccessProperty: aSelStart. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitSelText:aSelText [
	^ self visitAccessProperty: aSelText. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitSeparatorCharacters:aSeparatorCharacters [
	^ self visitAccessProperty: aSeparatorCharacters. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitShadow:aShadow [
	^ self visitAccessProperty: aShadow. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitShape:aShape [
	^ self visitAccessProperty: aShape. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitShortcutMenuBar:aShortcutMenuBar [
	^ self visitAccessProperty: aShortcutMenuBar. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitShowDatePicker:aShowDatePicker [
	^ self visitAccessProperty: aShowDatePicker. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitShowOnlyRowSourceValues:aShowOnlyRowSourceValues [
	^ self visitAccessProperty: aShowOnlyRowSourceValues. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitShowPageHeaderAndPageFooter:aShowPageHeaderAndPageFooter [
	^ self visitAccessProperty: aShowPageHeaderAndPageFooter. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitSizeMode:aSizeMode [
	^ self visitAccessProperty: aSizeMode. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitSmartTags:aSmartTags [
	^ self visitAccessProperty: aSmartTags. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitSoftEdges:aSoftEdges [
	^ self visitAccessProperty: aSoftEdges. 

]

{ #category : #'visit-first-objects' }
JinBreathFirstVisitor >> visitSourceCode: aJinSourceCode [ 
	self visitHandleObject: aJinSourceCode 
]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitSourceObject:aSourceObject [
	^ self visitAccessProperty: aSourceObject. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitSpecialEffect:aSpecialEffect [
	^ self visitAccessProperty: aSpecialEffect. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitStatusBarText:aStatusBarText [
	^ self visitAccessProperty: aStatusBarText. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitStyle:aStyle [
	^ self visitAccessProperty: aStyle. 

]

{ #category : #'visit-controls' }
JinBreathFirstVisitor >> visitSubForm: aJinControlSubForm [ 
		self visitFormControl: aJinControlSubForm
]

{ #category : #'visit-controls' }
JinBreathFirstVisitor >> visitTabControl: aJinControlTabControl [
	self visitFormControl: aJinControlTabControl
]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitTabFixedHeight:aTabFixedHeight [
	^ self visitAccessProperty: aTabFixedHeight. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitTabFixedWidth:aTabFixedWidth [
	^ self visitAccessProperty: aTabFixedWidth. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitTabIndex:aTabIndex [
	^ self visitAccessProperty: aTabIndex. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitTabStop:aTabStop [
	^ self visitAccessProperty: aTabStop. 

]

{ #category : #'visit-first-objects' }
JinBreathFirstVisitor >> visitTable: aJinTable [ 
	
]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitTag:aTag [
	^ self visitAccessProperty: aTag. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitText:aText [
	^ self visitAccessProperty: aText. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitTextAlign:aTextAlign [
	^ self visitAccessProperty: aTextAlign. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitTextFontCharSet:aTextFontCharSet [
	^ self visitAccessProperty: aTextFontCharSet. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitTextFormat:aTextFormat [
	^ self visitAccessProperty: aTextFormat. 

]

{ #category : #'visit-controls' }
JinBreathFirstVisitor >> visitTextbox: aJinControlTextbox [ 
	self visitFormControl: aJinControlTextbox 
]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitThemeFontIndex:aThemeFontIndex [
	^ self visitAccessProperty: aThemeFontIndex. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitTop:aTop [
	^ self visitAccessProperty: aTop. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitTopMargin:aTopMargin [
	^ self visitAccessProperty: aTopMargin. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitTopPadding:aTopPadding [
	^ self visitAccessProperty: aTopPadding. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitTransparent:aTransparent [
	^ self visitAccessProperty: aTransparent. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitTripleState:aTripleState [
	^ self visitAccessProperty: aTripleState. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitUseTheme:aUseTheme [
	^ self visitAccessProperty: aUseTheme. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitValidationRule:aValidationRule [
	^ self visitAccessProperty: aValidationRule. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitValidationText:aValidationText [
	^ self visitAccessProperty: aValidationText. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitVertical:aVertical [
	^ self visitAccessProperty: aVertical. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitVerticalAnchor:aVerticalAnchor [
	^ self visitAccessProperty: aVerticalAnchor. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitVisible:aVisible [
	^ self visitAccessProperty: aVisible. 

]

{ #category : #'visit-control-properties' }
JinBreathFirstVisitor >> visitWidth:aWidth [
	^ self visitAccessProperty: aWidth. 

]
