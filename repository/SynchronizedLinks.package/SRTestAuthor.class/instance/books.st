accessing
books
	^ books
		ifNil: [ books := SRToManyLink
				on: self
				slot: #books
				oppositeSlot: #authors ]