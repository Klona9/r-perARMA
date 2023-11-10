\name{arosa}
\alias{arosa}
\docType{data}
\title{
Monthly stratospheric ozone, Arosa
}
\description{
A fifty-year time series of monthly stratospheric ozone readings from Arosa, Switzerland. The dataset length is equal to 684, but some of the observations are missing (denoted by NaNs).
}
\usage{data(arosa)}
\format{
  The format is:
 Time-Series [1:684] from 1 to 684: NaN NaN NaN NaN NaN NaN 312 300 281 267 ...
}
\references{
Bloomfield, P., Hurd, H. L.,Lund, R., (1994), Periodic correlation
 in stratospheric ozone data. Journal of Time Series Analysis 15, 127-150.
}
\examples{
data(arosa)
str(arosa) 
}


