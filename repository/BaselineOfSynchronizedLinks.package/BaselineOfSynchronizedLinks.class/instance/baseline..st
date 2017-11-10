baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec package: 'SynchronizedLinks'.
			spec group: 'default' with: #('SynchronizedLinks') ]