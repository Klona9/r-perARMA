\name{perYW}
\alias{perYW}
\title{
Yule-Walker estimators of PAR model
}
\description{
Assuming known \code{T}, procedure \code{perYW} implements Yule-Walker 
estimation method for a periodic autoregressive PAR(p) model. 
Order of autoregression \code{p}, which could be specified using sample 
periodic PACF, is constant
for all seasons. For input time series \code{x}, matrix of parameters 
\code{phi} and vector of parameters
\code{del} are computed.
}
\usage{
perYW(x, T, p, missval)
}
\arguments{
  \item{x}{
input time series.
}
  \item{T}{
period of PC-T structure (assumed constant over time).
}
  \item{p}{
order of the autoregression.
}
   \item{missval}{
notation for missing values.
}
}
\details{
For fixed \code{T}, this procedure implements a periodic version of the
 Yule-Walker algorithm. 
The algorithm is based on solving for the best coefficients of
LS prediction of \eqn{X(t)} in terms of \eqn{X(t-1),...,X(t-p+1)}. 
Sample autocorrelations are used in place 
of population autocorrelations in the expressions of the best coefficients.

}
\value{
estimated parameters of PAR(p) model:
\item{phi}{matrix of coefficients for autoregressive part.}
\item{del}{vector of noise weights (consider them variances of the shocks).}
}
\references{
Brockwell, P. J., Davis, R. A. (1991), Time Series: Theory and Methods, 2nd Ed., Springer: New York.
\cr
\cr
Vecchia, A., (1985), Maximum Likelihood Estimation for Periodic Autoregressive Moving Average Models, Technometrics, v. 27, pp.375-384.

}
\author{
Harry Hurd 
}

\seealso{
\code{\link{predictperYW}}, \code{\link{loglikef}}, \code{\link{parmaf}}
}
\examples{
data(volumes)
perYW(volumes,24,2,NaN)
}
\keyword{Yule-Walker estimators}