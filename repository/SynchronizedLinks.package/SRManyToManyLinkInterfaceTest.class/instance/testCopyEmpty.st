tests
testCopyEmpty
	| empty |
	empty := a1 books copyEmpty.
	self assert: empty isEmpty.
	self assert: empty species equals: a1 books species