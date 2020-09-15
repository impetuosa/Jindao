Class {
	#name : #JinIcons,
	#superclass : #Object,
	#classVars : [
		'icons'
	],
	#category : #JindaoMoose
}

{ #category : #'GT-InspectorExtensions' }
JinIcons class >> gtInspectorIconsIn: composite [
	<gtInspectorPresentationOrder: 0>
	<script: 'self inspect'>
	composite table
		title: 'Icons';
		display: [ (self class selectorsInCategory: 'accessing - icons') sorted
				collect: [ :each | each -> (self perform: each) ] ];
		column: 'Icon' evaluated: #value width: 50;
		column: 'Selector' evaluated: #key
]

{ #category : #'GT-InspectorExtensions' }
JinIcons class >> iconFor: anElement [

	| aClass |
	aClass := anElement class = JinPath
		          ifTrue: [ 
		          ((JinPath slotNamed: 'object') read: anElement) class ]
		          ifFalse: [ anElement class ].

	aClass = JinForm ifTrue: [ ^ self iconFormIcon ].
	aClass = JinTable ifTrue: [ ^ self iconTableIcon ].
	aClass = JinReport ifTrue: [ ^ self iconReportIcon ].
	aClass = JinQuery ifTrue: [ ^ self iconQueryIcon ].
	aClass = JinMacro ifTrue: [ ^ self iconMacroIcon ].
	aClass = JinModule ifTrue: [ ^ self iconModuleIcon ].
	self halt.
	self error: 'Invalid element'
]

{ #category : #'accessing - icons' }
JinIcons class >> iconFormIcon [
	"Private - Generated method"
	^ self icons
		at: #iconFormIcon
		ifAbsentPut: [ Form fromBinaryStream: self iconFormIconContents base64Decoded asByteArray readStream ]
]

{ #category : #'private - contents' }
JinIcons class >> iconFormIconContents [
	"Private - Method generated with the content of the file File @ D:\Users\Santiago.BRAGAGNOLO\Desktop\Access\IconForm.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABgAAAATCAIAAAAF0lpsAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGNSURBVDhPY/z//z8DNQATlKYYoLvoavcqKIuB4dvrd1AWA8PnJ68gjB/vvkIYQOC1oxPKwmoQl6okhP37E1TP75efIAwggJt+4dCZ1BNzIGwgwGLQw71noRwk8PTDWygLCSAbxAA0CBks3nQCykICv/6A0Nef/z98+/f6MxSZeiZDpcGABWoeKqidtPf3r+/fvr779vXjpJbc9hkI7s/vX2qrK16+eAxVCgPoBn369BFINuc5//4L4gLJ33//A02J9jPi5GDl5BGsqO8GSWAA7NGPYspfhr9/f02cs7Zjygq4KV++gVUgA6gXYWDqkp1AEjNQnrz9DUQ3n/+DoG1H7xEVRk1TEYHSUZczcd4+tDCCqkMC2A2qywaFEdBfQDaIgRpGP39DVKEAnGEEN+Xnr7+YYYQJsLsIAiCmABmp8YFAEuKQX3//AxGIhQqwu+j161evX795/uz5s5fvgAiYau4+evXkOQi9evUaiKDqkAB6Fpm2dNeCpYh8ix+c2oY7r5ENsHuNDEAlgxgYANInbG3PwPAqAAAAAElFTkSuQmCC'
]

{ #category : #'accessing - icons' }
JinIcons class >> iconMacroIcon [
	"Private - Generated method"
	^ self icons
		at: #iconMacroIcon
		ifAbsentPut: [ Form fromBinaryStream: self iconMacroIconContents base64Decoded asByteArray readStream ]
]

{ #category : #'private - contents' }
JinIcons class >> iconMacroIconContents [
	"Private - Method generated with the content of the file File @ D:\Users\Santiago.BRAGAGNOLO\Desktop\Access\IconMacro.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABYAAAARCAIAAABW08vUAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGkSURBVDhPY/z//z8DZYAJSlMAsLhi98piCEND8PGN97IQNgS8+SwQmVIL5cAAuhEn902XkRUWFWBn5BD9/+M1VPT76/N3fj8/OxvIfP5LP7N6PkQYAligNAx8en3nCQPDk8dA5jMIF0jeufMOSDopcnz+/OXi5ZtANjJAN0JUzhNIXr96nPP9eiADaKck20VJNpAUl4gK0HAQCxWgG2Fg6QIkgUZwyznaO9lBvfP99b9vL/98eQIOmuMQlXCAPUZEeD9g6n966yLQR1a2llBFMIDFiOVzmrWMzOH6f706C9QPFL/+9AeQdA3vBatCAJzpAm4/hHvj7FFguBhZmkG4yADdiAvH9ygpiQAjFciGuP/9u7dA9OQTi4C4krlTJkQZMkA3AhiQwHQBsv/tFYj7geDsxTtAJwADCMJFA+hGfHh5D0jC7f/27Oq3NyCDmN/uEfywuzHHCojAChEAPVKB4Nq5k0BS8MNRoOMhIkDw/Jfs6TfqSX5ft5zmhgrBAJY8Mr01EUi+eg5Khc+ev5WSFAaSYBkGILt+yjEIGw4GQ2ZnYAAA3m/S7QR1knAAAAAASUVORK5CYII='
]

{ #category : #'accessing - icons' }
JinIcons class >> iconModuleIcon [
	"Private - Generated method"
	^ self icons
		at: #iconModuleIcon
		ifAbsentPut: [ Form fromBinaryStream: self iconModuleIconContents base64Decoded asByteArray readStream ]
]

{ #category : #'private - contents' }
JinIcons class >> iconModuleIconContents [
	"Private - Method generated with the content of the file File @ D:\Users\Santiago.BRAGAGNOLO\Desktop\Access\IconModule.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABoAAAATCAIAAAABJ4pRAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGcSURBVDhPY/z//z8D9QATlKYSIGDcowMhUBaRAOhZXODh/uB3b44f2toM5RMB8Lnu12+m79+u6pi7HN7WAhViYPha7AVlYQP4jLv5lIeH4THExK0LkoAiQLO4Upueh6hCFGACfMZ5J8w7vPfRvx8HgCZeOnkBKPKO787vrXMlWpbjMpFAVMzc9HVx31WgibcfswK5D0+xvT2+B2jivsefIQrQATQMsQGvgDA0BhAsMRN/FqwCJKF8VIDTODSzkElcZgEBunFfijyBJJpZEIDMxgVQjAOa9e/6aaBfIFzTRi0gUiqUB7KRXYcHoOTZx41q4jzOrN7JL2oi/fXY4sLivn779vDZs537dt/tewBR4x0YvnX9SggbE6AYd8RbR5nzp7Cly+pV66NPvjBr0tbSNgSKf/jw6fLVS0ATC+e8gajsTxGBMNAAeomy1FzCSZYXmA6AxgG5ykUKEHGIWToqgkD2s0//l85bfGNDIkQKGWApoIAmQszCBBoB8z19fF+8/gZknz+5F9NEkss7oIkQBrGuowQQyGSkAQYGADnC76ha89LxAAAAAElFTkSuQmCC'
]

{ #category : #'accessing - icons' }
JinIcons class >> iconQueryIcon [
	"Private - Generated method"
	^ self icons
		at: #iconQueryIcon
		ifAbsentPut: [ Form fromBinaryStream: self iconQueryIconContents base64Decoded asByteArray readStream ]
]

{ #category : #'private - contents' }
JinIcons class >> iconQueryIconContents [
	"Private - Method generated with the content of the file File @ D:\Users\Santiago.BRAGAGNOLO\Desktop\Access\IconQuery.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABkAAAAWCAIAAAC63aDhAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAHbSURBVDhP5ZRPKINhHMdf/04czAkpyjTDeOfEiaOMu5xQzoqUgzi4KgcHKSXJ2kEaWhTz/0+khsWFRDkoYcZe294/833e59msZ2aX3Xz69dvveZ/n+fU8n953GZFIREgTmew3HaSzV4o79s7YaSHJSjAcRhHNMnJYVfZHBsi0TupzWcU6hFhtrjVXlhQXGctKiw35hQWG/LzcpzcfW6ST+lyvAQkFjoOz4CAfwSCdCnyR4mZijA4J6PUHzq0LVdPiQ1ZZ+AJaW/cQW6eTzVpG4QR1VtW3j09hGBO0PdzvcB2rimqsMPv8fn0tg+8FYAc5IElSMIQCgqT3d9r68v4BTzpsjcje25dP/foxfunlPjxGpoJM1oZdzzl9TgWBuaU9ZEtVNR3+wO4ahRM0v3LICZLCmv+L1CdXz2JLF9umw78TiqIgr+54EVpECIWIJghaWD64e3yBoJwswe50O1bcsqZviOOXOwJbk4UWikJ6xQtCttaKiY0A30uWyWbXrhcHbG22ou4bnTw68+iThJ6+QVYlwu4aBYLoSwQvsUgmiIP3RQUtrp8ub5xCDY1kgjgS3ZNeJmM5AmpoQFBNjUgX/AH/PU47Ni+vruMFcXjWZlmVwH/4X01fL0H4Btsormwd30mFAAAAAElFTkSuQmCC'
]

{ #category : #'accessing - icons' }
JinIcons class >> iconReportIcon [
	"Private - Generated method"
	^ self icons
		at: #iconReportIcon
		ifAbsentPut: [ Form fromBinaryStream: self iconReportIconContents base64Decoded asByteArray readStream ]
]

{ #category : #'private - contents' }
JinIcons class >> iconReportIconContents [
	"Private - Method generated with the content of the file File @ D:\Users\Santiago.BRAGAGNOLO\Desktop\Access\IconReport.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABYAAAAUCAIAAAAGHlpnAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAHFSURBVDhPzVLPLwNBGF2t7pZNhaYSDm4ixMHRAX+Imxtn7pWKuPgRJ+HmIiISfwFx4thIRAQlyqFIy+7O7O7sbNv1urPByoZEL142s998871v3vcyLZ7nSc0hFvybwP9oEfJieXkFqzoe4yYTGYBKjBmuiC2HY12bXBVbgVCL/uH+wkVh/XBpdGgMW17nvOqyKqMOfSPlV1ND8vzgcm9j3y8P8F0FoSQ9oaDFxs5WkJUkRZVbko2RPcUjp/Rbi9bg72Nre1OowP3Ydvf1titypiMlq0kl0Za/PtN0Iiq/ImTn9NRMdn4eAfRjTXer4Kc6u7pSmfak6pdEIELF4mEW80P8/dUDkhhBbku0ynF8jFnaky6KPxDhRX2EDw8MwT8imUi6pmt7jDvcMuzHu5KZJ0cHx6JeIDQIVCzkciL+ykfAGee2axuWfxhCtBcWM0E2KBH3U52azGaVRq/i1aNf+4kIFXg/Ja2kMwNkod/SmU0cnVNLi1AR4QUdpPFUDcqrvObUOcgxIoGPKdDi+eQFlgcEHxGvc3Z3rpawoRxkUmkwcfRx/y8thIrbnptYsbHlhlt+KvsnIQt+avE3hOz8G5puIUnvhqE2oBXrYSwAAAAASUVORK5CYII='
]

{ #category : #'accessing - icons' }
JinIcons class >> iconTableIcon [
	"Private - Generated method"
	^ self icons
		at: #iconTableIcon
		ifAbsentPut: [ Form fromBinaryStream: self iconTableIconContents base64Decoded asByteArray readStream ]
]

{ #category : #'private - contents' }
JinIcons class >> iconTableIconContents [
	"Private - Method generated with the content of the file File @ D:\Users\Santiago.BRAGAGNOLO\Desktop\Access\IconTable.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABQAAAARCAIAAABSJhvpAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGWSURBVDhPpZO7SgNBFIZX2dR5Bp9ALQR7bWzUzgfwIews7CzsAooYb9GEQCLBG0KioohoLESwUgsRMaiBGMNm3Z2b/+wZc1ksJP4MM/+Z2TPn27Nsl1LK6lTdZu1IpvJ07Aiz54lg06q5PhnP52RCis+MYbYpgAb7esgwLnOHN+NDvfA+09dtF65Hh/uDQy2EZEzlqbl8uVqnLalMfRL3mXEtSsxO6AXJ0ObupWjRWu4cNV1POC5/LvvxzMmHw9+rDOPq3h0YmaSsXxompDEeV3VfcwkhGVevVfn4xmvuz3EDO7lXpJhzzaykeUJIHSKZQil0GE+kivtLOiYAcBpioVFXt86IGbQPJW8xfUzMeIWdYj2M3SjV+DRSqoojy5/N5oG5VGnrpcFezp7adoS2cBHRQiFgqXS4spFuwwYYgNFhDKCivcQM1NsnbyFZADCN7MVXGJsuRkvRXszaSwvM6HBwrnX3wjBMEMhgzyfz0WgUhqF0wAxDkCCK2BHGm2nrqQxhm+RY4gBbwdGf1Jbcmf7xS1rWNw2xaNAZQ/c4AAAAAElFTkSuQmCC'
]

{ #category : #accessing }
JinIcons class >> icons [
	^ icons ifNil: [ icons := Dictionary new ]
]

{ #category : #'accessing - reset' }
JinIcons class >> resetIcons [
	<script>
	^ icons := nil
]
