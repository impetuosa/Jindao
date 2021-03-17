Class {
	#name : #JinGUIControlVisitor,
	#superclass : #JinSubvisitor,
	#category : #'Jindao-Subvisitor'
}

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> control [
	^ self
]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitAfterUpdate:aAfterUpdate [
	^ self visitAccessProperty: aAfterUpdate. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitAfterUpdateEmMacro:aAfterUpdateEmMacro [
	^ self visitAccessProperty: aAfterUpdateEmMacro. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitAggregateType:aAggregateType [
	^ self visitAccessProperty: aAggregateType. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitAlignment:aAlignment [
	^ self visitAccessProperty: aAlignment. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitAllowAutoCorrect:aAllowAutoCorrect [
	^ self visitAccessProperty: aAllowAutoCorrect. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitAllowValueListEdits:aAllowValueListEdits [
	^ self visitAccessProperty: aAllowValueListEdits. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitAsianLineBreak:aAsianLineBreak [
	^ self visitAccessProperty: aAsianLineBreak. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitAutoExpand:aAutoExpand [
	^ self visitAccessProperty: aAutoExpand. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitAutoRepeat:aAutoRepeat [
	^ self visitAccessProperty: aAutoRepeat. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitAutoTab:aAutoTab [
	^ self visitAccessProperty: aAutoTab. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitBackColor:aBackColor [
	^ self visitAccessProperty: aBackColor. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitBackShade:aBackShade [
	^ self visitAccessProperty: aBackShade. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitBackStyle:aBackStyle [
	^ self visitAccessProperty: aBackStyle. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitBackThemeColorIndex:aBackThemeColorIndex [
	^ self visitAccessProperty: aBackThemeColorIndex. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitBackTint:aBackTint [
	^ self visitAccessProperty: aBackTint. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitBeforeUpdate:aBeforeUpdate [
	^ self visitAccessProperty: aBeforeUpdate. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitBeforeUpdateEmMacro:aBeforeUpdateEmMacro [
	^ self visitAccessProperty: aBeforeUpdateEmMacro. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitBevel:aBevel [
	^ self visitAccessProperty: aBevel. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitBorderColor:aBorderColor [
	^ self visitAccessProperty: aBorderColor. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitBorderLineStyle:aBorderLineStyle [
	^ self visitAccessProperty: aBorderLineStyle. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitBorderShade:aBorderShade [
	^ self visitAccessProperty: aBorderShade. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitBorderStyle:aBorderStyle [
	^ self visitAccessProperty: aBorderStyle. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitBorderThemeColorIndex:aBorderThemeColorIndex [
	^ self visitAccessProperty: aBorderThemeColorIndex. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitBorderTint:aBorderTint [
	^ self visitAccessProperty: aBorderTint. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitBorderWidth:aBorderWidth [
	^ self visitAccessProperty: aBorderWidth. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitBottomMargin:aBottomMargin [
	^ self visitAccessProperty: aBottomMargin. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitBottomPadding:aBottomPadding [
	^ self visitAccessProperty: aBottomPadding. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitBoundColumn:aBoundColumn [
	^ self visitAccessProperty: aBoundColumn. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitCanGrow:aCanGrow [
	^ self visitAccessProperty: aCanGrow. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitCanShrink:aCanShrink [
	^ self visitAccessProperty: aCanShrink. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitCancel:aCancel [
	^ self visitAccessProperty: aCancel. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitCaption:aCaption [
	^ self visitAccessProperty: aCaption. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitColumnCount:aColumnCount [
	^ self visitAccessProperty: aColumnCount. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitColumnEnd:aColumnEnd [
	^ self visitAccessProperty: aColumnEnd. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitColumnHeads:aColumnHeads [
	^ self visitAccessProperty: aColumnHeads. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitColumnHidden:aColumnHidden [
	^ self visitAccessProperty: aColumnHidden. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitColumnOrder:aColumnOrder [
	^ self visitAccessProperty: aColumnOrder. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitColumnStart:aColumnStart [
	^ self visitAccessProperty: aColumnStart. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitColumnWidth:aColumnWidth [
	^ self visitAccessProperty: aColumnWidth. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitColumnWidths:aColumnWidths [
	^ self visitAccessProperty: aColumnWidths. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitConditionalFormat14:aConditionalFormat14 [
	^ self visitAccessProperty: aConditionalFormat14. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitConditionalFormat:aConditionalFormat [
	^ self visitAccessProperty: aConditionalFormat. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitControlSource:aControlSource [
	^ self visitAccessProperty: aControlSource. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitControlTipText:aControlTipText [
	^ self visitAccessProperty: aControlTipText. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitControlType:aControlType [
	^ self visitAccessProperty: aControlType. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitCursorOnHover:aCursorOnHover [
	^ self visitAccessProperty: aCursorOnHover. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitDatasheetCaption:aDatasheetCaption [
	^ self visitAccessProperty: aDatasheetCaption. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitDecimalPlaces:aDecimalPlaces [
	^ self visitAccessProperty: aDecimalPlaces. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitDefault:aDefault [
	^ self visitAccessProperty: aDefault. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitDefaultPicture:aDefaultPicture [
	^ self visitAccessProperty: aDefaultPicture. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitDefaultPictureType:aDefaultPictureType [
	^ self visitAccessProperty: aDefaultPictureType. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitDefaultValue:aDefaultValue [
	^ self visitAccessProperty: aDefaultValue. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitDisplayAs:aDisplayAs [
	^ self visitAccessProperty: aDisplayAs. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitDisplayAsHyperlink:aDisplayAsHyperlink [
	^ self visitAccessProperty: aDisplayAsHyperlink. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitDisplayWhen:aDisplayWhen [
	^ self visitAccessProperty: aDisplayWhen. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitEnabled:aEnabled [
	^ self visitAccessProperty: aEnabled. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitEnterKeyBehavior:aEnterKeyBehavior [
	^ self visitAccessProperty: aEnterKeyBehavior. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitEventProcPrefix:aEventProcPrefix [
	^ self visitAccessProperty: aEventProcPrefix. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitFilterLookup:aFilterLookup [
	^ self visitAccessProperty: aFilterLookup. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitFilterOnEmptyMaster:aFilterOnEmptyMaster [
	^ self visitAccessProperty: aFilterOnEmptyMaster. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitFontBold:aFontBold [
	^ self visitAccessProperty: aFontBold. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitFontItalic:aFontItalic [
	^ self visitAccessProperty: aFontItalic. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitFontName:aFontName [
	^ self visitAccessProperty: aFontName. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitFontSize:aFontSize [
	^ self visitAccessProperty: aFontSize. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitFontUnderline:aFontUnderline [
	^ self visitAccessProperty: aFontUnderline. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitFontWeight:aFontWeight [
	^ self visitAccessProperty: aFontWeight. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitForeColor:aForeColor [
	^ self visitAccessProperty: aForeColor. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitForeShade:aForeShade [
	^ self visitAccessProperty: aForeShade. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitForeThemeColorIndex:aForeThemeColorIndex [
	^ self visitAccessProperty: aForeThemeColorIndex. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitForeTint:aForeTint [
	^ self visitAccessProperty: aForeTint. 

]

{ #category : #'entry-point' }
JinGUIControlVisitor >> visitFormControl: aJinControlObject [
	self visitHandleObject: aJinControlObject.
	self control visitCollection: aJinControlObject properties
]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitFormat:aFormat [
	^ self visitAccessProperty: aFormat. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitFuriganaControl:aFuriganaControl [
	^ self visitAccessProperty: aFuriganaControl. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitGlow:aGlow [
	^ self visitAccessProperty: aGlow. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitGradient:aGradient [
	^ self visitAccessProperty: aGradient. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitGridlineColor:aGridlineColor [
	^ self visitAccessProperty: aGridlineColor. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitGridlineShade:aGridlineShade [
	^ self visitAccessProperty: aGridlineShade. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitGridlineStyleBottom:aGridlineStyleBottom [
	^ self visitAccessProperty: aGridlineStyleBottom. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitGridlineStyleLeft:aGridlineStyleLeft [
	^ self visitAccessProperty: aGridlineStyleLeft. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitGridlineStyleRight:aGridlineStyleRight [
	^ self visitAccessProperty: aGridlineStyleRight. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitGridlineStyleTop:aGridlineStyleTop [
	^ self visitAccessProperty: aGridlineStyleTop. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitGridlineThemeColorIndex:aGridlineThemeColorIndex [
	^ self visitAccessProperty: aGridlineThemeColorIndex. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitGridlineTint:aGridlineTint [
	^ self visitAccessProperty: aGridlineTint. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitGridlineWidthBottom:aGridlineWidthBottom [
	^ self visitAccessProperty: aGridlineWidthBottom. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitGridlineWidthLeft:aGridlineWidthLeft [
	^ self visitAccessProperty: aGridlineWidthLeft. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitGridlineWidthRight:aGridlineWidthRight [
	^ self visitAccessProperty: aGridlineWidthRight. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitGridlineWidthTop:aGridlineWidthTop [
	^ self visitAccessProperty: aGridlineWidthTop. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitHeight:aHeight [
	^ self visitAccessProperty: aHeight. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitHelpContextId:aHelpContextId [
	^ self visitAccessProperty: aHelpContextId. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitHorizontalAnchor:aHorizontalAnchor [
	^ self visitAccessProperty: aHorizontalAnchor. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitHoverColor:aHoverColor [
	^ self visitAccessProperty: aHoverColor. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitHoverForeColor:aHoverForeColor [
	^ self visitAccessProperty: aHoverForeColor. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitHoverForeShade:aHoverForeShade [
	^ self visitAccessProperty: aHoverForeShade. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitHoverForeThemeColorIndex:aHoverForeThemeColorIndex [
	^ self visitAccessProperty: aHoverForeThemeColorIndex. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitHoverForeTint:aHoverForeTint [
	^ self visitAccessProperty: aHoverForeTint. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitHoverShade:aHoverShade [
	^ self visitAccessProperty: aHoverShade. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitHoverThemeColorIndex:aHoverThemeColorIndex [
	^ self visitAccessProperty: aHoverThemeColorIndex. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitHoverTint:aHoverTint [
	^ self visitAccessProperty: aHoverTint. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitHyperlinkAddress:aHyperlinkAddress [
	^ self visitAccessProperty: aHyperlinkAddress. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitHyperlinkBinderDescription:aHyperlinkBinderDescription [
	^ self visitAccessProperty: aHyperlinkBinderDescription. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitHyperlinkSubAddress:aHyperlinkSubAddress [
	^ self visitAccessProperty: aHyperlinkSubAddress. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitHyperlinkTarget:aHyperlinkTarget [
	^ self visitAccessProperty: aHyperlinkTarget. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitIMEHold:aIMEHold [
	^ self visitAccessProperty: aIMEHold. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitIMEMode:aIMEMode [
	^ self visitAccessProperty: aIMEMode. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitIMESentenceMode:aIMESentenceMode [
	^ self visitAccessProperty: aIMESentenceMode. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitImageData:aImageData [
	^ self visitAccessProperty: aImageData. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitImageHeight:aImageHeight [
	^ self visitAccessProperty: aImageHeight. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitImageWidth:aImageWidth [
	^ self visitAccessProperty: aImageWidth. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitInSelection:aInSelection [
	^ self visitAccessProperty: aInSelection. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitInheritValueList:aInheritValueList [
	^ self visitAccessProperty: aInheritValueList. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitInputMask:aInputMask [
	^ self visitAccessProperty: aInputMask. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitIsHyperlink:aIsHyperlink [
	^ self visitAccessProperty: aIsHyperlink. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitKeyboardLanguage:aKeyboardLanguage [
	^ self visitAccessProperty: aKeyboardLanguage. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitLabelName:aLabelName [
	^ self visitAccessProperty: aLabelName. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitLayout:aLayout [
	^ self visitAccessProperty: aLayout. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitLayoutID:aLayoutID [
	^ self visitAccessProperty: aLayoutID. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitLeft:aLeft [
	^ self visitAccessProperty: aLeft. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitLeftMargin:aLeftMargin [
	^ self visitAccessProperty: aLeftMargin. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitLeftPadding:aLeftPadding [
	^ self visitAccessProperty: aLeftPadding. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitLimitToList:aLimitToList [
	^ self visitAccessProperty: aLimitToList. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitLineSlant:aLineSlant [
	^ self visitAccessProperty: aLineSlant. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitLineSpacing:aLineSpacing [
	^ self visitAccessProperty: aLineSpacing. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitLinkChildFields:aLinkChildFields [
	^ self visitAccessProperty: aLinkChildFields. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitLinkMasterFields:aLinkMasterFields [
	^ self visitAccessProperty: aLinkMasterFields. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitListCount:aListCount [
	^ self visitAccessProperty: aListCount. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitListIndex:aListIndex [
	^ self visitAccessProperty: aListIndex. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitListItemsEditForm:aListItemsEditForm [
	^ self visitAccessProperty: aListItemsEditForm. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitListRows:aListRows [
	^ self visitAccessProperty: aListRows. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitListWidth:aListWidth [
	^ self visitAccessProperty: aListWidth. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitLocked:aLocked [
	^ self visitAccessProperty: aLocked. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitMultiRow:aMultiRow [
	^ self visitAccessProperty: aMultiRow. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitMultiSelect:aMultiSelect [
	^ self visitAccessProperty: aMultiSelect. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitName:aName [
	^ self visitAccessProperty: aName. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitNumeralShapes:aNumeralShapes [
	^ self visitAccessProperty: aNumeralShapes. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitObjectPalette:aObjectPalette [
	^ self visitAccessProperty: aObjectPalette. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOldBorderStyle:aOldBorderStyle [
	^ self visitAccessProperty: aOldBorderStyle. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnAttachmentCurrent:aOnAttachmentCurrent [
	^ self visitAccessProperty: aOnAttachmentCurrent. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnAttachmentCurrentEmMacro:aOnAttachmentCurrentEmMacro [
	^ self visitAccessProperty: aOnAttachmentCurrentEmMacro. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnChange:aOnChange [
	^ self visitAccessProperty: aOnChange. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnChangeEmMacro:aOnChangeEmMacro [
	^ self visitAccessProperty: aOnChangeEmMacro. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnClick:aOnClick [
	^ self visitAccessProperty: aOnClick. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnClickEmMacro:aOnClickEmMacro [
	^ self visitAccessProperty: aOnClickEmMacro. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnDblClick:aOnDblClick [
	^ self visitAccessProperty: aOnDblClick. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnDblClickEmMacro:aOnDblClickEmMacro [
	^ self visitAccessProperty: aOnDblClickEmMacro. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnDirty:aOnDirty [
	^ self visitAccessProperty: aOnDirty. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnDirtyEmMacro:aOnDirtyEmMacro [
	^ self visitAccessProperty: aOnDirtyEmMacro. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnEnter:aOnEnter [
	^ self visitAccessProperty: aOnEnter. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnEnterEmMacro:aOnEnterEmMacro [
	^ self visitAccessProperty: aOnEnterEmMacro. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnExit:aOnExit [
	^ self visitAccessProperty: aOnExit. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnExitEmMacro:aOnExitEmMacro [
	^ self visitAccessProperty: aOnExitEmMacro. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnGotFocus:aOnGotFocus [
	^ self visitAccessProperty: aOnGotFocus. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnGotFocusEmMacro:aOnGotFocusEmMacro [
	^ self visitAccessProperty: aOnGotFocusEmMacro. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnKeyDown:aOnKeyDown [
	^ self visitAccessProperty: aOnKeyDown. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnKeyDownEmMacro:aOnKeyDownEmMacro [
	^ self visitAccessProperty: aOnKeyDownEmMacro. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnKeyPress:aOnKeyPress [
	^ self visitAccessProperty: aOnKeyPress. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnKeyPressEmMacro:aOnKeyPressEmMacro [
	^ self visitAccessProperty: aOnKeyPressEmMacro. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnKeyUp:aOnKeyUp [
	^ self visitAccessProperty: aOnKeyUp. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnKeyUpEmMacro:aOnKeyUpEmMacro [
	^ self visitAccessProperty: aOnKeyUpEmMacro. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnLostFocus:aOnLostFocus [
	^ self visitAccessProperty: aOnLostFocus. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnLostFocusEmMacro:aOnLostFocusEmMacro [
	^ self visitAccessProperty: aOnLostFocusEmMacro. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnMouseDown:aOnMouseDown [
	^ self visitAccessProperty: aOnMouseDown. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnMouseDownEmMacro:aOnMouseDownEmMacro [
	^ self visitAccessProperty: aOnMouseDownEmMacro. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnMouseMove:aOnMouseMove [
	^ self visitAccessProperty: aOnMouseMove. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnMouseMoveEmMacro:aOnMouseMoveEmMacro [
	^ self visitAccessProperty: aOnMouseMoveEmMacro. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnMouseUp:aOnMouseUp [
	^ self visitAccessProperty: aOnMouseUp. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnMouseUpEmMacro:aOnMouseUpEmMacro [
	^ self visitAccessProperty: aOnMouseUpEmMacro. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnNotInList:aOnNotInList [
	^ self visitAccessProperty: aOnNotInList. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnNotInListEmMacro:aOnNotInListEmMacro [
	^ self visitAccessProperty: aOnNotInListEmMacro. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnUndo:aOnUndo [
	^ self visitAccessProperty: aOnUndo. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitOnUndoEmMacro:aOnUndoEmMacro [
	^ self visitAccessProperty: aOnUndoEmMacro. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitPageIndex:aPageIndex [
	^ self visitAccessProperty: aPageIndex. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitPicture:aPicture [
	^ self visitAccessProperty: aPicture. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitPictureAlignment:aPictureAlignment [
	^ self visitAccessProperty: aPictureAlignment. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitPictureCaptionArrangement:aPictureCaptionArrangement [
	^ self visitAccessProperty: aPictureCaptionArrangement. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitPictureData:aPictureData [
	^ self visitAccessProperty: aPictureData. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitPictureSizeMode:aPictureSizeMode [
	^ self visitAccessProperty: aPictureSizeMode. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitPictureTiling:aPictureTiling [
	^ self visitAccessProperty: aPictureTiling. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitPictureType:aPictureType [
	^ self visitAccessProperty: aPictureType. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitPressedColor:aPressedColor [
	^ self visitAccessProperty: aPressedColor. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitPressedForeColor:aPressedForeColor [
	^ self visitAccessProperty: aPressedForeColor. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitPressedForeShade:aPressedForeShade [
	^ self visitAccessProperty: aPressedForeShade. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitPressedForeThemeColorIndex:aPressedForeThemeColorIndex [
	^ self visitAccessProperty: aPressedForeThemeColorIndex. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitPressedForeTint:aPressedForeTint [
	^ self visitAccessProperty: aPressedForeTint. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitPressedShade:aPressedShade [
	^ self visitAccessProperty: aPressedShade. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitPressedThemeColorIndex:aPressedThemeColorIndex [
	^ self visitAccessProperty: aPressedThemeColorIndex. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitPressedTint:aPressedTint [
	^ self visitAccessProperty: aPressedTint. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitQuickStyle:aQuickStyle [
	^ self visitAccessProperty: aQuickStyle. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitQuickStyleMask:aQuickStyleMask [
	^ self visitAccessProperty: aQuickStyleMask. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitReadingOrder:aReadingOrder [
	^ self visitAccessProperty: aReadingOrder. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitRightMargin:aRightMargin [
	^ self visitAccessProperty: aRightMargin. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitRightPadding:aRightPadding [
	^ self visitAccessProperty: aRightPadding. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitRowEnd:aRowEnd [
	^ self visitAccessProperty: aRowEnd. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitRowSource:aRowSource [
	^ self visitAccessProperty: aRowSource. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitRowSourceType:aRowSourceType [
	^ self visitAccessProperty: aRowSourceType. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitRowStart:aRowStart [
	^ self visitAccessProperty: aRowStart. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitScrollBarAlign:aScrollBarAlign [
	^ self visitAccessProperty: aScrollBarAlign. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitScrollBars:aScrollBars [
	^ self visitAccessProperty: aScrollBars. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitSection:aSection [
	^ self visitAccessProperty: aSection. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitSelLength:aSelLength [
	^ self visitAccessProperty: aSelLength. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitSelStart:aSelStart [
	^ self visitAccessProperty: aSelStart. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitSelText:aSelText [
	^ self visitAccessProperty: aSelText. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitSeparatorCharacters:aSeparatorCharacters [
	^ self visitAccessProperty: aSeparatorCharacters. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitShadow:aShadow [
	^ self visitAccessProperty: aShadow. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitShape:aShape [
	^ self visitAccessProperty: aShape. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitShortcutMenuBar:aShortcutMenuBar [
	^ self visitAccessProperty: aShortcutMenuBar. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitShowDatePicker:aShowDatePicker [
	^ self visitAccessProperty: aShowDatePicker. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitShowOnlyRowSourceValues:aShowOnlyRowSourceValues [
	^ self visitAccessProperty: aShowOnlyRowSourceValues. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitShowPageHeaderAndPageFooter:aShowPageHeaderAndPageFooter [
	^ self visitAccessProperty: aShowPageHeaderAndPageFooter. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitSizeMode:aSizeMode [
	^ self visitAccessProperty: aSizeMode. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitSmartTags:aSmartTags [
	^ self visitAccessProperty: aSmartTags. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitSoftEdges:aSoftEdges [
	^ self visitAccessProperty: aSoftEdges. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitSourceObject:aSourceObject [
	^ self visitAccessProperty: aSourceObject. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitSpecialEffect:aSpecialEffect [
	^ self visitAccessProperty: aSpecialEffect. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitStatusBarText:aStatusBarText [
	^ self visitAccessProperty: aStatusBarText. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitStyle:aStyle [
	^ self visitAccessProperty: aStyle. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitTabFixedHeight:aTabFixedHeight [
	^ self visitAccessProperty: aTabFixedHeight. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitTabFixedWidth:aTabFixedWidth [
	^ self visitAccessProperty: aTabFixedWidth. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitTabIndex:aTabIndex [
	^ self visitAccessProperty: aTabIndex. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitTabStop:aTabStop [
	^ self visitAccessProperty: aTabStop. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitTag:aTag [
	^ self visitAccessProperty: aTag. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitText:aText [
	^ self visitAccessProperty: aText. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitTextAlign:aTextAlign [
	^ self visitAccessProperty: aTextAlign. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitTextFontCharSet:aTextFontCharSet [
	^ self visitAccessProperty: aTextFontCharSet. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitTextFormat:aTextFormat [
	^ self visitAccessProperty: aTextFormat. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitThemeFontIndex:aThemeFontIndex [
	^ self visitAccessProperty: aThemeFontIndex. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitTop:aTop [
	^ self visitAccessProperty: aTop. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitTopMargin:aTopMargin [
	^ self visitAccessProperty: aTopMargin. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitTopPadding:aTopPadding [
	^ self visitAccessProperty: aTopPadding. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitTransparent:aTransparent [
	^ self visitAccessProperty: aTransparent. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitTripleState:aTripleState [
	^ self visitAccessProperty: aTripleState. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitUseTheme:aUseTheme [
	^ self visitAccessProperty: aUseTheme. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitValidationRule:aValidationRule [
	^ self visitAccessProperty: aValidationRule. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitValidationText:aValidationText [
	^ self visitAccessProperty: aValidationText. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitVertical:aVertical [
	^ self visitAccessProperty: aVertical. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitVerticalAnchor:aVerticalAnchor [
	^ self visitAccessProperty: aVerticalAnchor. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitVisible:aVisible [
	^ self visitAccessProperty: aVisible. 

]

{ #category : #'visit-control-properties' }
JinGUIControlVisitor >> visitWidth:aWidth [
	^ self visitAccessProperty: aWidth. 

]
