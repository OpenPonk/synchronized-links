tests
testFromCollection
	| a1 b1 b2 |
	a1 := SRTestAuthor new.
	b1 := SRTestBook new.
	a1 books add: b1.
	b2 := SRTestBook new.
	a1 books: {b2}.
	self assert: a1 books asArray equals: {b2}.
	self assert: b2 authors asArray equals: {a1}.
	self assert: b1 authors asArray equals: {}