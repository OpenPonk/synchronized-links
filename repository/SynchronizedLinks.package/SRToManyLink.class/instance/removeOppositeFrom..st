adding
removeOppositeFrom: anObject
	| oppositeObject |
	oppositeObject := anObject perform: targetSlotName.
	oppositeObject ifNil: [ ^ self ].
	(oppositeObject isKindOf: SRToManyLink)
		ifTrue: [ (oppositeObject includes: source)
				ifTrue: [ oppositeObject uncheckedRemove: source ].
			^ self ].
	(oppositeObject readSlotNamed: slotName)
		ifNotNil: [ :doubleOpposite | 
			doubleOpposite = (source perform: slotName)
				ifTrue: [ ^ anObject writeSlotNamed: targetSlotName value: nil ].
			(doubleOpposite isKindOf: SRToManyLink)
				ifTrue: [ doubleOpposite uncheckedRemove: anObject ]
				ifFalse: [ doubleOpposite writeSlotNamed: slotName value: nil ] ]