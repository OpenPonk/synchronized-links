accessing
book: aBook
	book := SRToOneLink
		on: self
		slot: #book
		oppositeSlot: #reviews
		updateFrom: book
		to: aBook