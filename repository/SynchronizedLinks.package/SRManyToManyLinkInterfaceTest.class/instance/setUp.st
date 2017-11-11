initialization
setUp
	a1 := SRTestAuthor new.
	b1 := SRTestBook new.
	b2 := SRTestBook new.
	a1 books add: b1.
	a1 books add: b2