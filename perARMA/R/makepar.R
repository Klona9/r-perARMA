makepar <- function(n,phi,del,nprep) {

    T_t=nrow(phi)
    p=ncol(phi)
    if (nargs()<4) {nprep=10}

    ntot=n+nprep*T_t 
    y=matrix(0,ntot,1)    
     if (length(del)!=T_t) 
         {stop("length(del)!=T")
          } else {
          if(p==1)
            {yold=0
             noise=rnorm(ntot)
             for(i in 1:ntot)
               {index=matlab::mod((i-1),T_t)+1 
                ytmp=phi[index,]%*%t(yold) + del[index]*noise[i]
                y[i]=ytmp
                yold=ytmp
               }
             }  else {
              yold=matrix(0,1,p)
         
              noise=rnorm(ntot)

              for(i in 1:ntot)
               {index=matlab::mod((i-1),T_t)+1 
                ytmp=phi[index,]%*%t(yold) + del[index]*noise[i]
                y[i]=ytmp
                yold=cbind(ytmp,yold[1,1:(p-1)])
                }
             }  
          }
      y=y[(nprep*T_t+1):ntot]

      result = list(y=y)   
      class(result) = "makepar"
      result

}