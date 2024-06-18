"
Baseline for https://github.com/OpenPonk/synchronized-links
"
Class {
	#name : 'BaselineOfSynchronizedLinks',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfSynchronizedLinks',
	#package : 'BaselineOfSynchronizedLinks'
}

{ #category : 'baselines' }
BaselineOfSynchronizedLinks >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec package: 'SynchronizedLinks'.
			spec group: 'default' with: #('SynchronizedLinks') ]
]
