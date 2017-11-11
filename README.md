# Synchronized Links
[![Build Status](https://travis-ci.org/peteruhnak/synchronized-links.svg?branch=master)](https://travis-ci.org/peteruhnak/synchronized-links) [![Coverage Status](https://coveralls.io/repos/github/peteruhnak/synchronized-links/badge.svg?branch=master)](https://coveralls.io/github/peteruhnak/synchronized-links?branch=master)

Self-synchronizing links between objects.

```smalltalk
| r1 b1 |
r1 := SRTestReview new.
b1 := SRTestBook new.
r1 book: b1.
self assert: r1 book equals: b1.
self assert: b1 reviews asArray equals: {r1}
```

```smalltalk
| a1 b1 |
a1 := SRTestAuthor new.
b1 := SRTestBook new.
a1 books add: b1.
self assert: a1 books asArray equals: {b1}.
self assert: b1 authors asArray equals: {a1}
```

## Installation

```
Metacello new
	baseline: 'SynchronizedLinks';
	repository: 'github://peteruhnak/synchronized-links/repository';
	load.
```

## Usage

### To One Link

Review has a reference to a Single books.

```smalltalk
Review>>book
  ^ book

Review>>book
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
