"
I represent a collection of references to multiple objects.
"
Class {
	#name : #SRToManyLink,
	#superclass : #Collection,
	#instVars : [
		'source',
		'targetSlotName',
		'collection',
		'slotName'
	],
	#category : 'SynchronizedLinks-Links'
}

{ #category : #'instance creation' }
SRToManyLink class >> on: aSource slot: aSourceSlot oppositeSlot: aTargetSlotName [
	^ self new setSource: aSource slot: aSourceSlot  oppositeSlot: aTargetSlotName
]

{ #category : #adding }
SRToManyLink >> add: aNewObject [
	(self includes: aNewObject)
		ifTrue: [ ^ aNewObject ].
	self removeOppositeFrom: aNewObject.
	self uncheckedAdd: aNewObject.
	self addOppositeTo: aNewObject.
	^ aNewObject
]

{ #category : #adding }
SRToManyLink >> addOppositeTo: anObject [
	| oppositeObject |
	oppositeObject := anObject readSlotNamed: targetSlotName.
	(oppositeObject isKindOf: SRToManyLink)
		ifTrue: [ oppositeObject uncheckedAdd: source ]
		ifFalse: [ anObject writeSlotNamed: targetSlotName value: source ]
]

{ #category : #accessing }
SRToManyLink >> at: anInteger [
	^ collection at: anInteger
]

{ #category : #accessing }
SRToManyLink >> atLast: anInteger [
	^ collection atLast: anInteger
]

{ #category : #copying }
SRToManyLink >> copy [
	^ collection copy
]

{ #category : #copying }
SRToManyLink >> copyEmpty [
	^ collection copyEmpty 
]

{ #category : #enumerating }
SRToManyLink >> do: aBlock [
	collection do: aBlock
	
]

{ #category : #accessing }
SRToManyLink >> first [
	^ collection first
]

{ #category : #testing }
SRToManyLink >> includes: anObject [
	^ collection includes: anObject
]

{ #category : #adding }
SRToManyLink >> initialize [
	super initialize.
	collection := OrderedCollection new
]

{ #category : #accessing }
SRToManyLink >> last [
	^ collection last
]

{ #category : #accessing }
SRToManyLink >> last: n [
	^ collection last: n
]

{ #category : #removing }
SRToManyLink >> remove: oldObject ifAbsent: anExceptionBlock [
	oldObject ifNil: [ "there is some oddity when instantiating metamodel" ^ self ].
	(collection includes: oldObject)
		ifFalse: [ ^ anExceptionBlock value ].
	self removeOppositeFrom: oldObject.
	collection remove: oldObject" ifAbsent: [  ]"
]

{ #category : #removing }
SRToManyLink >> removeAll [
	[ self isNotEmpty ] whileTrue: [ self remove: self anyOne ]
]

{ #category : #adding }
SRToManyLink >> removeOppositeFrom: anObject [
	| oppositeObject |
	oppositeObject := anObject perform: targetSlotName.
	oppositeObject ifNil: [ ^ self ].
	(oppositeObject isKindOf: SRToManyLink)
		ifTrue: [ (oppositeObject includes: source)
				ifTrue: [ oppositeObject uncheckedRemove: source ].
			^ self ].
	(oppositeObject readSlotNamed: slotName)
		ifNotNil: [ :doubleOpposite | 
			doubleOpposite = (source perform: slotName)
				ifTrue: [ ^ anObject writeSlotNamed: targetSlotName value: nil ].
			(doubleOpposite isKindOf: SRToManyLink)
				ifTrue: [ doubleOpposite uncheckedRemove: anObject ]
				ifFalse: [ doubleOpposite writeSlotNamed: slotName value: nil ] ]
]

{ #category : #accessing }
SRToManyLink >> second [
	^ collection second
]

{ #category : #initialization }
SRToManyLink >> setSource: aSource slot: aSlotName oppositeSlot: aTargetSlotName [
	source := aSource.
	slotName := aSlotName.
	targetSlotName := aTargetSlotName.
]

{ #category : #accessing }
SRToManyLink >> size [
	^ collection size
]

{ #category : #private }
SRToManyLink >> species [
	^ OrderedCollection
]

{ #category : #adding }
SRToManyLink >> uncheckedAdd: anObject [
	^ collection addIfNotPresent: anObject
]

{ #category : #adding }
SRToManyLink >> uncheckedRemove: anObject [
	collection remove: anObject
]
