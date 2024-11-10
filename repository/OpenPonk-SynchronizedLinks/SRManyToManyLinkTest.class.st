Class {
	#name : 'SRManyToManyLinkTest',
	#superclass : 'TestCase',
	#category : 'OpenPonk-SynchronizedLinks-Tests',
	#package : 'OpenPonk-SynchronizedLinks',
	#tag : 'Tests'
}

{ #category : 'tests' }
SRManyToManyLinkTest >> testChangePair [
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
]

{ #category : 'tests' }
SRManyToManyLinkTest >> testFromCollection [
	| a1 b1 b2 |
	a1 := SRTestAuthor new.
	b1 := SRTestBook new.
	a1 books add: b1.
	b2 := SRTestBook new.
	a1 books: {b2}.
	self assert: a1 books asArray equals: {b2}.
	self assert: b2 authors asArray equals: {a1}.
	self assert: b1 authors asArray equals: {}
]

{ #category : 'tests' }
SRManyToManyLinkTest >> testFromCollectionMultiple [
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
]

{ #category : 'tests' }
SRManyToManyLinkTest >> testFromNone [
	| a1 b1 |
	a1 := SRTestAuthor new.
	b1 := SRTestBook new.
	a1 books add: b1.
	self assert: a1 books asArray equals: {b1}.
	self assert: b1 authors asArray equals: {a1}
]

{ #category : 'tests' }
SRManyToManyLinkTest >> testSton [
	| author b1 b2 ston materializedA2 |
	author := SRTestAuthor new.
	b1 := SRTestBook new.
	b2 := SRTestBook new.
	author books add: b1.
	author books add: b2.
	ston := STON toStringPretty: author.
	materializedA2 := STON fromString: ston.
	self assertCollection: materializedA2 books size equals: 2.
	self
		assertCollection: materializedA2 books first authors size
		equals: 1.
	self
		assertCollection: materializedA2 books first authors first
		equals: materializedA2
]

{ #category : 'tests' }
SRManyToManyLinkTest >> testToNone [
	| a1 b1 |
	a1 := SRTestAuthor new.
	b1 := SRTestBook new.
	a1 books add: b1.
	a1 books remove: b1.
	self assert: a1 books asArray equals: {}.
	self assert: b1 authors asArray equals: {}
]
