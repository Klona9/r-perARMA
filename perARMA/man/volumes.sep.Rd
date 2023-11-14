\name{volumes.sep}
\alias{volumes.sep}
\docType{data}
\title{
Volumes of energy, Nord Pool Spot Exchange, from 1st and 2nd September 2010.
}
\description{
One-dimenssional discrete time series, which conatins 48 real-valued 
observations of volumes of energy traded on the Nord Pool Spot Exchange.
These are omitted before the last two days of 
\code{volumes} data and are used to compare the predicted values 
of the series \code{volumes} with real values in \code{volumes.sep}.
}
\usage{data(volumes.sep)}
\format{
The format is:
 Time-Series [1:48] from 1 to 48: 25281 24576 24306 24266 24515 ...
}
\source{
Data were found on \url{http://www.npspot.com} ( Downloads -> Historical market data )
selecting \code{Elspot volumes} and \code{hourly} resolution to download file \code{Elspot\_volumes\_2010\_hourly.xls.}
}
\examples{
data(volumes.sep)
message(volumes.sep)
}