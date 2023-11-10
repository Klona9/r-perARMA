\name{ab2phth}
\alias{ab2phth}
\alias{phth2ab}
\title{
Fourier representation of real matrix 
}
\description{
The function \code{ab2phth} transforms an input matrix 
\code{a} of size \eqn{T \times p} containing the sine and cosine 
coefficients in the real Fourier series representation, 
to the \eqn{T \times p} output matrix \code{phi} according to 
 \eqn{ \phi_{n,j} = a_{1,j} + \sum_{k=1}^{\left\lfloor T/2 \right\rfloor }(a_{2k,j} \cos(2\pi kn/T) + a_{2k+1,j} \sin(2\pi kn/T))}
 for \eqn{ n = 1, \ldots, T } and \eqn{ j = 1, \ldots, p}.
The inverse transformation is implemented in \code{phth2ab} function.
}
\usage{
ab2phth(a)
phth2ab(phi)
}
\arguments{
 \item{a}{matrix of \eqn{a_{n,j}} coefficients (size of \eqn{T \times p}).}
 \item{phi}{matrix of \eqn{\phi_{n,j}} coefficients (size of \eqn{T \times p}).
}
}
\value{
martix \code{phi} or \code{a} for \code{ab2phth} or \code{phth2ab}, respectively.
}
\author{
Harry Hurd
}
\seealso{
\code{\link{makepar}}, \code{\link{makeparma}},  \code{\link{parma_ident}}
}
\examples{
 m=matrix(seq(0,11),3,4)
 ab<-ab2phth(m)
 phi=ab$phi
 phth2ab(phi) 
}

