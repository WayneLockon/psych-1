"fa.indeterm" <- 
function(x,f) {
if(nrow(x) != ncol(x)) {r <- cor(x,use="pairwise")} else {r <- x}
if((!is.matrix(f)) & (!is.data.frame(f))) f <- loadings(f)
nf <- ncol(f)
nv <- nrow(f)
rf <- cbind(r,f)
I <- diag(1,nf,nf)
fi <- cbind(t(f),I)
rf <- rbind(rf,fi)
weight <- matrix(NA,ncol=nf,nrow=nv)
for (i in 1:nf) {
wo  <-  solve(rf[-(nv+i),-(nv+i)],(fi[i,-(nv+i)]))
weight[,i] <- solve(rf[-(nv+i),-(nv+i)],(fi[i,-(nv+i)]))[1:nv]}
R2 <- diag(t(weight) %*% f )
return(R2)
}


