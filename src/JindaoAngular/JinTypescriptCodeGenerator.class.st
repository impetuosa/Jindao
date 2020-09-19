Class {
	#name : #JinTypescriptCodeGenerator,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#category : #JindaoAngular
}

{ #category : #accessing }
JinTypescriptCodeGenerator >> sourceCode [
	^ stream contents 
]

{ #category : #visiting }
JinTypescriptCodeGenerator >> visitTypescriptClass: aJinTypescriptClass [

	self assert: stream isNil.
	stream := '' writeStream.

	stream nextPutAll:
		'import { OnInit, OnDestroy } from ''@angular/core'';'; cr .
	aJinTypescriptClass decorator ifNotNil: [ :d | d acceptVisitor: self ].
	stream
		nextPutAll:
			(' export class {1} implements ' format:
					 { aJinTypescriptClass name });
		nextPutAll: (',' join: (aJinTypescriptClass types collect: #name));
		nextPutAll: ' {' ; newLine .
		aJinTypescriptClass methods  do: [ :m | m acceptVisitor: self ].
	stream nextPutAll: '}'
	
]

{ #category : #visiting }
JinTypescriptCodeGenerator >> visitTypescriptDecorator: aJinTypescriptDecorator [

	stream
		cr;
		nextPutAll: '    ';
		nextPutAll: '@';
		nextPutAll: aJinTypescriptDecorator name;
		nextPutAll: '(';
		nextPutAll: (STONJSON toString: aJinTypescriptDecorator attributes);
		nextPutAll: ')';
		cr
]

{ #category : #visiting }
JinTypescriptCodeGenerator >> visitTypescriptMethod: aJinTypescriptMethod [

	stream
		newLine;
		nextPutAll: '    ';
		nextPutAll: aJinTypescriptMethod selector;
		nextPutAll: '('.
	stream nextPutAll:
		(',' join: (aJinTypescriptMethod parameters collect: [ :p | 
				  p type name , ' ' , p name ])).
	stream
		nextPutAll: ') {';
		newLine;
		nextPutAll: '    }';
		newLine
]
