\name{perARMA-package}
\alias{perARMA-package}
\alias{perARMA}
\docType{package}
\title{Periodic Time Series Analysis and Modeling}
\description{This package provides procedures for periodic
 time series analysis. The package includes procedures for nonparametric
 spectral analysis and parametric (PARMA) identification,
estimation/fitting and prediction. The package is
equipped with three examples of periodic time series: \code{volumes} and \code{volumes.sep},
 which record hourly volumes of traded energy, and \code{arosa} containing monthly ozone
levels.
}
\details{
\tabular{ll}{
Package: \tab perARMA\cr
Type: \tab Package\cr
Version: \tab 1.6\cr
Date: \tab 2016-02-25\cr
License: \tab GPL(>=2.0)\cr
LazyLoad: \tab yes\cr
}
The main routines are: \cr
Nonparametric spectral analysis: \code{pgram}, \code{scoh} \cr
Preliminary identification and conditioning: \code{permest}, \code{persigest} \cr
Identification: \code{peracf}, \code{Bcoeff}, \code{perpacf},  \code{acfpacf} \cr
Parameter estimation/fitting: \code{perYW}, \code{loglikec}, \code{parmaf}, \code{loglikef} \cr
Prediction: \code{predictperYW}, \code{predseries}\cr
Simulation and testing: \code{makeparma}, \code{parma_ident}\cr
\cr
For a complete list of procedures use \code{library(help="perARMA")}. \cr
}
\author{Anna Dudek, Harry Hurd and Wioletta Wojtowicz \cr
Maintainer: Karolina Marek <karolina.marek10@gmail.com>
}

\references{
Hurd, H. L., Miamee, A. G., (2007), Periodically Correlated Random Sequences:
Spectral Theory and Practice, Wiley InterScience.
}
\keyword{PARMA time series}
\keyword{periodically correlated sequence}
\seealso{
Packages for Periodic Autoregression Analysis \code{link{pear}},
Dynamic Systems Estimation \code{link{dse}} and
Bayesian and Likelihood Analysis of Dynamic Linear Models \code{link{dlm}}.
}
\examples{
## Do not run
## It could take more than one minute
#demo(perARMA)
}
