"
I represent a reference to a single object.
"
Class {
	#name : #SRToOneLink,
	#superclass : #Object,
	#category : 'SynchronizedLinks-Links'
}

{ #category : #'as yet unclassified' }
SRToOneLink class >> attach: anItem to: aContainer using: anItemSlotName [
	| oppositeValue |
	aContainer ifNil: [ ^ self ].
	oppositeValue := aContainer perform: anItemSlotName.
	(oppositeValue isKindOf: SRToManyLink)
		ifTrue: [ oppositeValue uncheckedAdd: anItem ]
		ifFalse: [ aContainer writeSlotNamed: anItemSlotName value: anItem ]
]

{ #category : #'as yet unclassified' }
SRToOneLink class >> detach: anItem from: aContainer using: anItemSlotName [
	| oppositeValue |
	aContainer ifNil: [ ^ self ].
	"ToMany link shouldn't be cleared of old values when new one is added"
	(aContainer isKindOf: SRToManyLink)
		ifTrue: [ ^ self ].
	oppositeValue := aContainer perform: anItemSlotName.
	(oppositeValue isKindOf: SRToManyLink)
		ifTrue: [ oppositeValue uncheckedRemove: anItem ]
		ifFalse: [ aContainer writeSlotNamed: anItemSlotName value: nil ]
]

{ #category : #'as yet unclassified' }
SRToOneLink class >> on: aSource slot: aSourceSlotName oppositeSlot: aTargetSlotName updateFrom: anOldTarget to: aNewTarget [
	"S1 <-> T1 | S2 <-> T2 | S1: T2"

	anOldTarget = aNewTarget
		ifTrue: [ ^ aNewTarget ].

	"T1 s: nil"
	self detach: aSource from: anOldTarget using: aTargetSlotName.
	"S2 t: nil"
	aNewTarget
		ifNotNil: [ (aNewTarget readSlotNamed: aTargetSlotName)
				ifNotNil: [ :oldSource | self detach: aNewTarget from: oldSource using: aSourceSlotName ].
			"T2 s: S1"
			self attach: aSource to: aNewTarget using: aTargetSlotName ].
	"S1 t: T1"
	^ aNewTarget
]
