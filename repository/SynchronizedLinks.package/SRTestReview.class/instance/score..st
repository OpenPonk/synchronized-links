accessing
score: aScore
	score := SRToOneLink
		on: self
		slot: #score
		oppositeSlot: #review
		updateFrom: score
		to: aScore