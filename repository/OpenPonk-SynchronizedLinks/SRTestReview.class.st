"
Mock domain model representing a review.
Used exclusively for testing synchronized links, maintaining a many-to-one relationship with SRTestBook and a one-to-one relationship with SRTestScore.
"
Class {
	#name : 'SRTestReview',
	#superclass : 'Object',
	#instVars : [
		'book',
		'score'
	],
	#category : 'OpenPonk-SynchronizedLinks-Tests',
	#package : 'OpenPonk-SynchronizedLinks',
	#tag : 'Tests'
}

{ #category : 'accessing' }
SRTestReview >> book [
	^ book
]

{ #category : 'accessing' }
SRTestReview >> book: aBook [
	book := SRToOneLink
		on: self
		slot: #book
		oppositeSlot: #reviews
		updateFrom: book
		to: aBook
]

{ #category : 'accessing' }
SRTestReview >> score [
	^ score
]

{ #category : 'accessing' }
SRTestReview >> score: aScore [
	score := SRToOneLink
		on: self
		slot: #score
		oppositeSlot: #review
		updateFrom: score
		to: aScore
]
