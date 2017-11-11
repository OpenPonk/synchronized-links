tests
testChangePair
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