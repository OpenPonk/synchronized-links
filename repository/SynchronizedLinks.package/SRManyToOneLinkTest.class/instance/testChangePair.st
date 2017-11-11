tests
testChangePair
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