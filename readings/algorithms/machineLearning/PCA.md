
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
$$\begin{align} \text{arg}\max\limits_{e_a} \text{ Variance algon } e_a \qquad &s.t.\qquad \|e_a\| = 1\\
\text{arg}\max\limits_{e_a} C \cdot e_a \qquad &s.t. \qquad\|e_a\|^2_2 = 1\\
\max\limits_{e_a} e_a^T \cdot C \cdot e_a \qquad&- \qquad(e_a^T e_a - 1) \lambda \end{align}$$
derivation yields to the followin ev problem
$$ Ce_a = \lambda e_a$$
which is a necessary condition for an extrem point.
Considering the variance along the different Evectors:
$$ e_a^T C e_a = e_a^T \lambda e_a = \lambda \| e_a\| = \lambda$$
yields to taking the eigenvector with the largest eigenvalue.

## Steps to take
- TRAINING
	1. Center data, store mean $m$ for being able to center the test data 
	2. Compute Covariance matrix $C:=X^TX$
	3. Compute k EVectors corresponding to the k largest EValues of $C$.
	4. Project the data to these eigenvectors by computing structure$^T\cdot$ data.
- Application to new data
	1. 'center' new data point $x$ according the the mean $m$ computed above
	2. use the structure computed above and compute structure$^T\cdot x$
- Map the projected data into the original space
	1. Do steps (1-2) of 'Application to new data' (yielding 'result')
	2. compute result $\cdot$ structure and voilà the data in the original space.


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

# Kernalized PCA - Kernel trick
- Problems:
	- X^T x very large
	- too few samples for a robust estimate of the covariance matrix.

- Motivation
	- We know the evec is approx a linear combination of the different data points $X = (x_1, \dots, x_N) \in \mathbb{R}^{D\times N}$ for $N < D$
	- substitute $w = X \alpha$
	- Solve $X X^T X \alpha  = \lambda X \alpha$ instead of $X X^T w = \lambda w$
	- we call $X^TX \in \mathbb R^{N,N}$ the kernel 
	- and solve $X^TX \alpha = \lambda \alpha$ (lower dimensional)

## Properties
- Extends PCA to potentially nonlinear dependencies
- makes PCA applicable to highdim data.

# Relation to SVD
$$X=ESF$$
- $E, F$ orthogonal
- $S$ diagonal

$$\begin{align} XX^T = ESFF^TS^TE^T = E S^2 E^T\end{align}$$
$$\begin{align} X^TX = F^TS^TE^TESF= F^T S^2 F\end{align}$$

- Thus $E$ ev of $XX^T$, $F$ of $X^TX$ and $S$ sqrt of EVAl

## Relation Linear kernel PCA to classical PCA


The relation to the linear kernel lies in 
$$ ES = XF^T$$???#noclue