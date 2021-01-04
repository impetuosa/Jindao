Class {
	#name : #JinCILaunch,
	#superclass : #Object,
	#category : #'Jindao-CI'
}

{ #category : #'world menu' }
JinCILaunch class >> launchJindao [

	WebBrowser openOn:
		'https://ci.inria.fr/access-replicant/job/jindao/build?token=0db223bd-7474-0d00-b692-21c90a593b10'
]

{ #category : #'world menu' }
JinCILaunch class >> launchMoxing [

	WebBrowser openOn:
		'https://ci.inria.fr/access-replicant/job/moxing/build?token=0db223bd-7474-0d00-b692-21c90a593b10'
]

{ #category : #'world menu' }
JinCILaunch class >> launchSuntzu [

	WebBrowser openOn:
		'https://ci.inria.fr/access-replicant/job/Suntzu/build?token=0db223bd-7474-0d00-b692-21c90a593b10'
]

{ #category : #'world menu' }
JinCILaunch class >> worldMenuOn: aBuilder [

	<worldMenu>
	(aBuilder item: #Jenkins)
		order: 20;
		target: self;
		help: 'Jenkins CI Trigger'.
	(aBuilder item: 'Launch JinDao Build')
		parent: #Jenkins;
		order: 0;
		icon: (self iconNamed: #glamorousGo);
		action: [ self launchJindao ].
	(aBuilder item: 'Launch Moxing Build')
		parent: #Jenkins;
		order: 0;
		icon: (self iconNamed: #glamorousGo);
		action: [ self launchMoxing ].
	(aBuilder item: 'Launch Suntzu Build')
		parent: #Jenkins;
		order: 0;
		icon: (self iconNamed: #glamorousGo);
		action: [ self launchSuntzu ]
]
