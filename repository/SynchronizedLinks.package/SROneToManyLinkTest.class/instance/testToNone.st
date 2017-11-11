tests
testToNone
	| r1 b1 |
	r1 := SRTestReview new.
	b1 := SRTestBook new.
	r1 book: b1.
	r1 book: nil.
	self assert: r1 book equals: nil.
	self assert: b1 reviews asArray equals: {}