"
I am supposed to get a snapshot of the content as soon as possible, The idea is to fully force a violent caching of data for being able to work off line
"
Class {
	#name : #JinSnapshotHandle,
	#superclass : #JinCachedHandle,
	#category : #'Jindao-Handles'
}

{ #category : #properties }
JinSnapshotHandle >> handle: aHandle [
	super handle: handle. 	 
	self error: 'Shoudld implement an eager data access for snapshotting the thing '
]
