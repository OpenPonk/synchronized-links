tests
testFromCollection
	| r1 b1 r2 |
	b1 := SRTestBook new.
	r1 := SRTestReview new.
	b1 reviews add: r1.
	r2 := SRTestReview new.
	b1 reviews: {r2}.
	self assert: b1 reviews asArray equals: {r2}.
	self assert: r2 book equals: b1.
	self assert: r1 book equals: nil