# Synchronized Links

[![Nightly](https://github.com/OpenPonk/synchronized-links/actions/workflows/nightly.yml/badge.svg)](https://github.com/OpenPonk/synchronized-links/actions/workflows/nightly.yml) [![Coverage Status](https://coveralls.io/repos/github/OpenPonk/synchronized-links/badge.svg?branch=master)](https://coveralls.io/github/OpenPonk/synchronized-links?branch=master)

Self-synchronizing bidirectional links between objects in Pharo (`1:1`, `1:N`, `N:1`, `N:M`).

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

See [openponk.org/#direct-installation](https://openponk.org/#direct-installation) for the supported Pharo version.

```smalltalk
Metacello new
	baseline: 'OpenPonkSynchronizedLinks';
	repository: 'github://OpenPonk/synchronized-links';
	load.
```

## Usage

### To-One Link

`Review` holds a reference to a single `Book`:

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

### To-Many Link

A single `Book` can have many `Review`s:

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

The link automatically resolves the opposite side, so `1:1`, `1:N`, `N:1`, and `N:M` relations work automatically. Links store elements internally in an `OrderedCollection`.

## Documentation

Part of the [OpenPonk](https://openponk.org) platform. For architecture, the repository catalog, and contributing guidelines, see [`OpenPonk/.github`](https://github.com/OpenPonk/.github/blob/main/profile/README.md).
