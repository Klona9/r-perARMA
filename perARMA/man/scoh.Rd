\name{scoh}
\alias{scoh}
\title{
Plotting the squared coherence statistic of time series
}
\description{
The magnitude of squared coherence is computed in a specified square set of \eqn{( \lambda_p, \lambda_q) \in [0, 2\pi) }
and using a specified smoothing window. The perception of this empirical spectral coherence is aided
by plotting the coherence values only at points where thereshold is exceeded. For identification/discovery of 
PC structure, the sample periodic mean should be first subtracted from the series because a periodic mean itself has 
PC structure that can dominate and confound the perception of the second order PC structure.
}

\usage{
scoh(x, m, win,...)
}
\arguments{
  \item{x}{
input time series.
}
  \item{m}{
length of the smoothing window.
}
  \item{win}{
vector of smoothing weights, they should be non-negative.
}
  \item{...}{other arguments that will be connected with squared coherence statistic plot: \code{pfa}, \code{plflg}, \code{bfflg}, \code{ix}, \code{iy}, \code{nx}, \code{ny}, \code{datastr},
   where \cr
 \code{plflg} should be positive to plot values of statistic,\cr
 \code{pfa}  should be positive to plot threshold,\cr
 \code{bfflg} is a Bonferroni correction parameter; it sholud be positive to correct \code{pfa} before thresholding,\cr
 \code{ix} and \code{iy} are initial values at x and y axes (the lower left corner of plot),\cr
 \code{nx, ny} are the incremental frequency indices above the starting point \code{(ix,iy)} (the ending values of frequency index are \code{ix+nx,iy+ny}),\cr
 \code{datastr} string name of data for printing.\cr  
By default they are fixed to \code{pfa = 1}, \code{plflg = 1}, \code{bfflg = 1}, \code{ix = 0}, \code{iy = 0}, \code{nx = length(x)/2}, \code{ny = length(x)/2}, \code{datastr = "data")}.
}
}
\details{
To ensure that periodic structure seen in the spectral coherence image is not a consequence 
of an additive periodic mean, it is recommended that the \code{permest} function is first used to remove the periodic mean.
}
\value{
The program returns plot of squared coherence statistic values, that
exceed threshold.
}
\references{
Hurd, H. L., Gerr, N. L., (1991), Graphical Methods for Determining
the Presence of Periodic Correlation in Time Series, J.
Time Series Anal.,  (12),   pp. 337-350(1991).
\cr
\cr
Hurd, H. L., Miamee, A. G., (2007), Periodically Correlated Random Sequences: 
Spectral Theory and Practice, Wiley InterScience.

}
\author{
Harry Hurd 
}

\seealso{
 \code{\link{pgram}}, \code{\link{permest}}
}
\examples{
## Do not run 
## It could take a few seconds
\donttest{
data(volumes)
m=16
win=matrix(1/m,1,m)
dev.set(which=1)
scoh(t(volumes),m,win,datastr='volumes')}
}
\keyword{ squared coherence statistics }

