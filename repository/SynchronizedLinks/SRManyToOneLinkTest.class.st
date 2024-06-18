Class {
	#name : 'SRManyToOneLinkTest',
	#superclass : 'TestCase',
	#category : 'SynchronizedLinks-Tests',
	#package : 'SynchronizedLinks',
	#tag : 'Tests'
}

{ #category : 'tests' }
SRManyToOneLinkTest >> testChangePair [
	| r1 b1 r2 b2 |
	r1 := SRTestReview new.
	b1 := SRTestBook new.
	b1 reviews add: r1.
	r2 := SRTestReview new.
	b2 := SRTestBook new.
	b2 reviews add: r2.
	b2 reviews add: r1.
	self assert: r1 book equals: b2.
	self assert: b2 reviews asArray equals: (Array with: r2 with: r1).
	self assert: r2 book equals: b2.
	self assert: b1 reviews asArray equals: {}
]

{ #category : 'tests' }
SRManyToOneLinkTest >> testFromCollection [
	| r1 b1 r2 |
	b1 := SRTestBook new.
	r1 := SRTestReview new.
	b1 reviews add: r1.
	r2 := SRTestReview new.
	b1 reviews: {r2}.
	self assert: b1 reviews asArray equals: {r2}.
	self assert: r2 book equals: b1.
	self assert: r1 book equals: nil
]

{ #category : 'tests' }
SRManyToOneLinkTest >> testFromNone [
	| r1 b1 |
	r1 := SRTestReview new.
	b1 := SRTestBook new.
	b1 reviews add: r1.
	self assert: b1 reviews asArray equals: {r1}.
	self assert: r1 book equals: b1
]

{ #category : 'tests' }
SRManyToOneLinkTest >> testToNone [
	| r1 b1 |
	r1 := SRTestReview new.
	b1 := SRTestBook new.
	b1 reviews add: r1.
	b1 reviews remove: r1.
	self assert: b1 reviews asArray equals: {}.
	self assert: r1 book equals: nil
]
