"
Test fixture representing an owner with a single to-one reviews slot synchronized with a review's book slot.
Used to verify polymorphic detachment when a review moves from a to-one owner into a to-many link using the same slot name.
"
Class {
	#name : 'SRTestSingleReviewBook',
	#superclass : 'Object',
	#instVars : [
		'reviews'
	],
	#category : 'OpenPonk-SynchronizedLinks-Tests-Links',
	#package : 'OpenPonk-SynchronizedLinks-Tests',
	#tag : 'Links'
}

{ #category : 'accessing' }
SRTestSingleReviewBook >> reviews [

	^ reviews
]

{ #category : 'accessing' }
SRTestSingleReviewBook >> reviews: aReview [

	reviews := SRToOneLink
		           on: self
		           slot: #reviews
		           oppositeSlot: #book
		           updateFrom: reviews
		           to: aReview
]
