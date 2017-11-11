tests
testToNil
	| r1 s1 |
	r1 := SRTestReview new.
	s1 := SRTestScore new.
	s1 review: r1.
	s1 review: nil.
	self assert: s1 review equals: nil.
	self assert: r1 score equals: nil