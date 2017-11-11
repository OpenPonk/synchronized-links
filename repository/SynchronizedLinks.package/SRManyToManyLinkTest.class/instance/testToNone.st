tests
testToNone
	| a1 b1 |
	a1 := SRTestAuthor new.
	b1 := SRTestBook new.
	a1 books add: b1.
	a1 books remove: b1.
	self assert: a1 books asArray equals: {}.
	self assert: b1 authors asArray equals: {}