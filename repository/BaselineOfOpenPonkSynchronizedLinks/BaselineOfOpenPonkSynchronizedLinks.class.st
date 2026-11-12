"
Baseline for https://github.com/OpenPonk/synchronized-links
"
Class {
	#name : 'BaselineOfOpenPonkSynchronizedLinks',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfOpenPonkSynchronizedLinks',
	#package : 'BaselineOfOpenPonkSynchronizedLinks'
}

{ #category : 'baselines' }
BaselineOfOpenPonkSynchronizedLinks >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec package: 'OpenPonk-SynchronizedLinks'.
			spec package: 'OpenPonk-SynchronizedLinks-Tests' with: [ spec requires: #('OpenPonk-SynchronizedLinks') ].
			spec group: 'default' with: #('OpenPonk-SynchronizedLinks' 'OpenPonk-SynchronizedLinks-Tests') ]
]
