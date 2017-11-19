tests
testCopy
	| books copy |
	books := a1 books.
	copy := books copy.
	self assert: books size equals: 2.
	self assert: copy size equals: 2.
	copy remove: copy first.
	self assert: books size equals: 2.
	self assert: copy size equals: 1.
	copy remove: copy first.
	self assert: books size equals: 2.
	self assert: copy size equals: 0