uniform.mutation <- function(func,lb,ub,pop,pop.size,dimension,pm){
	r <- matrix(runif(pop.size*dimension),nrow=pop.size)
	fitness <- rep(NA,pop.size)
	#it gets the index of genes being mutated
	idx <- which(r < pm, arr.ind=TRUE)
	pop[idx] <- lb[idx[,2]] + runif(nrow(idx)) * (ub[idx[,2]] - lb[idx[,2]])
	fitness <- apply(pop,1,func)
	return (list(pop = pop, fit = fitness))
}