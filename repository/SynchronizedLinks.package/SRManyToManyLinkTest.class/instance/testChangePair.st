tests
testChangePair
	| a1 b1 a2 b2 |
	a1 := SRTestAuthor new.
	b1 := SRTestBook new.
	a1 books add: b1.
	a2 := SRTestAuthor new.
	b2 := SRTestBook new.
	a2 books add: b2.
	a2 books add: b1.
	self assert: a1 books asArray equals: {b1}.
	self assert: a2 books asArray equals: (Array with: b2 with: b1).
	self assert: b1 authors asArray equals: (Array with: a1 with: a2).
	self assert: b2 authors asArray equals: {a2}