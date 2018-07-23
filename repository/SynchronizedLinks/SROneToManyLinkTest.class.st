Class {
	#name : #SROneToManyLinkTest,
	#superclass : #TestCase,
	#category : 'SynchronizedLinks-Tests'
}

{ #category : #tests }
SROneToManyLinkTest >> testChangePair [
	| r1 b1 r2 b2 |
	r1 := SRTestReview new.
	b1 := SRTestBook new.
	r1 book: b1.
	r2 := SRTestReview new.
	b2 := SRTestBook new.
	r2 book: b2.
	r1 book: b2.
	self assert: r1 book equals: b2.
	self assert: b2 reviews asArray equals: (Array with: r2 with: r1).
	self assert: r2 book equals: b2.
	self assert: b1 reviews asArray equals: {}
]

{ #category : #tests }
SROneToManyLinkTest >> testFromNone [
	| r1 b1 |
	r1 := SRTestReview new.
	b1 := SRTestBook new.
	r1 book: b1.
	self assert: r1 book equals: b1.
	self assert: b1 reviews asArray equals: {r1}
]

{ #category : #tests }
SROneToManyLinkTest >> testToNone [
	| r1 b1 |
	r1 := SRTestReview new.
	b1 := SRTestBook new.
	r1 book: b1.
	r1 book: nil.
	self assert: r1 book equals: nil.
	self assert: b1 reviews asArray equals: {}
]
