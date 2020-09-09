Class {
	#name : #JinCSNModelExporterAngularBLSpecific,
	#superclass : #CSNModelExporterAngular,
	#category : #JindaoCasinoImporting
}

{ #category : #visiting }
JinCSNModelExporterAngularBLSpecific >> visitCSNLAbsolutePositionLayout: aTabulateLayout [
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
JinCSNModelExporterAngularBLSpecific >> visitCSNsadfLAbsolutePositionLayout: aBLUIGridLayout [
	self
		crlf;
		indentPlus;
		<< '<div class="bl-relative">';
		crlf;
		indentPlus.
	aBLUIGridLayout cell
		do: [ :c | 
			self
				<<
					('<div style="position: relative; left:{1}px; top:{2}px; height:{3}px; width:{4}px">'
						format:
							{(c widget attributeNamed: #left).
							(c widget attributeNamed: #top).
							(c widget attributeNamed: #height).
							(c widget attributeNamed: #width)}).
			self indentPlus.
			self visit: c.
			self indentMinus.
			self << '</div>' ].
	self
		indentMinus;
		<< '</div>';
		indentMinus;
		crlf
]

{ #category : #visiting }
JinCSNModelExporterAngularBLSpecific >> visitJinCasinoWidgetUsage: aJinCasinoWidgetUsage [


	self
		crlf;
		indentPlus;
		<< ('<bl-Showroom-{1}-{1}> </bl-Showroom-{1}-{1}>' format: {aJinCasinoWidgetUsage widgetName });
		crlf;
		indentPlus
]
