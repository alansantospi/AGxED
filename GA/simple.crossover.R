simple.crossover <- function(lb,ub,pop.size,dimension,pop,pc){
	new.pop <- matrix(rep(NA,pop.size*dimension), nrow = pop.size)
	r <- runif(pop.size)
	idx <- (r < pc)
	pop <- pop[idx,]
	tmp.pop.size <- nrow(pop)
	for (i in seq(1,pop.size, by = 2)){
		indivs <- sample(1:tmp.pop.size,2,replace = FALSE)
		cross.point <- sample(2:(dimension-1),1)
		offspring1 <- c(pop[indivs[1],1:cross.point],pop[indivs[2], (cross.point+1):dimension])
		offsprind2 <- c(pop[indivs[2],1:cross.point],pop[indivs[1], (cross.point+1):dimension])
		new.pop[i,] <- offspring1
		new.pop[i+1,] <- offsprind2
	}
	return (pop = new.pop)
}