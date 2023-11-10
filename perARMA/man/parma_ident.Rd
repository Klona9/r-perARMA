                                                                                                                 
\name{parma_ident}
\alias{parma_ident}
\title{
Identification of PC-T structure
}
\description{
Procedure \code{parma_ident} utilizes a collection of procedures 
(functions) that together provide
 identification of PC structure in the series and saves results in the  \code{'ident.txt'} file, which is
located in the working directory.
This procedure could be applied to the original time series \code{x}  or to the residuals of fitted PARMA models
 to characterize the goodness of fit.
}
\usage{
parma_ident(x, T, missval, datastr, ...)
}
\arguments{
  \item{x}{
input time series.
}
  \item{T}{
period of PC-T structure.
}
  \item{missval}{
notation for missing values.
}
  \item{datastr}{
string name of data for printing.
}
  \item{...}{other arguments: \cr
 \code{outdir} is string name of the directory in which file \code{'ident.txt'} 
with results returned by \code{parma_ident} procedure will be saved,\cr
\code{details} should be equal to 1 to print all details.\cr
By default these parameters are fixed to
 \code{outdir='IDENT_OUT'}, \code{details=1}.
}
}
\details{
Procedure \code{parma_ident} provides a universal method for analyzing series
 or residuals. It calls following procedures:
\code{permest}, \code{persigest}, \code{peracf}, \code{Bcoeff}, \code{Bcoeffa}, \code{perpacf}, 
\code{ppfcoeffab}, \code{ppfplot}, \code{acfpacf}. 
}
\value{
procedure returns list of values:
\item{pmean}{periodic mean values,}
\item{xd}{series after removing periodic mean,}
\item{pstd}{periodic standard deviations values,}
\item{xn}{series obtained after removing periodic mean and divided by periodic standard deviations,}
as well as a text file \code{'ident.txt'} containing all the textual output generated 
in the running of \code{parma_ident}. 
}
\references{
Hurd, H. L., Miamee, A. G., (2007), Periodically Correlated Random Sequences: Spectral Theory and Practice, Wiley InterScience.
}
\author{
Harry Hurd 
}
\examples{

############### PC-T series simulation
T=12
nlen=480
descriptor='PARMA(2,1) periodic phis all del =1'
p=2
 a=matrix(0,T,p)
q=1
 b=matrix(0,T,q)
a[1,1]=.8                 
a[2,1]=.3                                                                
a[1,2]=-.9  
             
phia<-ab2phth(a) 
phi0=phia$phi            
phi0=as.matrix(phi0)       
      
b[1,1]=-.7	          
b[2,1]=-.6                  
thetab<-ab2phth(b)       
theta0=thetab$phi  
theta0=as.matrix(theta0) 
del0=matrix(1,T,1)        

makeparma_out<-makeparma(nlen,phi0,theta0,del0)                        
y=makeparma_out$y

############### parma_ident use
parma_ident(t(y),T,NaN,descriptor,outdir='PARMA21del1_ident')

}

