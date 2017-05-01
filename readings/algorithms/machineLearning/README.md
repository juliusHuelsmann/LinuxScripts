
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
- [2. Application PCA, Novelty Filter to neuronal networks: Hebbian Learning and Oja's rule](applicationsann.md)

