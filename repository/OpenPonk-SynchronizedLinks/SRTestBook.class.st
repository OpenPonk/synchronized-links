"
books ->  authors: N:M
book -> reviews: 1:N
"
Class {
	#name : 'SRTestBook',
	#superclass : 'Object',
	#instVars : [
		'authors',
		'reviews'
	],
	#category : 'OpenPonk-SynchronizedLinks-Tests',
	#package : 'OpenPonk-SynchronizedLinks',
	#tag : 'Tests'
}

{ #category : 'accessing' }
SRTestBook >> authors [
	^ authors
		ifNil: [ authors := SRToManyLink
				on: self
				slot: #authors
				oppositeSlot: #books ]
]

{ #category : 'accessing' }
SRTestBook >> authors: aCollection [
	self authors
		removeAll;
		addAll: aCollection
]

{ #category : 'accessing' }
SRTestBook >> reviews [
	^ reviews
		ifNil: [ reviews := SRToManyLink
				on: self
				slot: #reviews
				oppositeSlot: #book ]
]

{ #category : 'accessing' }
SRTestBook >> reviews: aCollection [
	self reviews
		removeAll;
		addAll: aCollection
]
