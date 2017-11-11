tests
testFromNone
	| a1 b1 |
	a1 := SRTestAuthor new.
	b1 := SRTestBook new.
	a1 books add: b1.
	self assert: a1 books asArray equals: {b1}.
	self assert: b1 authors asArray equals: {a1}