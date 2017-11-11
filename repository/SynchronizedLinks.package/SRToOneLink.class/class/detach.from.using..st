as yet unclassified
detach: anItem from: aContainer using: anItemSlotName
	| oppositeValue |
	aContainer ifNil: [ ^ self ].
	"ToMany link shouldn't be cleared of old values when new one is added"
	(aContainer isKindOf: SRToManyLink)
		ifTrue: [ ^ self ].
	oppositeValue := aContainer perform: anItemSlotName.
	(oppositeValue isKindOf: SRToManyLink)
		ifTrue: [ oppositeValue uncheckedRemove: anItem ]
		ifFalse: [ aContainer writeSlotNamed: anItemSlotName value: nil ]