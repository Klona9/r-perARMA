#' @export
#' @importFrom matlab rem
#' @importFrom matlab isempty
#' @importFrom stats fft
#'
phth2ab <-
function(phi){

   T_t=nrow(phi)
   p=ncol(phi)

   A<-matrix(0,T_t,p)
   a<-matrix(0,T_t,p)
    for ( i in 1:p)
       {A[,i]=fft(phi[,i])/T_t }
  a[1,]=A[1,]
     kupper=floor((T_t-1)/2)
     evenind=seq(2,2*kupper,2)
     oddind=seq(3,2*kupper+1,2)
    a[evenind,]=2*Re(A[2:(kupper+1),])
    a[oddind,]=-2*Im(A[2:(kupper+1),])
     if (!matlab::rem(T_t,2))
       { a[T_t,]= Re(A[(T_t/2)+1,])}

 result = list(a=a)
    class(result) = "phth2ab"
    result
}

