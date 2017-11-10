accessing
books
	^ books ifNil: [ books := SRManyToManyLink from: self to: #authors ]