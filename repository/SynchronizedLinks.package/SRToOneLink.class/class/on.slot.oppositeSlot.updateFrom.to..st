as yet unclassified
on: aSource slot: aSourceSlotName oppositeSlot: aTargetSlotName updateFrom: anOldTarget to: aNewTarget
	"S1 <-> T1 | S2 <-> T2 | S1: T2"

	anOldTarget = aNewTarget
		ifTrue: [ ^ self ].

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