\name{Bcoeff, Bcoeffa}
\alias{Bcoeff}
\alias{Bcoeffa}
\title{
Fourier representation of covariance function
}
\description{
The procedure \code{Bcoeff} computes the complex estimators
\eqn{ B_{k}(\tau) = \frac{1}{T} \sum_{t=0}^{T-1}R(t+\tau,t)\exp(-i 2 \pi t /T)}
 as Fourier coefficients in covariance function representation.
The procedure first computes the periodic mean
 (with missing values ignored) and subtracts it from the series.
For each specified lag \eqn{\tau}, the values of
 \eqn{\hat{B}_{k}(\tau)} are computed only for
\eqn{ k= 0, 1, \ldots,\left\lfloor T/2 \right\rfloor},
because for real series
\eqn{ \hat{B}_{k}(\tau)= \overline{\hat{B}_{T-k}(\tau)}}.
 Also the p-values for the test \eqn{ B_{k}(\tau)=0} are returned. \cr
The function \code{Bcoeffa} calculates the estimator of the real
coefficients \eqn{ a_{k}(\tau)} which satisfy
\eqn{ R(t+\tau,t) = B(t,\tau) = a_1(\tau) + \sum (a_{2k}(\tau) \cos(2 \pi k t/ T)+a_{2k+1}(\tau) \sin(2 \pi k t/ T)) },
 for all required lags \eqn{ \tau} and  \eqn{k}.
}
\usage{
Bcoeff(x, T_t, tau, missval, datastr,...)
Bcoeffa(x, T_t, tau, missval, datastr,...)
}
\arguments{
  \item{x}{
input time series.
}
  \item{T_t}{
period length of PC-T structure.
}
  \item{tau}{
vector of lag values on which estimation of \eqn{B_k(\tau)} is performed.
}
  \item{missval}{
notation for missing values.
}
  \item{datastr}{
string name of data for printing.
}
\item{...}{other arguments:\cr
\code{printflg} should be a positive parameter to print,\cr
\code{meth} is a parameter connected to the amount of frequencies used in estimation, if \code{meth=0} all possible frequencies are used in estimation else
if \code{ meth > 0} then \eqn{ \left\lfloor n/2\right\rfloor} frequencies on either side of the Fourier frequencies \eqn{ 2\pi k/T} are used.\cr
By default parameters are fixed to \code{printflg=1, meth=0}.
}
}
\details{
This procedure can be applied to the original series to obtain estimators of \eqn{ B_{k}(\tau)} in covariance function representation
 or to the normalized series (series after  periodic mean removal and division by standard deviations) to obtain correlation coefficients.
The p-values for test of \eqn{|B_k(\tau)|^2=0} are based on
the ratio of magnitude squares of amplitudes of a high
resolution Fourier decompositions. Magnitudes for the
frequency corresponding to index \eqn{k} are compared to
the magnitudes of neighboring frequencies
(via the F distribution) (see Hurd, H. L., Miamee, A. G., 2007, Periodically Correlated Random Sequences, pp. 272-282, 288-292).
}
\value{
procedures (for positive \code{printflg} parameter) print a table containing the following columns:
\item{k}{index number of the coefficient \eqn{B_k(\tau)}.}
\item{reB_k,imB_k/ahat_k}{real and imaginary parts of estimated coefficient \eqn{B_k(\tau)} (\code{Bcoeff} procedure) / real coefficients in representation of coefficient
 \eqn{B_k(\tau)} (\code{Bcoeffa} procedure).}
\item{n1}{degrees of freedom associated to the estimator
\eqn{SS1/n1} of the variance at frequency \eqn{2\pi k /T}.}
\item{n2}{degrees of freedom associated to the
"background" variance estimation \eqn{SS2/n2} based on
frequencies in the neighborhood of the frequency \eqn{2\pi k /T}.}
\item{Fratio}{ the statistic \eqn{(SS1/n1)/(SS2/n2)}, which under
the null hypothesis has \eqn{F(n1,n2)} distribution.}
\item{pv}{p-values for test of \eqn{\left|B_k(\tau)\right|^2=0}, based on F distribution.}
If \code{printflg} is set to be equal to 0, above values are returned just as matrices.
}
\references{
Dehay, D., Hurd, H. L., (1994), Representation and Estimation for Periodically and Almost Periodically
Correlated Random Processes in W. A. Gardner (ed.), Cyclostationarity in Communications and Signal Processing, IEEE Press.
\cr
\cr
Hurd, H. L., Miamee, A. G., (2007), Periodically Correlated Random Sequences:
Spectral Theory and Practice, Wiley InterScience.\cr
}
\author{
Harry Hurd
}
\examples{
data(volumes)
Bcoeff(volumes,24,seq(0,12),NaN,'volumes')
Bcoeffa(volumes,24,seq(0,12),NaN,'volumes')
}
\keyword{Fourier representation of covariance}
