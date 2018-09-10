Rosenbrock <- function(x){
	d <- length(x)
	xi <- x[1:(d-1)]
	xnext <- x[2:d]
	sum <- sum(100*(xnext-xi^2)^2 + (xi-1)^2)
	return(sum)
}