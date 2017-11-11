tests
testFromCollectionMultiple
	| b1 a1 a2 |
	b1 := SRTestBook new.
	a1 := SRTestAuthor new.
	a2 := SRTestAuthor new.
	b1 authors: (Array with: a1 with: a2).
	self assert: b1 authors asArray equals: (Array with: a1 with: a2).
	self assert: a1 books asArray equals: {b1}.
	self assert: a2 books asArray equals: {b1}.
	b1 authors: {}.
	self assert: b1 authors asArray equals: {}.
	self assert: a1 books asArray equals: {}.
	self assert: a2 books asArray equals: {}