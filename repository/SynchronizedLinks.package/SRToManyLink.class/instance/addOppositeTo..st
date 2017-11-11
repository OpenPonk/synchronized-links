adding
addOppositeTo: anObject
	| oppositeObject |
	oppositeObject := anObject readSlotNamed: targetSlotName.
	(oppositeObject isKindOf: SRToManyLink)
		ifTrue: [ oppositeObject uncheckedAdd: source ]
		ifFalse: [ anObject writeSlotNamed: targetSlotName value: source ]