Class {
	#name : #SRManyToManyLinkInterfaceTest,
	#superclass : #TestCase,
	#instVars : [
		'a1',
		'b1',
		'b2'
	],
	#category : 'SynchronizedLinks-Tests'
}

{ #category : #initialization }
SRManyToManyLinkInterfaceTest >> setUp [
	a1 := SRTestAuthor new.
	b1 := SRTestBook new.
	b2 := SRTestBook new.
	a1 books add: b1.
	a1 books add: b2
]

{ #category : #tests }
SRManyToManyLinkInterfaceTest >> testAt [
	self assert: (a1 books at: 1) equals: a1 books first.
	self assert: (a1 books at: 2) equals: a1 books second
]

{ #category : #tests }
SRManyToManyLinkInterfaceTest >> testAtLast [
	self assert: (a1 books atLast: 2) equals: a1 books first.
	self assert: (a1 books atLast: 1) equals: a1 books second
]

{ #category : #tests }
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

{ #category : #tests }
SRManyToManyLinkInterfaceTest >> testCopyEmpty [
	| empty |
	empty := a1 books copyEmpty.
	self assert: empty isEmpty.
	self assert: empty species equals: a1 books species
]

{ #category : #tests }
SRManyToManyLinkInterfaceTest >> testFirst [
	self assert: a1 books first equals: b1
]

{ #category : #tests }
SRManyToManyLinkInterfaceTest >> testLast [
	self assert: a1 books last equals: b2
]

{ #category : #tests }
SRManyToManyLinkInterfaceTest >> testLastN [
	self assert: (a1 books last: 2) asArray equals: (Array with: b1 with: b2)
]

{ #category : #tests }
SRManyToManyLinkInterfaceTest >> testSecond [
	self assert: a1 books second equals: b2
]

{ #category : #tests }
SRManyToManyLinkInterfaceTest >> testSpecies [
	self assert: a1 books species equals: OrderedCollection
]
