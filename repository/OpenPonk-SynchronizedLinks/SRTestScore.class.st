"
score -> review: 1:1
"
Class {
	#name : 'SRTestScore',
	#superclass : 'Object',
	#instVars : [
		'review'
	],
	#category : 'OpenPonk-SynchronizedLinks-Tests',
	#package : 'OpenPonk-SynchronizedLinks',
	#tag : 'Tests'
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
