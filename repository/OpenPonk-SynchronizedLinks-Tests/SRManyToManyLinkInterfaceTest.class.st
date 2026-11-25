"
Unit tests verifying the standard collection interface methods (such as #first, #last, and #at:) of SRToManyLink within a many-to-many relationship context.
"
Class {
	#name : 'SRManyToManyLinkInterfaceTest',
	#superclass : 'TestCase',
	#instVars : [
		'a1',
		'b1',
		'b2'
	],
	#category : 'OpenPonk-SynchronizedLinks-Tests-Links',
	#package : 'OpenPonk-SynchronizedLinks-Tests',
	#tag : 'Links'
}

{ #category : 'running' }
SRManyToManyLinkInterfaceTest >> setUp [

	super setUp.
	a1 := SRTestAuthor new.
	b1 := SRTestBook new.
	b2 := SRTestBook new.
	a1 books add: b1.
	a1 books add: b2
]

{ #category : 'tests' }
SRManyToManyLinkInterfaceTest >> testAt [
	self assert: (a1 books at: 1) equals: a1 books first.
	self assert: (a1 books at: 2) equals: a1 books second
]

{ #category : 'tests' }
SRManyToManyLinkInterfaceTest >> testAtLast [
	self assert: (a1 books atLast: 2) equals: a1 books first.
	self assert: (a1 books atLast: 1) equals: a1 books second
]

{ #category : 'tests' }
SRManyToManyLinkInterfaceTest >> testCopy [
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
]

{ #category : 'tests' }
SRManyToManyLinkInterfaceTest >> testCopyEmpty [

	| empty |
	empty := a1 books copyEmpty.
	self assertEmpty: empty.
	self assert: empty species equals: a1 books species
]

{ #category : 'tests' }
SRManyToManyLinkInterfaceTest >> testFirst [
	self assert: a1 books first equals: b1
]

{ #category : 'tests' }
SRManyToManyLinkInterfaceTest >> testIndexOf [

	| missingBook |
	missingBook := SRTestBook new.
	self assert: (a1 books indexOf: b1) equals: 1.
	self assert: (a1 books indexOf: b2) equals: 2.
	self assert: (a1 books indexOf: missingBook) equals: 0
]

{ #category : 'tests' }
SRManyToManyLinkInterfaceTest >> testLast [
	self assert: a1 books last equals: b2
]

{ #category : 'tests' }
SRManyToManyLinkInterfaceTest >> testLastN [
	self assert: (a1 books last: 2) asArray equals: (Array with: b1 with: b2)
]

{ #category : 'tests' }
SRManyToManyLinkInterfaceTest >> testRemoveReturnsRemovedElementAndHandlesAbsentAndNil [

	| removed absentResult nilResult |
	removed := a1 books remove: b1.
	self assert: removed identicalTo: b1.
	self assertCollection: a1 books asArray hasSameElements: { b2 }.
	self assertEmpty: b1 authors.

	absentResult := a1 books remove: b1 ifAbsent: [ #missing ].
	self assert: absentResult equals: #missing.

	nilResult := a1 books remove: nil ifAbsent: [ #missing ].
	self assert: nilResult identicalTo: a1 books
]

{ #category : 'tests' }
SRManyToManyLinkInterfaceTest >> testSecond [
	self assert: a1 books second equals: b2
]

{ #category : 'tests' }
SRManyToManyLinkInterfaceTest >> testSort [

	a1 books sort: [ :firstBook :secondBook | firstBook == b2 or: [ secondBook == b1 ] ].
	self assert: a1 books asArray equals: {
			b2.
			b1 }
]

{ #category : 'tests' }
SRManyToManyLinkInterfaceTest >> testSpecies [
	self assert: a1 books species equals: OrderedCollection
]
