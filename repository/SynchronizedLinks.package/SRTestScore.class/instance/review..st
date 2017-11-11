accessing
review: aReview
	review := SRToOneLink
		on: self
		slot: #review
		oppositeSlot: #score
		updateFrom: review
		to: aReview