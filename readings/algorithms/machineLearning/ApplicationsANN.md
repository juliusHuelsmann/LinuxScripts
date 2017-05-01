
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
That equation resembles a bit to the following equation 
$$ w_{k+i} = C \cdot w_k,$$ 
easily proven to  converge to the ev to the largest evalue of $C$. With that in mind, we write the weight vector $w$ wrt the eigenbasis:
$$ $$
$$\begin{align}
w_0 :=& \sum\limits_{i=1}^N a_i e_i\\
w_1 =& w + \epsilon C w = \sum\limits_{i=1}^N (a_i + a_i \epsilon \lambda_i) e_i\\
w_{k+1} =& w_k + \epsilon C w_k = \sum\limits_{i=1}^N \sum\limits_{j=0}^k a_i (\epsilon \lambda_i)^j e_i\end{align}$$
From those equations we extract the following properties:
## Further Properties
- Convergence to the 'largest' eigenvalue $=:e_1$ (like the ev is scale invariant and the factor of the largest eigenvalue grows the most rapidly)
- convergence to $\infty_{\mathbb{R}^N}:$

# Oja's rule
- solves the problem of a weight diverging to $\infty$.
$$ w_{t+1} = \frac{w_t + \epsilon y^{\alpha}x^\alpha}{\|w_t + \epsilon y^{\alpha}x^\alpha\|_2}$$ 
- Probem with that equation: Computation of the norm.
$$ w_{t+1} = w(t) + \epsilon \cdot \Delta w$$
for $\Delta w_j = \epsilon y(x^\alpha,w)\left ( x_j - y(x^\alpha, w) w_j\right)$ which is the outcome of a 2nd order taylor expansion around $\epsilon = 0$.

## Convergence Properties of Oja's rule
