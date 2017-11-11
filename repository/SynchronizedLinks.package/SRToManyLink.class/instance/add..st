adding
add: aNewObject
	(self includes: aNewObject)
		ifTrue: [ ^ aNewObject ].
	self removeOppositeFrom: aNewObject.
	self uncheckedAdd: aNewObject.
	self addOppositeTo: aNewObject.
	^ aNewObject