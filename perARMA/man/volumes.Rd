\name{volumes}
\alias{volumes}
\docType{data}
\title{
Volumes of energy, Nord Pool Spot Exchange
}
\description{
One-dimensional discrete time series, which contains 984 real-valued 
observations of volumes of energy traded on the Nord Pool Spot Exchange from
July 6th to August 31st 2010. Analysed series contains the hourly records only from weekdays from the considered period. 
}
\usage{data(volumes)}
\format{
   The format is:
 Time-Series [1:984] from 1 to 984: 24888 24316 23755 23354 23290 ...
}
\source{
Data were found on \url{http://www.npspot.com} ( Downloads -> Historical market data )
selecting \code{Elspot volumes} and \code{hourly} resolution to download file \code{Elspot\_volumes\_2010\_hourly.xls.}
}
\examples{
data(volumes)
plot(volumes)
}

