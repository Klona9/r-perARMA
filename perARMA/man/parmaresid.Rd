\name{parmaresid}
\alias{parmaresid}

\title{
Computing residuals of PARMA series
}
\description{
Procedure \code{parmaresid}, given \code{phi} (of size \eqn{T \times p}), \code{del} 
(of size \eqn{T \times 1}), 
\code{theta} (of size \eqn{T \times q}), computes the residuals of PARMA series.
 
}
\usage{
parmaresid(x, stype, del, phi,...)
}
\arguments{
  \item{x}{
input time series.
}
\item{stype}{ numeric parameter connected with covariance matrix computation, so far should be equal to 0 to use procedure 
\code{R_w_ma} (see \code{R_w_ma} description). In the future also other values of \code{stype} will be available for 
full covariance matrix computation.
}
  \item{del}{
vector of coefficients of length \eqn{T}.
}
  \item{phi}{
matrix of coefficients of  size \eqn{T \times p}.
}

  \item{...}{
matrix of coefficients \code{theta} of size \eqn{T \times q}.
}
}
\details{
This program uses \code{parmafil} to filter the series and computes the  covariance matrix. 
This code does the Cholesky factorization and 
determines the residuals from the inverse of \code{L} (see the code: 
\code{e=Linv*w0_r1}). This allows the treatment of a deficient rank 
covariance and a reduction of rank. 
Procedure \code{parmaresid} is used in \code{parmaf} function.
}
\value{
Series of residuals \code{resids}.
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
}
\author{
Harry Hurd 
}
\seealso{
 \code{\link{R_w_ma}},  \code{\link{loglikec}}, \code{\link{loglikef}} 
}
\examples{
## Do not run 
## It could take a few seconds

#data(volumes)
#pmean<-permest(t(volumes),24, 0.05, NaN,'volumes', pp=0)
#xd=pmean$xd
#estimators<-perYW(volumes,24,2,NaN)

#parmaresid(xd, 0, estimators$del, estimators$phi)

}