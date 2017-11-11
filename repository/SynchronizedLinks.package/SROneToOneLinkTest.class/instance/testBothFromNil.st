tests
testBothFromNil
	| r1 s1 |
	r1 := SRTestReview new.
	s1 := SRTestScore new.
	r1 score: s1.
	self assert: s1 review equals: r1.
	self assert: r1 score equals: s1