\name{perpacf}
\alias{perpacf}
\alias{ppfcoeffab}
\alias{ppfplot}
\title{
Periodic PACF function
}
\description{
The function \code{perpacf}, given an input time series, a specified period \code{T} and a lag \code{p}, computes
the periodic sample correlation coefficients \eqn{\pi(t,n)} and returns their values as a matrix \code{ppa}  of size \eqn{ T \times (p+1)}.\cr

The \code{ppfcoeffab} procedure transforms the output of \code{perpacf} into Fourier form, i.e. into Fourier coeficients,
so we can represent \eqn{\pi(t,n)} by its Fourier coefficients.\cr

Function \code{ppfplot} plots perpacf coefficients returned by \code{perpacf} as function of \code{n} for each specified lag \eqn{t=1, 2,\ldots, T}.
}
\usage{
perpacf(x, T_t, p, missval)
ppfcoeffab(ppf, nsamp, printflg, datastr)
ppfplot(ppf, nsamp, alpha, datastr)
}
\arguments{
  \item{x}{
input time series.
}
  \item{T_t}{
period of PC-T structure.
}
  \item{p}{
maximum lag used in computation.
}
  \item{missval}{
notation for missing values.
}
  \item{ppf}{
matrix of periodic PACF values (of size \eqn{T \times (p+1)}) returned by \code{perpacf} function.
}
  \item{nsamp}{
number of samples (periods) used to compute \code{ppf}.
}
  \item{printflg}{
parameter should be positive to return messages.
}
  \item{alpha}{
parameter for thresolds are displayed along with the Bonferroni corrected thresholds.
}
  \item{datastr}{
string name of data for printing.
}
}
\details{
Procedure \code{perpacf} returns \code{ppa} matrix, where for
each separation \code{n=0,1,...,p}, \code{ppa[,n]} is the value
of \eqn{\hat{\pi}(t,n)} for \code{t=1,2,...,T}. Further, since \code{T} is assumed to be the period of the underlying PC process,
\eqn{\pi(t,n)} is periodic in \code{t} with period \code{T}. So we can represent \eqn{\pi(t,n)} by its Fourier coefficients.
Further, if the variation in time of \eqn{\pi(t,n)} is really smooth over the period, then looking at
 these Fourier coefficients (the output of \code{ppfcoeffab}) may be a more sensitive detector of linear dependence
 of  \eqn{x_{t+1}} on the preceding \code{n} samples
(think of \code{n} as fixed here) than looking at \eqn{\pi(t,n)} for individual times.
The \code{ppfcoeffab} procedure  also needs the sample size \code{nsamp} used by \code{perpacf} in computing the \eqn{\pi(t,n)}
 in order to compute p-values for the \code{pkab} coefficients. The
p-values are computed assuming that for each \code{t}, \eqn{\pi(t,n)} is \code{N(0,1/sqrt(nsamp))} under the null.
The procedure \code{ppfcoeffab} is called in  \code{parma_ident}.
\cr
Function \code{ppfplot} plots values of \eqn{\pi(t,n+1)} and computes p-values for testing
if \eqn{ \pi(n_0+1,t)=0} for all \code{ t = 1, \ldots, T} and fix \eqn{n_0} (p-values in column labelled \eqn{n_0=n}) and
if \eqn{ \pi(n+1,t)=0} for all \code{ t = 1, \ldots, T} and \eqn{ n_0 \leq n \leq nmax} (p-values in column labelled \eqn{ n_0 \leq n \leq nmax}).
perpacf is plotted as function of n for each specified lag \eqn{t=1, 2,\ldots, T}.
}
\value{
The function \code{perpacf} returns two matrixes:
\item{ppa}{matrix of size \eqn{ T \times (p+1)} with perpacf coefficients.}
\item{nsamp}{matrix of size \eqn{ T \times (p+1)} with numbers of samples used in estimation of sample correlation.}

The function \code{ppfcoeffab} returns table of values:
\item{pihat_k}{Fourier coefficients \code{pkab} of \code{ppf} values.}
\item{pv}{Bonferroni corrected p-values.}

The function \code{ppfplot} returns plot of \eqn{\pi(t,n+1)} coefficients and table of p-vaules for provided
tests. Note that there are two plots; the first plot presents values of \eqn{\pi(t,n+1)} for all considered \eqn{t} and \eqn{n}, whereas
the second plot presents separate charts for particular \eqn{t} values.

}
\references{
Hurd, H. L., Miamee, A. G., (2007), Periodically Correlated Random Sequences: Spectral Theory and Practice, Wiley InterScience.
}
\author{
Harry Hurd
}
\seealso{
\code{\link{peracf}}
}
\examples{
 data(volumes)
 perpacf_out<-perpacf(t(volumes),24,12,NaN)
 ppa=perpacf_out$ppa
 nsamp=perpacf_out$nsamp
 ppfcoeffab(ppa,nsamp,1,'volumes')
 ppfplot(ppa,41,.05,'volumes')
}
\keyword{perpacf}

