\name{R_w_ma}
\alias{R_w_ma}
\title{
Covariance matrix for PARMA model (conditional)
}
\description{
Procedure \code{R_w_ma} computes the covariance matrix of the moving average 
part of a PARMA sequence. 
This is used in maximum likelihood estimation in conjunction with 
the Ansley transformation method of computing the likelihood 
of the sample conditioned on the firt \code{m = max(p; q)}
 samples being ignored (or set to null); see Ansley or Brockwell and Davis for 
background on the procedure. The method avoids the cumbersome calculation of
full covariance matrix.
}
\usage{
R_w_ma(theta, nstart, nlen)
}
\arguments{
  \item{theta}{
 matrix of size \eqn{ T \times (q+1)} contains vectorial 
parameters \eqn{ [\theta_0,\theta_1,...,\theta_q]}, where
 \eqn{\theta(0,t)=\sigma(t)=del(t)}, thus
 \code{theta = [del,theta_1,...,theta_q]}.
}
  \item{nstart}{
starting time, for conditional likelihood in PARMA  set to \code{p+1}.
}
  \item{nlen}{
size of the covariance matrix.
}
}
\details{
Procedure \code{R_w_ma}  implements calculation of covariance matrix of size \code{nlen-p} from the parameters \code{theta} and \code{phi} of PARMA sequence.
 The result is returned  as two vectors, first containing non-zero 
elements of covariance matrix and the second containing indexes of this parameters.
Using these vectors covariance matrix can be easily reconstructed.
}
\value{
procedure returns covariance matrix in sparse format as following: 
\item{R}{vector of non-zero elements of covariance matrix.}
\item{rindex}{vector of indexes of non-zero elements.}
}
\references{
Ansley, (1979), An algorithm for the exact likelihood of a mixed autregressive moving average process, Biometrika, v.66, pp.59-65.
\cr
\cr
Brockwell, P. J., Davis, R. A. (1991), Time Series: Theory and Methods, 2nd Ed., Springer: New York.
}
\author{
Harry Hurd 
}
\seealso{
\code{\link{loglikec}},  \code{\link{loglikef}}
}
\examples{
T=12
nlen=480
p=2
 a=matrix(0,T,p)
q=1
 b=matrix(0,T,q)
a[1,1]=.8                  
a[2,1]=.3                 
                          
phia<-ab2phth(a) 
phi0=phia$phi          
phi0=as.matrix(phi0)        
      
b[1,1]=-.7	          
b[2,1]=-.6                  
thetab<-ab2phth(b)         
theta0=thetab$phi  
theta0=as.matrix(theta0) 
del0=matrix(1,T,1)    


R_w_ma(cbind(del0,theta0),p+1,T)    

}
\keyword{covariance of PARMA sequence}



