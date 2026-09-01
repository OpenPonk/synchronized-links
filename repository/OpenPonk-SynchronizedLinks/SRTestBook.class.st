"
Mock domain model representing a book.
Used exclusively for testing synchronized links, maintaining a many-to-many relationship with SRTestAuthor and a one-to-many relationship with SRTestReview.
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
