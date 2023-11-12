\name{loglikec}
\alias{loglikec}
\title{
Calculation of the logarithm of likelihood function
}
\description{
Function \code{loglikec}, given \code{phi}, \code{del}, \code{theta}
encoded in  \code{ptvec}, evaluates the logarithm of likelihood function from the
PARMA series. Procedure returns also values of the AIC, FPE, BIC information criteria and MSE of residuals,
 what enables to examine residuals and  evaluate godness of model fit.
}
\usage{
loglikec(ptvec, x, conpars)
}
\arguments{
  \item{ptvec}{
vector of parameters for PARMA(p,q) model, containing matrix parameters
\code{phi} (of size \eqn{T \times p}), \code{del} (of size \eqn{T \times 1}),
\code{theta} (of size \eqn{T \times q}) as following \cr
\code{ptvec = [phi[,1],...,phi[,p],del,theta[,1], ...,theta[,q]]}.
}
  \item{x}{
input time series.
}
  \item{conpars}{vector of parameters \code{[T, p, q, stype]},\cr
 \code{T_t} period of PC-T structure,\cr
 \code{p, q} maximum PAR and PMA order, respectively,\cr
 \code{stype}  numeric parameter connected with covariance matrix computation, so far should be equal to 0 to use procedure
\code{R_w_ma} (see \code{R_w_ma} description). In the future also other values of \code{stype} will be available for
full covariance matrix computation.
}
}
\details{
In this procedure first series \code{x} is filtered by matrix coefficients \code{phi}, \code{del}, \code{theta}.
The code to compute logarithm of likelihood function must includes
the computation of covariance matrix from the parameters \code{phi}, \code{del}, \code{theta}.
Since the inverse of the computed covariance is needed for computing the likelihood,
and it is sometimes ill conditioned (or even singular),
the condition is improved by removing rows and columns corresponding to very small eigenvalues.
This corresponds to removing input data that is highly linearly dependent on the remaining
input data. The procedure contains a threshold ZTHRS (which current value is \code{10*eps}) that governs the discarding of rows and column corresponding to small eigenvalues (these are determined by a Cholesky decomposition). Any eigenvalue smaller than the threshold has its row and column deleted from the matrix. Then the
inverse and the likelihood are computed from the reduced rank covariance matrix.
}
\value{
list of values:
\item{loglik}{logarithm of likehood function (nagative value).}
\item{aicval}{value of AIC criterion.}
\item{fpeval}{value of FPE criterion.}
\item{bicval}{value of BIC criterion.}

}
\note{
In the \code{loglikec} procedure, motivated by the possibility of deficient rank sequences, we made a variant of the Cholesky decomposition. In proposed approach upper traingular
matrix eliminates data points that are lineary dependant on previous ones and removes their consideration in the likelihood value calculation. As a consequence data vector
is reduced so that covariance matrix is positive definite and problem of non-invertible covariance matrix is avoided.
}
\references{
Box, G. E. P., Jenkins, G. M., Reinsel, G. (1994), Time Series Analysis, 3rd Ed., Prentice-Hall,
Englewood Cliffs, NJ.
\cr
\cr
Brockwell, P. J., Davis, R. A. (1991), Time Series: Theory and Methods, 2nd Ed., Springer: New York.
\cr
\cr
Vecchia, A., (1985), Maximum Likelihood Estimation for Periodic Autoregressive Moving Average Models, Technometrics, v. 27, pp.375-384.
\cr
\cr
Vecchia, A., (1985), Periodic autoregressive-moving average (PARMA) modeling with applications to water resources, Water Resources
Bulletin, v. 21, no. 5.
}
\author{
Harry Hurd
}
\seealso{
  \code{\link{R_w_ma}},  \code{\link{parmafil}}
}
\examples{
## Do not run
## It could take a few seconds
\donttest{
data(volumes)
pmean<-permest(t(volumes),24, 0.05, NaN,'volumes', pp=0)
xd=pmean$xd
estimators<-perYW(volumes,24,2,NaN)
estvec=c(estimators$phi[,1],estimators$phi[,2],estimators$del)
loglikec(estvec,xd,c(24,2,0,0))
}
}
\keyword{Likehood}
\keyword{AIC}
\keyword{BIC}
\keyword{FPE}
