\name{permest}
\alias{permest}
\title{ Periodic Mean Estimation}
\description{
Assuming that the period \code{T} is known, procedure \code{permest} plots and returns the estimated periodic
 mean as a function of season. Missing data are permitted.
The confidence intervals for these values, based on the t-distribution, are also computed
and plotted. The de-meaned \code{x} is also returned with missing values
replaced by periodic mean values.
If at time \code{t} there is a missing value,
it is replaced with the periodic mean at \code{(t mod T)}, provided the periodic mean exists (meaning there is at least one non-missing data for the
season \code{(t mod T)}). Otherwise the periodic mean at \code{(t mod T)} will be set to \code{"Missing"} and in the output vectors
\code{xr} and \code{xd} all the values whose times are congruent with \code{(t mod T)} will be set to \code{"Missing"}.
}
\usage{
permest(x, T_t, alpha, missval, datastr,...)
}
\arguments{
  \item{x}{
input time series.
}
  \item{T_t}{
period of the computed mean.
}
  \item{alpha}{
\code{1-alpha} is confidence interval containment probability using the t-distribution.
}
  \item{missval}{
notation for missing values.
}
  \item{datastr}{
string name of data for printing.
}
  \item{...}{other arguments used in the plot: \code{typeci}, \code{typepmean}, \code{pchci}, \code{pchpmean}, \code{colci}, \code{colpmean}, \code{pp};\cr
\code{typeci} / \code{typepmean}, \code{pchci} / \code{pchpmean}, \code{colci} / \code{colpmean} set the type, plot character and colors of confidence
intervals / periodic mean values on the plot, \cr
\code{pp} should be positive to print and plot \code{permest} values.\cr
By default these parameters are fixed to \code{typeci = "o"}, \code{typepmean = "b"}, \code{pchci = 10}, \code{pchpmean = 15}, \code{colci = "red"}, \code{colpmean = "blue"}, \code{pp = 1}.
}
}
\details{
The series may contain missing values (we suggest using \code{NaN})
and the length of the series need not be
an integer multiple of the period. The program returns
and plots the periodic mean with \code{1-alpha} confidence
intervals based on all non-missing values present for each
particular season. The p-value for a one-way
ANOVA test for equality of seasonal means is also computed.
}
\value{
procedure returns:
\item{pmean}{periodic mean values.}
\item{lower,upper}{bounds of the confidence intervals.}
\item{xr}{series with missing values replaced by periodic mean values.}
\item{xd}{series after removing periodic mean.}
\item{pmpv}{p-value for a one-way ANOVA test for equality of means.}
}
\references{
Hurd, H. L., Miamee, A. G., (2007), Periodically Correlated Random Sequences:
Spectral Theory and Practice, Wiley InterScience.
\cr
\cr
Westfall, P. H., Young, S. S. (1993), Resampling-Based Multiple Testing: Examples and Methods
 for p-Value Adjustment, Wiley Series in Probability and Statistics.
}
\author{
Harry Hurd
}
\seealso{
\code{\link{persigest}}
}
\examples{
data(arosa)
dev.set(which=1)
permest(t(arosa),12, 0.05, NaN,'arosa')
}
\keyword{ periodic mean }

