\name{parmafil}
\alias{parmafil}
\title{
PARMA filtration
}
\description{
Procedure \code{parmafil} filters the vector \code{x} according to matrices \code{a, b} containing PARMA model parameters. 
The function returns series \code{y} such that 
\eqn{a(n,1)*y(n) = b(n,1)*x(n) + b(n,2)*x(n-1) + \ldots + b(n,nb+1)*x(n-nb)- a(n,2)*y(n-1) - \ldots - a(n,na+1)*y(n-na)}.
}
\usage{
parmafil(b, a, x)
}
\arguments{
  \item{b}{matrix of size \eqn{T \times (nb+1)}, which elements satisfy \eqn{b(n,j)=b(n+T,j)}, usually in the literature \code{b} is called the periodic MA parameters and \eqn{nb}
 is denoted by \eqn{q}.
}
  \item{a}{matrix of size \eqn{T \times na}, which elements satisfy \eqn{a(n,j)=a(n+T,j)},  usually in the literature \code{a} is called the periodic AR parameters
 and \eqn{na} is denoted \eqn{p}. If \eqn{a(n,1)} is not equal to 1 for all \eqn{n}, the values of \eqn{a(n,j)} are normalized by \eqn{a(n,j)=a(n,j)/a(n,1)}.
}
  \item{x}{
input time series.
}
}
\value{
Filtered signal \code{y}.
}
\author{
Harry Hurd 
}
\note{
To filter using the convention \eqn{\phi(t,B)x(t) = \theta(t,B) \xi(t)}
with \eqn{\phi(t,B)=1 - \phi(t,1)B - ... - \phi(t,p)B^p}, 
\eqn{\theta(t,B)=del(t,1) + \theta(t,1)B + ... + \theta(t,q)B^q}
 set \code{a=[ones(T,1),-phi]}, \code{b=[theta]}, then \code{x=parmafil(b,a,xi)}.
}
\seealso{
\code{\link{loglikec}}, \code{\link{loglikef}}, \code{\link{makeparma}}
}
\examples{
b=matrix(c(1,1,0,0,.5,.5),2,3)
a=matrix(c(1,1,.5,.5),2,2)
s=sample(1:100,50, replace=TRUE)
x=matrix(s,50,1)

parmafil_out<-parmafil(a,b,x)
y=parmafil_out$y
plot(y,type="l")
}
