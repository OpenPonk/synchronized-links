"
reviews -> book: N:1
review -> score: 1:1
"
Class {
	#name : #SRTestReview,
	#superclass : #Object,
	#instVars : [
		'book',
		'score'
	],
	#category : 'SynchronizedLinks-Tests'
}

{ #category : #accessing }
SRTestReview >> book [
	^ book
]

{ #category : #accessing }
SRTestReview >> book: aBook [
	book := SRToOneLink
		on: self
		slot: #book
		oppositeSlot: #reviews
		updateFrom: book
		to: aBook
]

{ #category : #accessing }
SRTestReview >> score [
	^ score
]

{ #category : #accessing }
SRTestReview >> score: aScore [
	score := SRToOneLink
		on: self
		slot: #score
		oppositeSlot: #review
		updateFrom: score
		to: aScore
]
