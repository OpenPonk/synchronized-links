tests
testFromNone
	| r1 b1 |
	r1 := SRTestReview new.
	b1 := SRTestBook new.
	b1 reviews add: r1.
	self assert: b1 reviews asArray equals: {r1}.
	self assert: r1 book equals: b1