tests
testAtLast
	self assert: (a1 books atLast: 2) equals: a1 books first.
	self assert: (a1 books atLast: 1) equals: a1 books second