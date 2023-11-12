\name{acfpacf}
\alias{acfpacf}
\alias{acfpacf.acf}
\alias{acfpacf.pacf}
\title{
Plotting usual ACF and PACF
}
\description{


Plots values of usual ACF and PACF functions with confidence
intervals. Function \code{acfpacf} uses procedures \code{acfpacf.acf} and
\code{acfpacf.pacf}, which computes values of ACF and PACF function, respectively.
}
\usage{
acfpacf(x, nac, npac, datastr,...)
acfpacf.acf(x, normflg)
acfpacf.pacf(x, m)
}
\arguments{
  \item{x}{
input time series, missing values are not permitted.
}
  \item{nac}{
number of ACF values to return (typically much less than length of \code{x}).
}
  \item{npac}{
number of PACF values to return (typically much less than length of \code{x}).
}
  \item{datastr}{
string name of data to be printed on the plot.
}
  \item{normflg}{
computing parameter for ACF values. These values are returned as a series \code{acf(k)} for \code{k = 0, ..., nr}, where \code{nr}
is length of \code{x}. Parameter \code{normflg} can be equal to: \cr
0 - \code{acf(k)} values will be normalized by \code{nr},\cr
1 - \code{acf(k)} values will be normalized by \code{nr} multiplied by sample variance (to obtain correlations), \cr
2 - \code{acf(k)} values will be divided by \code{nr-k}, thus normalized by number of samples at each lag,\cr
3 - \code{acf(k)} values will be divided by \code{nr-k} multiplied by sample variance.\cr
In \code{acfpacf} procedure \code{normflg=3} is used.
}
  \item{m}{
maximum lag to compute PACF values. Value for the first lag (\code{pacf(1)}) is equal to \code{acf(2)}, which is the lag 1 acf
value, and then for computing values for \code{k = 2, \ldots, m} the Toeplitz structure
 of the projection equations is used (see Brockwell, P. J., Davis, R. A., 1991, Time Series: Theory and Methods, example 4.4.2).
}
\item{...}{other arguments:\cr
 \code{plfg}, \code{acalpha}, \code{pacacalpha}, \code{valcol}, \code{thrcol}, \code{thrmhcol}, where \cr
 \code{plfg} is plotting flag, this parameter should be positive number to plot computed \code{acfpacf} values,\cr
 \code{acalpha} and \code{pacalpha} are p-values (or \code{alpha} is I type error) thresholds for ACF and PACF plots based on independent normal values,\cr
 \code{valcol,thrcol,thrmhcol} are colors of function values, confidence interval markers on the ACF/PACF and confidence interval markers on the ACF/PACF
for multiple hypothesis alpha correction on the plot.\cr
By default parameters are fixed to \code{plfg=1}, \code{acalpha=.05}, \code{pacacalpha=.05}, \code{valcol="red"}, \code{thrcol="green"}, \code{thrmhcol="blue"}.
}
}
\details{
Function \code{acfpacf} returns plot of ACF and PACF values with two types of
 thresholds for input \code{acalpha} and \code{pacalpha}, respectively. The first one
denoted by \code{thr} is given for ACF values by \eqn{ Pr[acf(j)>thr] = \alpha/2} and \eqn{Pr[acf(j)<-thr] = \alpha/2}
where \code{acf(k)} is the ACF value at lag \code{k}. This threshold corresponds to type I
 error for null hypothesis that \code{acf(k) = 0}. The plot allows to check if any of
 the ACF values are significantly non-zero. Actual
 threshold calculations are based on the following asymptotic result:
 if \eqn{X_t} is \eqn{IID (0,\sigma^2)}, then for large \eqn{n}, \eqn{\hat{\rho}(k)} for
 \eqn{k << n} are \eqn{IID N(0,1/n)} (see Brockwell, P. J., Davis, R. A., 1991, Time Series: Theory and Methods, example 7.2.1, p. 222).
Thus, under the null hypothesis, the plots for \code{thr = qnorm(1-acalpha/2,0,1/sqrt(nr))}
should exhibit a proportion of roughly \code{acalpha} points that lie outside
 the interval \code{[-thr, thr]}. Threshold for PACF is based on the same results. \cr
On the other hand we can also interpret the plots as a multiple hypothesis testing problem to compute second
 threshold \code{thrm}. Suppose, we decided to plot some number of nonzero lags (equal to \code{nac})
of the ACF function. If the estimated \code{acf} values estimates
 are IID then we have \code{nac} independent tests of \code{acf(k) = 0}. The probability that at least one of values
lies outside the interval \code{[-thr, thr]} is equal to \code{1-Pr[all lie inside]}, which is \code{[1-(1-acalpha)]^nac}.
Finally, the last expression is approximately
equal to \code{nac*acalpha}. To get a threshold \code{thrmh} such that \code{1-Pr[all lie inside] = acalpha}  we
 take the threshold as \cr
 \code{thrmh = qnorm (1-(acalpha/2)/nac, 0, 1/sqrt(nr))} (for more details check the Bonferroni correction).\cr
For the PACF, the threshold \code{thrm} calculation is based on Theorem 8.1.2
 of Time Series: Theory and Methods, p. 241, which states that the PACF values for an AR sequence are
asymptotically normal.

}
\references{
Box, G. E. P., Jenkins, G. M., Reinsel, G. (1994), Time Series Analysis, 3rd Ed., Prentice-Hall,
Englewood Cliffs, NJ.
\cr
\cr
Brockwell, P. J., Davis, R. A. (1991), Time Series: Theory and Methods, 2nd Ed., Springer: New York.
\cr
\cr
Bretz, F., Hothorn, T., Westfall, P. (2010), Multiple Comparisons Using R, CRC Press.
\cr
\cr
Westfall, P. H., Young, S. S. (1993), Resampling-Based Multiple Testing: Examples and Methods
 for p-Value Adjustment, Wiley Series in Probability and Statistics.

}
\value{No return value, called for side effects}
\author{
Harry Hurd
}
\note{
Procedure \code{acfpacf} is an implementation of the usual (meaning not periodic) ACF and PACF functions.
 It happens that for PC time series the usual ACF and PACF are still useful in the identification of model orders and in some cases can be more sensitive than
 the perodic versions. The ACF and PACF values inform about the correlations of the random part. It is possible to run \code{acfpacf} on original data which include the peridic mean as a deterministic component. But typically the periodic mean can distort our understanding
 (or view) of the random fluctuations, thus running \code{acfpacf} additionally on the data after removing periodic mean is suggested.
 It is possible to use also \code{acfpacf.acf}, \code{acfpacf.pacf} procedures to obtain values of
ACF and PACF functions, respectively. When subjected to a truly PC sequence, the usual
ACF and PACF produce an average of the instantaneous (time indexed)
values produced by periodic ACF and periodic PACF. Depending therefore on correlations
 between these averaged quantities, the usual ACF and PACF may be more or
 less sensitive that the instantaneous ones.
}
\seealso{
\code{\link{peracf}}, \code{\link{perpacf}}
}

\examples{
data(volumes)
# for original data
dev.set(which=1)
acfpacf(volumes,24,24,'volumes')

# for data after removing periodic mean
pmean_out<-permest(t(volumes),24, 0.05, NaN,'volumes',pp=0)
xd=pmean_out$xd
dev.set(which=1)
acfpacf(xd,24,24,'volumes')
}
\keyword{ACF}
\keyword{PACF}

