\name{persigest}
\alias{persigest}
\title{Periodic standard deviations
}
\description{
 Assuming that the period \code{T} is known, procedure \code{persigest} plots and returns the estimated periodic
 standard deviation as a function of season. Missing data are permitted. The
confidence intervals for these values, based on the chi-square distribution, are also
computed and plotted. The de-meaned and normalized series
 \code{xn} is returned. \cr
First, the periodic mean is computed using the method of \code{permest}. If at time \code{t} there is a missing value in the data, it is ignored
 in the computation of periodic standard deviation. For any season \code{(t mod T)} where all the data are missing, the periodic standard
 deviation is set to \code{"Missing"} and in the output vector \code{xn} all the values whose times are congruent with \code{(t mod T)} will be set to \code{"Missing"}.
}
\usage{
persigest(x, T_t, alpha, missval, datastr,...)
}
\arguments{
  \item{x}{
input time series.
}
  \item{T_t}{
period of the computed standard deviation.
}
  \item{alpha}{
\code{1-alpha} is confidence interval containment probability
using the chi-square distribution.
}
  \item{missval}{
notation for missing values.
}
  \item{datastr}{
string name of data for printing.
}
  \item{...}{other arguments used in the plot: \code{typeci}, \code{typepstd}, \code{pchci}, \code{pchpstd}, \code{colci}, \code{colpstd}, \code{pp};\cr
\code{typeci} / \code{typepstd}, \code{pchci} / \code{pchpstd}, \code{colci} / \code{colpstd} set the type, plot character and colors of confidence
intervals / periodic mean values on the plot, \cr
\code{pp} should be positive to print and plot \code{permest} values.\cr
By default parameters are fixed to \code{typeci = "o"}, \code{typepstd = "b"}, \code{pchci = 10}, \code{pchpstd = 15}, \code{colci = "red"}, \code{colpstd = "blue"}, \code{pp = 1}.
}
}
\details{
The series may contain missing values (we suggest using \code{NaN})
and the length of the series may not be
an integer multiple of the period. The program returns and plots the
periodic standard deviations with \code{1-alpha} confidence
intervals based on all non-missing values present for each particular
 season.
The p-value for Barttlet's test for homogenity of variance \eqn{ \sigma(t)
 \equiv \sigma} is also computed.
Rejection of homogeneity
(based on the \code{pspv} value) indicates a properly periodic variance,
 but leaves open whether or
not series is simply the result of a stationary process subjected
 to amplitude-scale modulation. To
resolve this\eqn{ R (t + \tau, t) } for  some \eqn{ \tau \neq 0 }
 need to be estimated.
}
\value{
procedure returns:
\item{pstd}{periodic standard deviations values.}
\item{lower,upper}{bounds of the confidence intervals.}
 \item{xn}{series after removing periodic mean and divided by standard deviations}
 \item{pspv }{p-value for Bartlett's test for the homogeneity of variance.}
}
\references{
Hurd, H. L., Miamee, A. G., (2007), Periodically Correlated Random Sequences:
Spectral Theory and Practice, Wiley InterScience.\cr
}
\author{
Harry Hurd
}
\seealso{
\code{\link{permest}}
}
\examples{
data(arosa)
dev.set(which=1)
persigest(t(arosa),12, 0.05, NaN,'arosa')
}
\keyword{ periodic standard deviations }

