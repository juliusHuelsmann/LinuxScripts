
# Hebbian learning
- application of PCA to the situation of a connectionist neuron
- Samples $x^\alpha \in \mathbb{R}^N$, $\alpha \in \{1, \dots, p\}$
- Hebbina learning: fire together -> wire together. Thus fireing approx simultaneously yields in strengthened weights between the neurons.


## Algorithm
- Initialization
	- Chose weights
	- chose learning rate $\epsilon$
- Processing
	1. choose observation $x^\alpha$
	2. change weights according to $\Delta w = \epsilon y(x^\alpha, w)\cdot x^\alpha$

## Properties
- weight vector converges to the PC with the largest eigenvalue.

PROOF:
$$\Delta w_j = \frac{\epsilon}{p} \sum\limits_{\alpha=1}^p y(x^\alpha, w) \cdot x^\alpha$$
leads to 
$$\Delta w = \epsilon C w$$