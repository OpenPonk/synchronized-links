accessing
authors
	^ authors ifNil: [ authors := SRManyToManyLink from: self to: #books ]