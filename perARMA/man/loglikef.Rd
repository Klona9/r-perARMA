                                                                                                                                        
\name{loglikef}
\alias{loglikef}
\title{
Calculation of the logarithm of likelihood function (using Fourier representation)
}
\description{
Procedure \code{loglikef} computes the logarithm of likelihood function from the PARMA
 sequence \code{x} for matrices
\code{phi} (of size \eqn{T \times p}) and \code{theta} (of size \eqn{T \times (q+1)})
inputed in their Fourier representation as \code{a} and \code{b}, respectively.

}
\usage{
loglikef(ab, x, conpars)
}
\arguments{
  \item{ab}{
matrix \code{[a,b]} taken as a vector, where\cr
\code{a} is Fourier representation of \code{phi}
(use \code{phi=ab2phth(a)} to recover \code{phi}),\cr
\code{b} is Fourier representation of \code{theta}
(use \code{del=ab2phth(b[,1])} to recover \code{del} and 
\code{theta=ab2phth(b[,2:q+1])} to recover \code{theta}).\cr
Vector \code{ab} contains only non-zero coefficients form \code{a} and \code{b}.
}
  \item{x}{
input time series.
}
 \item{conpars}{
vector of parameters \code{[T,p,q,naf,nbf,del_mask,iaf,ibf,stype]}:\cr
 \code{T} period of PC-T structure,\cr
 \code{p, q} maximum PAR and PMA order, respectively,\cr
 \code{naf, nbf} total active coefficients in \code{a} and \code{b}, respectively,\cr
 \code{del_mask} vector of length \code{T} (it will be used in the future, so far the user should set \code{del_mask=matrix(1,T,1)}),\cr
 \code{iaf, ibf} linear indexes of active coefficients in \code{a} and \code{b}, respectively,\cr
  \code{stype}  numeric parameter connected with covariance matrix computation, so far should be equal to 0 to use procedure 
\code{R_w_ma} (see \code{R_w_ma} description). In the future also other values of \code{stype} will be available for 
full covariance matrix computation. 
}
}

\details{
This method of computation of logarithm of likelihood function makes use of the representation of the periodically varying parameters by Fourier series. 
This alternative parametrization of PARMA system, introduced by 
Jones and Breslford, can sometimes substantially reduce the number of parameters required to represent PARMA system. Mapping between  \code{phi} and \code{theta} coefficients
and \code{a} and \code{b} coefficients is one-to-one, so first
logarithm of likelihood is computed for transformed coefficients and then these coefficients are transformed to \code{phi} and \code{theta}. 
Fourier series parametrization permits us 
to reduce the total number of parameters by constraining some frequencies to have zero amplitude. Then the code  includes
the computation of covariance matrix from the parameters \code{phi}, \code{del}, \code{theta}.
 Since the inverse of the computed covariance is needed for computing the likelihood, and it is sometimes ill conditioned (or even singular), the condition is improved by removing rows and columns corresponding to very small eigenvalues. This corresponds to removing input data that is highly linearly dependent on the remaining input data. The procedure contains a threshold ZTHRS (which current value is \code{10*eps}) that governs the discarding of rows and column corresponding to small eigenvalues (these are determined by a Cholesky decomposition). Any eigenvalue smaller than the threshold has its row and column deleted from the matrix. Then the 
inverse and the likelihood are computed from the reduced rank covariance matrix.
}
\value{
negative value of the logarithm of likelihood function: \code{y}.
}
\references{
Box, G. E. P., Jenkins, G. M., Reinsel, G. (1994), Time Series Analysis, 3rd Ed., Prentice-Hall, Englewood Cliffs, NJ.
\cr
\cr
Brockwell, P. J., Davis, R. A., (1991), Time Series: Theory and Methods, 2nd Ed., Springer: New York.
\cr 
\cr
Jones, R., Brelsford, W., (1967), Time series with periodic structure, Biometrika 54, 403-408.
\cr
\cr
Makagon, A., (1999), Theoretical prediction of periodically correlated sequences, Probability and Mathematical Statistics 19 (2), 287-322.
\cr
\cr
Sakai, H., (1989), On the spectral density matrix of a periodic ARMA process, J. Time Series Analysis, v. 12, no. 2, pp. 73-82.
\cr
\cr
Vecchia, A., (1985), Maximum Likelihood Estimation for Periodic Autoregressive Moving Average Models, Technometrics, v. 27, pp.375-384.
}
\author{
Harry Hurd 
}
\note{
In the \code{loglikef} procedure, motivated by the possibility of deficient rank sequences, we made a variant of the Cholesky decomposition. In proposed approach upper traingular
matrix eliminates data points that are lineary dependant on previous ones and removes their consideration in the likelihood value calculation. As a consequence data vector
is reduced so that covariance matrix is positive definite and problem of non-invertible covariance matrix is avoided.\cr
This function is used in \code{parmaf} procedure, thus for more details please look also at \code{parmaf} code.
}
\seealso{
  \code{\link{R_w_ma}},  \code{\link{parmaresid}}, \code{\link{parmaf}}
}
\keyword{Likelihood}
