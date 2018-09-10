Zakharov <- function(xx){
  
  ii <- c(1:length(xx))
  sum1 <- sum(xx^2)
  sum2 <- sum(0.5*ii*xx)
  
  y <- sum1 + sum2^2 + sum2^4
  return(y)
}

