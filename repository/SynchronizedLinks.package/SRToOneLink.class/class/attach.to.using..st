as yet unclassified
attach: anItem to: aContainer using: anItemSlotName
	| oppositeValue |
	aContainer ifNil: [ ^ self ].
	oppositeValue := aContainer perform: anItemSlotName.
	(oppositeValue isKindOf: SRToManyLink)
		ifTrue: [ oppositeValue uncheckedAdd: anItem ]
		ifFalse: [ aContainer writeSlotNamed: anItemSlotName value: anItem ]