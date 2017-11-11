accessing
authors
	^ authors
		ifNil: [ authors := SRToManyLink
				on: self
				slot: #authors
				oppositeSlot: #books ]