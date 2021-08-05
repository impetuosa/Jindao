Class {
	#name : #JinDAMGUIImporter,
	#superclass : #JinGUIFirstCitizenVisitor,
	#category : #'JinDAM-Importers'
}

{ #category : #'entry-point' }
JinDAMGUIImporter >> visitForm: anObject [
	| frm |
	frm := self instantiate: JinDAMForm.
	frm name: anObject name.
	frm anchor: self state top anchor / #forms / anObject name.
	self state top addType: frm.
	self state push: frm.
	super visitForm: anObject.
	anObject ensureUnload.
	self state pop
]

{ #category : #'entry-point' }
JinDAMGUIImporter >> visitReport: anObject [
	| rpt |
	rpt := self instantiate: JinDAMReport.
	rpt name: anObject name.
	rpt anchor: self state top anchor / #reports / anObject name.
	self state top addType: rpt.
	self state push: rpt.
	super visitReport: anObject.
	anObject ensureUnload.
	self state pop
]
