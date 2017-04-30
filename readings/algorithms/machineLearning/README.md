
# Fundamental basics
Let $x\in \mathbb{R}^M$ and $X:= (x_1, \dots, x_p)$
$$ m:= \frac{1}{p} \sum\limits_{\alpha=1}^{p}x^\alpha$$
$$ C_ij := \frac{1}{p-1} \sum\limits_{\alpha=1}^{p} (x_i^\alpha - m_i)^T(x_j^\alpha - m_j)$$

- uncorrolated $\Leftarrow$ independend but
- uncorrolated $\not \Rightarrow$ independent


#### Properties Covariance matrix
- symmetric
- real-valued
- Variance along direction $u_i = e_i^T x$: $\sigma_i^2 = e_i^ C e_i$


# Subjects by timestemp
- [1. PCA and Novelty filter](PCA.md)
- [2. Application PCA, Novelty Filter to neuronal networks: Hebbian Learning and Oja's rule](hebbian.md)


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