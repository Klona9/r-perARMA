\name{pgram}
\alias{pgram}
\title{
Plotting the periodogram of time series
}
\description{
The periodogram is a classical tool 
based on the sample Fourier transform 
for finding periodic components in a time series. 
The procedure \code{pgram} computes and plots an average 
of \eqn{np} periodograms where \code{np=floor(length(x)/fftlen)} where the 
input parameter \code{fftlen} is the length of the FFT; to get just 
1 FFT of length \code{fftlen}, use \code{x(1:fftlen)} in place of \code{x}. To get a 
significance of high periodogram peaks, the procedure tests, 
at each frequency, the value of the averaged periodogram against 
the average of \code{2*halflen} neighboring cells (\code{halflen} on each side), 
and averaged over the \eqn{np} periodograms; the neighboring cell average 
is called the background. Significance of the ratio of center 
frequency average to the background average is computed from the 
F distribution. 
}
\usage{
pgram(x, fftlen,...)
}
\arguments{
 \item{x}{input time series, missing values denoted by NaNs will be
 replaced in \code{pgram} by zeros.
}
 \item{fftlen}{length of FFT which will be used. In \code{pgram} we can specify the desired length of the FFT, then \code{x} is divided into pieces of 
this length. FFT is done on each of these pieces and the resulting magnitude squares values are added,
 so average of the periodograms for each frequency is obtained. 
}
 \item{...}{other arguments that are connected with periodogram plot: \code{np1}, \code{np2}, \code{halflen}, \code{alpha}, \code{rejalpha}, \code{logsw}, 
\code{datastr}, \code{typeci}, \code{typepgram}, \code{colci}, \code{colpgram}, where \cr
\code{np1} and \code{np2} are frequency indexes of the first and the last frequency in the periodogram plot; it is required that
 \eqn{np1 > halflen} and usually \eqn{np2=\left \lfloor length(x)/2 \right \rfloor}, because periodogram is symmetric;\cr
 \code{halflen} is a value on each side of the center for background estimation, \cr
 \code{alpha} is significance level for testing for periodic components, \cr
 \code{rejalpha} is significance level for rejecting outliers in the background estimation, \cr
 \code{logsw} if is equal to 1 plot of the periodogram is in \eqn{\log} scale, else linear, \cr 
 \code{datastr} string name of data for printing, \cr
 Parameters \code{typeci} / \code{typepgram}, \code{colci} / \code{colpgram} define the type and colors of confidence intervals / periodogram values on the plot.\cr
By default they are fixed to \code{np1 = 5}, \code{np2 = fftlen/2}, \code{halflen = 4}, \code{alpha = .05}, \code{rejalpha = .01}, \code{logsw = 1}, 
\code{datastr = 'data'}, \code{typeci = "b"}, \code{typepgram = "b"}, \code{colci = "red"}, \code{colpgram = "blue"}.
}
}
\details{
When we assume that period \code{T_t} of PC-T structure is unknown, 
function \code{pgram} enables us to find
candidate for the period length assuming the period of 
the second order structure is the same as the period of 
the first order structure (IE, in the series itself).
}
\value{
For any FFT index \eqn{j} (say where a strong peak occurs)
\eqn{j} corresponds to the number of cycles in the FFT window, 
so the period can be easily computed as \code{T_t = fftlen/j}.
}
\references{
Box, G. E. P., Jenkins, G. M., Reinsel, G. (1994), Time Series Analysis, 3rd Ed., Prentice-Hall,
Englewood Cliffs, NJ.
\cr
\cr
Hurd, H. L., Miamee, A. G., (2007), Periodically Correlated Random Sequences: 
Spectral Theory and Practice, Wiley InterScience.\cr
}
\author{
Harry Hurd 
}

\seealso{
 \code{\link{scoh}}
}
\examples{
data(volumes)
dev.set(which=1)
pgram(t(volumes),length(volumes),datastr='volumes')
}
\keyword{periodogram}

