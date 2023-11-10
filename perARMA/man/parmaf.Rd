\name{parmaf}
\alias{parmaf}
\title{
PARMA coefficients estimation
}
\description{
Procedure \code{parmaf} enables the estimation of parameters of the chosen representation of PARMA(p,q) model. For general PARMA we use non-linear 
optimization methods to obtain minimum of negative logarithm of likelihood function using \code{loglikef} procedure. Intitial values of parameters are computed using Yule-Walker equations.
}
\usage{
parmaf(x, T, p, q, af, bf, ...)
}
\arguments{
  \item{x}{
input time series.
}
  \item{T}{
period length of PC-T structure.
}
  \item{p}{
maximum PAR order, which is a number of columns in \code{af}.
}
  \item{q}{
maximum PMA order, which is a number of columns in \code{bf} diminished by 1.
}
  \item{af}{
\eqn{T \times p} logical values matrix pointing to active frequency 
components for \code{phi}.
}
  \item{bf}{
\eqn{T \times (q+1)} logical matrix pointing to active frequency 
components for \code{theta}.
}
  \item{...}{
Other arguments:\cr
\code{a0} starting value for \code{a}, where \code{a} is Fourier representation of
 \code{phi} (use \code{phi=ab2phth(a)} to recover \code{phi});
 if \code{a0} is not defined Yule Walker method is used to estimate it;\cr
\code{b0} starting values for \code{b}, where \code{b} is Fourier representation of
 \code{theta} (use \code{del=ab2phth(b[,1])} 
to recover \code{del} and use \code{theta = ab2phth(b[,2:q+1])} to recover 
\code{theta});
 if \code{b0} is not defined Yule Walker method is used to estimate it;\cr
 \code{stype}  numeric parameter connected with covariance matrix computation, so far should be equal to 0 to use procedure 
\code{R_w_ma} (see \code{R_w_ma} description). In the future also other values of \code{stype} will be available for 
full covariance matrix computation. 
}
}
\details{
In order to obtain maximum likelihood estimates of model parameters \code{a} and \code{b}
we use a numerical optimization method to minimalize value of \code{y} (as negative value of logarithm of loglikelihood function returned by \code{loglikef}) 
over parameter values. Internally, parameters \code{a} and \code{b} are
 converted to \code{phi}  and \code{theta} as needed via function 
\code{ab2phth}. For the present we use \code{optim} function with defined \code{method="BFGS"} (see code for more details). 
}
\value{
list of values:
\item{a}{is matrix of Fourier coefficients determining \code{phi}.}
\item{b}{is matrix of Fourier corfficients determining \code{theta}.}
\item{negloglik}{minimum value of negative logarithm of likehood function.}
\item{aicval}{value of AIC criterion.}
\item{fpeval}{value of FPE criterion.}
\item{bicval}{value of BIC criterion.}
\item{resids}{series of residuals.}
}
\references{
Box, G. E. P., Jenkins, G. M., Reinsel, G. (1994), Time Series Analysis, 3rd Ed., Prentice-Hall, Englewood Cliffs, NJ.
\cr
\cr
Brockwell, P. J., Davis, R. A., (1991), Time Series: Theory and Methods, 2nd Ed., Springer: New York.
\cr 
\cr
Jones, R., Brelsford, W., (1967), Time series with periodic structure, Biometrika 54, 403-408.
\cr
\cr
Vecchia, A., (1985), Maximum Likelihood Estimation for Periodic Autoregressive Moving Average Models, Technometrics, v. 27, pp.375-384.
}
\author{
Harry Hurd 
}
\seealso{
\code{\link{loglikef}}, \code{\link{perYW}},  \code{\link{R_w_ma}},   
}
\examples{

######## simulation of periodic series
T=12
nlen=480
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

## Do not run 
## It could take more than one minute

############ fitting of PARMA(0,1) model
#p=0
#q=1
#af=matrix(0,T,p)
#bf=matrix(0,T,q+1)
#bf[1,1]=1
#bf[1:3,2]=1

#parmaf(y,T,p,q,af,bf)

############ fitting of PARMA(2,0) model
#p=2
#q=0
#af=matrix(0,T,p)
#bf=matrix(0,T,q+1)
#af[1:3,1]=1       
#af[1:3,2]=1
#bf[1,1]=1

#parmaf(y,T,p,q,af,bf)

############ fitting of PARMA(2,1) model
#p=2
#q=1
#af=matrix(0,T,p)
#bf=matrix(0,T,q+1)
#af[1:3,1]=1       
#af[1:3,2]=1
#bf[1,1]=1
#bf[1:3,2]=1

#parmaf(y,T,p,q,af,bf)
}

