#' @export
#' @importFrom matlab rem
#' @importFrom matlab isempty
#' @importFrom stats fft

ab2phth <-
function(a)
{ a=as.matrix(a)
  if (matlab::isempty(a))
    {phi=matrix()
     } else {
    T_t=nrow(a)
    T_t=as.numeric(T_t)
    p=ncol(a)
    p=as.numeric(p)

    A<-matrix(0,T_t,p)
    phi<-matrix(0,T_t,p)
    A[1,]=a[1,]
    for ( k in 1:(floor((T_t-1)/2)) )
        {A[(k+1),]=complex(real=a[2*k,]/2, imaginary= -a[(2*k+1),]/2)
        A[(T_t-k+1),]=Conj(A[(k+1),])}
    if (!matlab::rem(T_t,2))
        {A[((T_t/2)+1),]=a[T_t,]}

      for ( j in 1:p)
      {phi[,j]=Re(T_t*fft(A[,j],inverse=TRUE)/T_t)}

     }
    result = list(phi=phi)
    class(result) = "ab2phth"
    result
}

