Class {
	#name : #JinCSNModelExporterAngularBLSpecific,
	#superclass : #CSNModelExporterAngularBLSpecific,
	#category : #JindaoCasinoImporting
}

{ #category : #visiting }
JinCSNModelExporterAngularBLSpecific >> visitCSNLAbsolutePositionLayout: aBLUIGridLayout [
	self crlf; indentPlus; << '<div style="position: absolute">'; crlf; indentPlus.
 
	aBLUIGridLayout cell do: [ :c | 
			self << ('<div style="left:{1}px; top:{2}px">' format: { (c widget attributeNamed:  #left ) . (c widget attributeNamed:  #top)  }).
		 	 self indentPlus.
  	       self visit: c.
          self indentMinus.
			self << '</div>'.
		].
  self indentMinus; << '</div>';indentMinus;crlf
]

{ #category : #visiting }
JinCSNModelExporterAngularBLSpecific >> visitCSNLTabulateLayout: aTabulateLayout [
	self crlf; indentPlus; << '<tbody>'; crlf; indentPlus.
	aTabulateLayout rowsDo: [ : row | 
		self << '<tr>'; crlf; indentPlus.
		row do: [ :cell | 
			self << '<td'.
              cell attributesTagWith: self.
              self <<< '>';crlf.
              self indentPlus.
              self visit: cell.
              self indentMinus.
              self crlf; << '</td>'; crlf 
		 ].
		self indentMinus; << '</tr>'; crlf
  ].
  self indentMinus; << '</tbody>'; indentMinus; crlf
]

{ #category : #visiting }
JinCSNModelExporterAngularBLSpecific >> visitJinCasinoWidgetUsage: aJinCasinoWidgetUsage [
	self
		crlf;
		indentPlus;
		<< ('<{1}/>' format: {aJinCasinoWidgetUsage name});
		crlf;
		indentPlus
]
