Class {
	#name : 'SROneToOneLinkTest',
	#superclass : 'TestCase',
	#category : 'SynchronizedLinks-Tests',
	#package : 'SynchronizedLinks',
	#tag : 'Tests'
}

{ #category : 'tests' }
SROneToOneLinkTest >> testBothFromNil [
	| r1 s1 |
	r1 := SRTestReview new.
	s1 := SRTestScore new.
	r1 score: s1.
	self assert: s1 review equals: r1.
	self assert: r1 score equals: s1
]

{ #category : 'tests' }
SROneToOneLinkTest >> testChangePair [
	| r1 s1 r2 s2 |
	r1 := SRTestReview new.
	s1 := SRTestScore new.
	r2 := SRTestReview new.
	s2 := SRTestScore new.
	s1 review: r1.
	s2 review: r2.
	s1 review: r2.
	self assert: s1 review equals: r2.
	self assert: r2 score equals: s1.
	self assert: r1 score equals: nil.
	self assert: s2 review equals: nil
]

{ #category : 'tests' }
SROneToOneLinkTest >> testNothingChanged [
	| r1 s1 |
	r1 := SRTestReview new.
	s1 := SRTestScore new.
	r1 score: s1.
	self assert: s1 review equals: r1.
	self assert: r1 score equals: s1.
	r1 score: s1.
	self assert: s1 review equals: r1.
	self assert: r1 score equals: s1
]

{ #category : 'tests' }
SROneToOneLinkTest >> testToNil [
	| r1 s1 |
	r1 := SRTestReview new.
	s1 := SRTestScore new.
	s1 review: r1.
	s1 review: nil.
	self assert: s1 review equals: nil.
	self assert: r1 score equals: nil
]
