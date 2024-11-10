"
author ->  books: N:M
"
Class {
	#name : 'SRTestAuthor',
	#superclass : 'Object',
	#instVars : [
		'books'
	],
	#category : 'OpenPonk-SynchronizedLinks-Tests',
	#package : 'OpenPonk-SynchronizedLinks',
	#tag : 'Tests'
}

{ #category : 'accessing' }
SRTestAuthor >> books [
	^ books
		ifNil: [ books := SRToManyLink
				on: self
				slot: #books
				oppositeSlot: #authors ]
]

{ #category : 'accessing' }
SRTestAuthor >> books: aCollection [
	self books
		removeAll;
		addAll: aCollection
]
