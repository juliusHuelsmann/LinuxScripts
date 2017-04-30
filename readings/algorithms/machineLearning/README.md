# Fundamental basics
Let $x\in \R^M$ and $X:= (x_1, \dots, x_p)$
$$ m:= \frac{1}{p} \sum\limits_{\alpha=1}^{p}x^\alpha$$
$$ C_ij := \frac{1}{p-1} \sum\limits_{\alpha=1}^{p} (x_i^\alpha - m_i)^T(x_j^\alpha - m_j)$$
- uncorrolated <= independend but
- uncorrolated \not \Rightarrow independent


#### Properties Covariance matrix
- symmetric
- real-valued
- Variance along direction $u_i = e_i^T x$: $\sigma_i^2 = e_i^ C e_i$


# PCA
- linear method for data preprocessing
- dimensionality reuction
- compression
- uncorrelated features and whitening
- large covariance matrices numerical instable
- efficient algorithsm for extraction o PC with largest ev: EM , successive components via power method.
- Biologically inspires Hebbian learning.

- Extensions
	- nonleinear features(instead of directions) => kernel PCA
	- no underlying generative model => probabilitystic PCA, factor analysis


## Motivation
Find the directions in which the data has the highest variance.
$$\begin{align} argmax_{e_a} Variance \text{ algon } e_a \qquad s.t. \|e_a\| = 1\\
argmax e_a^T C e_a s.t. \|e_a\|^2_2 = 1\\
max e_a^T C e_a - (e_a^T e_a - 1) \lambda$$
derivation yields to the followin ev problem
$$ Ce_a = \lambda e_a$$
which is a necessary condition for an extrem point.
Considering the variance along the different Evectors:
$$ e_a^T C e_a = e_a^T \lambda e_a = \lambda \| e_a\| = \lambda$$
yields to taking the eigenvector with the largest eigenvalue.

## Properties PCA

- the components of the cov matrix in an orthogonal eigenbasis are uncorrelated. ($M^TCM = \lambda M^T M = diag(\lambda)$ like M is orthogonal
- Coordinate transformation M^T C M
- coordinate transformation of single point by M^T X M with X = (x, x, ...). so coordinates in eigenbasis are e_i^T x.
- So for being clear: transofrmation by struct^T * point.
- Latent factor: the directions that matter.

## Remarks on whitening
- Variance scale sensitive, make sure it is comparable along different dimensions
- Incompatible scales: scale variance along all directins to 1 after decorrolation by PCA
- $v^\alpha = \Lambda^{-1/2} M^T x^{\alpha}$


## Novelty filter
Idea: Compare data by checking if it has the same properties concerning small variation directions:



