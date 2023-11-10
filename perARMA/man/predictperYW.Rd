\name{predictperYW}
\alias{predictperYW}
\alias{predseries}
\title{
Prediction for PAR model
}
\description{
Procedure \code{predictperYW} provideds the LMS  forecast
of a PAR(p) series. The Yule-Walker method is first use to 
estimate the LMS prediction coefficients using all the 
observed data in \code{x}.\cr
 Additionally, procedure \code{predseries}
 plots the predicted values of the series with real future
 values of the series (provided that such real data is 
available).
}
\usage{
predictperYW(x, T, p, missval, start,...)
predseries(real, x, T, p, start,...)
}
\arguments{
  \item{x}{
input time series.
}
  \item{T}{
period of PC-T structure.
}
  \item{p}{
order of autoregression, it is assumed constant over time.
}
  \item{missval}{
notation for missing values.
}
  \item{start}{
index of forecast value of the series; there are two possible scenarios:\cr
\code{start<length(x)} - procedure \code{predictperYW} enables to predict values of some piece of existing series (using Yule-Walker coefficients). 
In this case it is also 
necessary to define \code{end} value, as we want to predict values \code{x[start:end]} and compare them with known observations.\cr
\code{start>length(x)} - procedure \code{predictperYW} enables to predict future values of the series. In this scenario forecast of length \code{start-length(x)} 
is performed to 
find values \code{xp[length(x)+1:start]}.
In this case one can use also \code{predseries} procedure to compare predicted future of the series with real data (if such  data is 
available, see examples section).
}
 \item{real}{
the real future values of \code{x} series (historical data).
}
  \item{...}{other arguments that will be connected with plot: \code{realcol} is a color of konwn values and \code{predcol}
is a color of predicted values on the plot.
By default parameters are fixed to \code{realcol="blue"}, \code{predcol="red"}.
}
}
\value{
procedure \code{predictperYW} for \code{start<length(x)} plots values of \code{x[start:end]} and \code{xp[start:end]}, where \code{xp} are predicted values; for 
\code{start>length(x)} function returns and plots two series:
\item{x}{input series together with predicted values added.}
\item{new}{predicted part of the series only.}
Procedure \code{predseries} plots predicted and real values of the series on the same plot.
}
\references{
Box, G. E. P., Jenkins, G. M., Reinsel, G. (1994), Time Series Analysis, 3rd Ed., Prentice-Hall,
Englewood Cliffs, NJ.
\cr
\cr
Brockwell, P. J., Davis, R. A. (1991), Time Series: Theory and Methods, 2nd Ed., Springer: New York.
\cr
\cr
Gladyshev, E. G., (1961), Periodically Correlated Random Sequences, Sov. Math., 2, 385-388.
}
\author{
Wioletta Wojtowicz
}
\examples{
data(volumes)
permest_out<-permest(t(volumes),24, 0.05, NaN,'volumes', pp=0)
xd=permest_out$xd
dev.set(which=1)
predictperYW(xd,24,2,NaN,956,end=980)

dev.set(which=1)
predictperYW(xd[1:980],24,2,NaN,1004)

data(volumes.sep)
dev.set(which=1)
realdata=c(volumes,volumes.sep)
predseries(realdata,t(volumes[1:980]),24,2,1004)
}
