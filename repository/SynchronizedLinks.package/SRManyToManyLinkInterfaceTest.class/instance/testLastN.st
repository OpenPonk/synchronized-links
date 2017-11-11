tests
testLastN
	self assert: (a1 books last: 2) asArray equals: (Array with: b1 with: b2)