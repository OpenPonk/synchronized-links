"
Mock domain model representing a score.
Used exclusively for testing one-to-one synchronized links with SRTestReview.
"
Class {
	#name : 'SRTestScore',
	#superclass : 'Object',
	#instVars : [
		'review'
	],
	#category : 'OpenPonk-SynchronizedLinks-Tests-Links',
	#package : 'OpenPonk-SynchronizedLinks-Tests',
	#tag : 'Links'
}

{ #category : 'accessing' }
SRTestScore >> review [
	^ review
]

{ #category : 'accessing' }
SRTestScore >> review: aReview [
	review := SRToOneLink
		on: self
		slot: #review
		oppositeSlot: #score
		updateFrom: review
		to: aReview
]
