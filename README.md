# Synchronized Links
[![Build Status](https://travis-ci.com/OpenPonk/synchronized-links.svg?branch=master)](https://travis-ci.com/OpenPonk/synchronized-links) [![Coverage Status](https://coveralls.io/repos/github/OpenPonk/synchronized-links/badge.svg?branch=master)](https://coveralls.io/github/OpenPonk/synchronized-links?branch=master)

Self-synchronizing links between objects.

```smalltalk
review := SRTestReview new.
book := SRTestBook new.
review book: book.
self assert: review book equals: book.
self assert: book reviews asArray equals: {review}
```

```smalltalk
author := SRTestAuthor new.
book := SRTestBook new.
author books add: book.
self assert: author books asArray equals: {book}.
self assert: book authors asArray equals: {author}
```

## Installation

```smalltalk
Metacello new
	baseline: 'SynchronizedLinks';
	repository: 'github://OpenPonk/synchronized-links/repository';
	load.
```

## Usage

### To One Link

Review has a reference to a Single books.

```smalltalk
Review>>book
  ^ book

Review>>book: aBook
  book := SRToOneLink
    on: self
    slot: #book
    oppositeSlot: #reviews
    updateFrom: book
    to: aBook
```

### To Many Link

Single book can have many Reviews.

```smalltalk
Book>>reviews
	^ reviews
		ifNil: [ reviews := SRToManyLink
				on: self
				slot: #reviews
				oppositeSlot: #book ]

Book>>reviews: aCollection
  self reviews
    removeAll;
    addAll: aCollection
```

### Combinations

The link will automatically resolve what is on the opposite side, so all variations (1:1, 1:N, N:1, N:M) work automatically.

### Other possibly interesting notes

The objects are internally stored in a OrderedCollection. Support for Set/Bag/OrderedSet will be probably added in the future.
Slot implementation will probably also be added in the future.
