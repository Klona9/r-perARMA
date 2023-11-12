predseries <-function(real,x,T_t,p,start,...)
{
 predseries_full<-function(real,x,T_t,p,start,missval,predcol,realcol){

pm<-permest(x,T_t, 0.05, missval,'series', pp=0)
pmean=pm$pmean
xd=pm$xd
n=length(xd)
pred<-predictperYW(xd,T_t,p,missval, start, predcol, realcol)
xp=pred$x

xpm<-matrix(0,start,1)
for(i in 1:start){
if (i%%T_t==0) {xpm[i]=xp[i]+pmean[T_t]
              } else {
             xpm[i]=xp[i]+pmean[i%%T_t]}
             }

plot (xpm[n:start], xlab="time",ylab= "values of the series", type="l", lwd=1, lty=1,col=predcol)
lines(real[n:start], type="l", lwd=1, lty=1,col=realcol)     
title(main="Prediction of the series vs. real data",
  sub = paste("observations from",length(x)," to", start))
legend("bottomright", c("real series","predicted series"), fill=c(realcol,predcol),ncol=2,title="legend")
}

L<-modifyList(list(missval=NaN,predcol="red",realcol="blue"), list(real=real,x = x, T_t=T_t, p=p,start=start,...))

 do.call(predseries_full,L)

 }
